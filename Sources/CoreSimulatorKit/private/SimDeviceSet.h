//
//  SimDeviceSet.h
//  
//
//  Created by Insu Byeon on 2023/05/07.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SimDevice;

@interface SimDeviceSet : NSObject
@property (nonatomic, readonly) NSArray <SimDevice *>* _Nonnull devices;
@end
NS_ASSUME_NONNULL_END
