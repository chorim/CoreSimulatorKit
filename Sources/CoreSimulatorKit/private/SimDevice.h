//
//  SimDevice.h
//
//
//  Created by Insu Byeon on 2023/05/07.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SimRuntime;

typedef NS_ENUM(NSInteger, SimDeviceState) {
    SimDeviceStateCreating,
    SimDeviceStateShutdown,
    SimDeviceStateBooting,
    SimDeviceStateBooted,
    SimDeviceStateShuttingDown
};

@interface SimDevice : NSObject
@property (nonatomic, copy) NSUUID * _Nonnull UDID;
@property (nonatomic, readonly) NSString * _Nonnull name;
@property (nonatomic, readonly) SimRuntime * _Nonnull runtime;
@property (nonatomic, readonly) SimDeviceState * _Nonnull state;
@end

NS_ASSUME_NONNULL_END
