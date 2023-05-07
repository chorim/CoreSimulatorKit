//
//  CoreSimulatorController.m
//  
//
//  Created by Insu Byeon on 2023/05/07.
//

#import "CoreSimulatorController.h"
#import "CoreSimulatorDevice.h"
#import <dlfcn.h>

#import "private/SimServiceContext.h"
#import "private/SimDevice.h"
#import "private/SimDeviceSet.h"

static SimDeviceSet *defaultSet = nil;

@implementation CoreSimulatorController
+ (NSArray <CoreSimulatorDevice *>*)availableDevices {
    NSMutableArray<CoreSimulatorDevice *> *bootedDevice = [[NSMutableArray alloc] init];
    
    for (SimDevice *device in defaultSet.devices) {
        if ((NSInteger)device.state == SimDeviceStateBooted) {
            CoreSimulatorDevice *simulatorDevice = [[CoreSimulatorDevice alloc] initWithDevice:device];
            [bootedDevice addObject:simulatorDevice];
        }
    }
    
    return bootedDevice;
}

+ (void)initialize {
    NSString *frameworkPath = @"/Library/Developer/PrivateFrameworks/CoreSimulator.framework/CoreSimulator";
    if (!load_bundle(frameworkPath)) {
        NSLog(@"CoreSimulatorController: CoreSimulator '%s': Load failed!", frameworkPath.UTF8String);
        return;
    }
    
    NSString *path = getActiveDeveloperDir();
    if (!path) {
        NSLog(@"CoreSimulatorController: Could not get active developer directory! '%s'", frameworkPath.UTF8String);
        return;
    }
    
    NSError *error = nil;
    
    Class _SimServiceContext = NSClassFromString(@"SimServiceContext");
    SimServiceContext* context = NULL;
    if ([_SimServiceContext respondsToSelector:@selector(serviceContextForDeveloperDir:error:)]) {
        context = [_SimServiceContext serviceContextForDeveloperDir:path error:&error];
    }

    if (!context || (error != nil)) {
        NSLog(@"CoreSimulatorController: Could not create 'SimServiceContext' instance.");
        return;
    }
    
    SimDeviceSet *deviceSet = NULL;
    if ([context respondsToSelector:@selector(defaultDeviceSetWithError:)]) {
        deviceSet = [context defaultDeviceSetWithError:&error];
    }
    
    if (!deviceSet || (error != nil)) {
        NSLog(@"CoreSimulatorController: Could not get default 'SimDeviceSet'.");
        return;
    }
    
    defaultSet = deviceSet;
}

static inline void* _Nullable load_bundle(NSString * _Nonnull path) {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSLog(@"Bundle at path %s: Not found!", path.UTF8String);
        return nil;
    }
    void* fw = dlopen(path.UTF8String, RTLD_NOW | RTLD_GLOBAL);
    if (!fw) {
        NSLog(@"Bundle at path %s: Could not be opened. Reason: %s", path.UTF8String, dlerror());
        return nil;
    }
    return fw;
}

static inline NSString * _Nullable getActiveDeveloperDir() {
    NSString *xcodeSelectPath = @"/usr/bin/xcode-select";

    if (![NSFileManager.defaultManager fileExistsAtPath:xcodeSelectPath]) {
        NSLog(@"xcode-select '%s': Not found!", xcodeSelectPath.UTF8String);
        return nil;
    }

    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;

    NSTask *task = [[NSTask alloc] init];
    task.launchPath = xcodeSelectPath;
    task.arguments = @[@"-p"];
    task.standardOutput = pipe;
    [task launch];
    [task waitUntilExit];

    NSString *grepOutput = nil;

    if (task.terminationStatus == 0) {
        grepOutput = [[NSString alloc] initWithData:[file readDataToEndOfFile] encoding:NSUTF8StringEncoding];
    } else {
        NSLog(@"xcode-select '%s': Failed with error code %d", xcodeSelectPath.UTF8String, task.terminationStatus);
    }
    [file closeFile];

    return grepOutput;
}
@end
