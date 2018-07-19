

//
//  WebViewScrollView.m
//  WYDragLayout
//
//  Created by 薇谙 on 2018/7/18.
//  Copyright © 2018年 WY. All rights reserved.
//

#import "WebViewScrollView.h"
#import <WebKit/WebKit.h>

@interface WebViewScrollView ()<WKUIDelegate,WKNavigationDelegate,UIScrollViewDelegate>

@property (strong, nonatomic)WKWebView* webView;

@end

@implementation WebViewScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}
#pragma mark ---- scrollView delegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY <= -100) {
        if (self.webViewDelegate && [self.webViewDelegate respondsToSelector:@selector(pullDragAndShowProduct)]) {
            [self.webViewDelegate pullDragAndShowProduct];
        }
    }
}

- (void)setSelfDataWithObj:(id)objData
{
    if (!objData) {
        return;
    }
    NSString* urlString = objData;
    [self.webView loadRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:urlString]]];    
}

#pragma mark private
- (void)setupSubViews
{
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, KScreenHeight)];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    self.webView.scrollView.scrollEnabled = YES;
    self.webView.scrollView.delegate = self;
    [self addSubview:self.webView];
}


@end
