//
//  CoreSimulatorDevice.h
//  
//
//  Created by Insu Byeon on 2023/05/07.
//

#ifndef CoreSimulatorDevice_h
#define CoreSimulatorDevice_h

#import <Foundation/Foundation.h>

@class SimDevice;

@interface CoreSimulatorDevice : NSObject
@property (nonatomic, copy) NSString * _Nonnull uuid;
@property (nonatomic, readonly) NSString * _Nonnull name;
@property (nonatomic, readonly) NSString * _Nonnull productName;
@property (nonatomic, readonly) NSString * _Nonnull productVersion;

- (instancetype)initWithDevice:(SimDevice*)device;
@end
#endif /* CoreSimulatorDevice_h */
