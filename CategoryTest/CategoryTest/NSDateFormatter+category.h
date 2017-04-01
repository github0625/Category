//
//  NSDateFormatter+category.h
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (category)


+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)defaultDateFormatter;

@end
