//
//  NSDate+category.h
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (category)
- (NSString *)timeIntervalDescription;//距离当前的时间间隔
- (NSString *)minuteDescription;//精确到分钟的日期
- (NSString *)formattedDateDescription;//格式化日期
@end
