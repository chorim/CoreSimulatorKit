//
//  SimServiceContext.h
//  
//
//  Created by Insu Byeon on 2023/05/07.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SimDeviceSet;

@interface SimServiceContext : NSObject
+ (instancetype _Nonnull)serviceContextForDeveloperDir:(NSString * _Nonnull)path
                                                 error:(NSError * _Nullable * _Nullable)error;
- (SimDeviceSet * _Nonnull)defaultDeviceSetWithError:(NSError * _Nullable * _Nullable)error;
@end
NS_ASSUME_NONNULL_END
