//
//  WebViewScrollView.h
//  WYDragLayout
//
//  Created by 薇谙 on 2018/7/18.
//  Copyright © 2018年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WebViewScrollViewDelegate <NSObject>

- (void)pullDragAndShowProduct;

@end

@interface WebViewScrollView : UIView

@property (nonatomic,weak) id<WebViewScrollViewDelegate>webViewDelegate;

- (void)setSelfDataWithObj:(id)objData;

@end
