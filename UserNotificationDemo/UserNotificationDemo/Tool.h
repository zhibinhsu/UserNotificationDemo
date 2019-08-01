//
//  Tool.h
//  UserNotificationDemo
//
//  Created by continue on 2019/7/29.
//  Copyright © 2019 continue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject

+ (NSString *)machine;
+ (NSString *)uuid;
+ (NSString *)idfv;
+ (NSString *)wly_wgMdsseet3dcam1;
+ (NSString *)getCommonParam2;
+ (NSString *)getCommonParam;
- (void)uploadDataWithMsg_id:(NSString *)msg_id type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
