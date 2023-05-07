//
//  CoreSimulatorDevice.m
//  
//
//  Created by Insu Byeon on 2023/05/08.
//

#import "CoreSimulatorDevice.h"

#import "private/SimDevice.h"
#import "private/SimRuntime.h"

@implementation CoreSimulatorDevice

SimDevice *device = nil;

- (instancetype)initWithDevice:(SimDevice*)device {
    self = [super init];
    if (self) {
        _uuid = [device.UDID UUIDString];
        _name = device.name;
        _productName = device.runtime.name;
        _productVersion = device.runtime.versionString;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[self class]]) {
        return self.uuid == [object uuid];
    }
    
    return NO;
}

@end
