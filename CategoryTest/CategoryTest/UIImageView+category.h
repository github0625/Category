//
//  UIImageView+category.h
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (category)
-(void)gifWithUrl:(NSURL *)url
       returnData:(void(^)(NSArray<UIImage *> * imageArray,
                           NSArray<NSNumber *>*timeArray,
                           CGFloat totalTime,
                           NSArray<NSNumber *>* widths,
                           NSArray<NSNumber *>* heights))dataBlock;
- (void)cc_setImage:(NSURL *)imageUrl;

@end
