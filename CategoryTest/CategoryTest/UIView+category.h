//
//  UIView+category.h
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (category)

- (void)startShakeAnimation;//摇动动画
- (void)stopShakeAnimation;
- (void)startRotateAnimation;//360°旋转动画
- (void)stopRotateAnimation;

///截图
- (UIImage *)screenshot;

@property (nonatomic) float top;
@property (nonatomic) float bottom;
@property (nonatomic) float left;
@property (nonatomic) float right;

@end
