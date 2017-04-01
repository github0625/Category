//
//  NSString+category.m
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "NSString+category.h"

@implementation NSString (category)

-(NSNumber *)lengthASNumber
{   //self为调用该方法的对象，自己调用自己的方法
    int length=(int)[self length];
    NSNumber *n=[NSNumber numberWithInt:length];
    return n;
}

@end
