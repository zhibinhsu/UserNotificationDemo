//
//  ViewController.m
//  UserNotificationDemo
//
//  Created by continue on 2019/7/16.
//  Copyright © 2019 continue. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "Tool.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc] init];
    self.webView.delegate = self;
    self.webView.frame = self.view.bounds;
    [self.view addSubview:self.webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"URL"]];
    [self.webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSString *absoluteStr = request.URL.absoluteString;
    if ([absoluteStr containsString:@"wdlink://PushJSRequest"]) {

        NSString *str = [NSString stringWithFormat:@"getPushInfo(%@,'%@')", [Tool getCommonParam2], [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceString"]];
        [self.webView stringByEvaluatingJavaScriptFromString:str];
        return NO;
    }
    return YES;
}



@end
