//
//  SimRuntime.h
//  
//
//  Created by Insu Byeon on 2023/05/07.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SimRuntime : NSObject
@property (nonatomic, copy) NSString * _Nonnull name;
@property (nonatomic, copy) NSString * _Nonnull versionString;
@property (nonatomic, copy) NSString * _Nonnull identifier;
@property (nonatomic, retain) NSBundle * _Nonnull bundle;
@end

NS_ASSUME_NONNULL_END
