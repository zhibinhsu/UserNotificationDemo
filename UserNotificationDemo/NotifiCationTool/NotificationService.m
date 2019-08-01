//
//  NotificationService.m
//  NotifiCationTool
//
//  Created by continue on 2019/7/30.
//  Copyright © 2019 continue. All rights reserved.
//

#import "NotificationService.h"
#import "Tool.h"

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
     
    Tool *tool = [[Tool alloc] init];
    [tool uploadDataWithMsg_id:request.content.userInfo[@"msg_id"] type:@"6"];
    contentHandler([request.content mutableCopy]);
}

@end
