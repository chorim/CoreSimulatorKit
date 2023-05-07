//
//  SimDeviceBootInfo.h
//  
//
//  Created by Insu Byeon on 2023/05/07.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SimDeviceBootInfo : NSObject
@property(nonatomic, retain) NSDictionary * _Nonnull info;
@property(nonatomic) BOOL isTerminalStatus;
@property(nonatomic) NSUInteger status;
@end

NS_ASSUME_NONNULL_END
