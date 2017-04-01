//
//  UIImage+category.h
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (category)
//图片拉伸、平铺接口
- (UIImage *)resizableImageWithCompatibleCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode;
//图片以ScaleToFit方式拉伸后的CGSize
- (CGSize)sizeOfScaleToFit:(CGSize)scaledSize;

//将图片转向调整为向上
- (UIImage *)fixOrientation;

//以ScaleToFit方式压缩图片
- (UIImage *)compressedImageWithSize:(CGSize)compressedSize;

//下载图片
+(UIImage *) getImageFromURL:(NSString *)fileURL;

@end
