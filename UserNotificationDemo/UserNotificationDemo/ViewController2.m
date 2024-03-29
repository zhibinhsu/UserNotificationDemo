//
//  ViewController2.m
//  UserNotificationDemo
//
//  Created by continue on 2019/7/26.
//  Copyright © 2019 continue. All rights reserved.
//

#import "ViewController2.h"
#import <WebKit/WebKit.h>
#import "Tool.h"

@interface ViewController2 ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *wkwebView;

@end

@implementation ViewController2

- (void)viewDidLoad {

    self.wkwebView = [[WKWebView alloc] init];
    self.wkwebView.backgroundColor = [UIColor whiteColor];
    self.wkwebView.navigationDelegate = self;
    self.wkwebView.frame = self.view.bounds;
    [self.view addSubview:self.wkwebView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"URL"]];
    [self.wkwebView loadRequest:request];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSString *absoluteStr = navigationAction.request.URL.absoluteString;
    if ([absoluteStr containsString:@"wdlink://PushJSRequest"]) {
        
        NSString *str = [NSString stringWithFormat:@"getPushInfo(%@,'%@')", [Tool getCommonParam2], [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceString"]];
        [self.wkwebView evaluateJavaScript:str completionHandler:^(id _Nullable label, NSError * _Nullable error) {
        }];
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}


@end
