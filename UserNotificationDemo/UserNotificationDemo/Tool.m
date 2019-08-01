//
//  Tool.m
//  UserNotificationDemo
//
//  Created by continue on 2019/7/29.
//  Copyright © 2019 continue. All rights reserved.
//

#import "Tool.h"

@implementation Tool


+ (NSString *)getCommonParam2 {
    
    NSString *net_type = @"wifi";
    NSString *os_ver = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *commonParam = [NSString stringWithFormat:@"'%@','%@'", net_type, os_ver];
    return commonParam;
}

+ (NSString *)getCommonParam {
    
    NSString *net_type = @"wifi";
    NSString *os_ver = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *commonParam = [NSString stringWithFormat:@"net_type=%@&os_ver=%@", net_type, os_ver];
    return commonParam;
}

- (void)uploadDataWithMsg_id:(NSString *)msg_id type:(NSString *)type {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://method=user.push"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 30;
    NSString *args = [NSString stringWithFormat:@"%@&msg_id=%@&type=%@", [Tool getCommonParam], msg_id, type];
    request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    }];
    [sessionDataTask resume];
}

@end
