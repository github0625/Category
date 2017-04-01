//
//  UIColor+category.m
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "UIColor+category.h"

@implementation UIColor (category)

/*由16进制字符串获取颜色*/
+ (UIColor *)colorWithHexRGB:(NSString *)hexRGBString
{
    
    if ([hexRGBString hasPrefix:@"#"]) {
        
        hexRGBString = [hexRGBString substringFromIndex:1];
    }
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (hexRGBString) {
        NSScanner *scanner = [NSScanner scannerWithString:hexRGBString];
        [scanner scanHexInt:&colorCode];
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    
    return [UIColor colorWithRed:(float)redByte/0xff green:(float)greenByte/0xff blue:(float)blueByte/0xff alpha:1.0];
}

@end
