//
//  UIImageView+category.m
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "UIImageView+category.h"
#import <ImageIO/ImageIO.h>
@implementation UIImageView (category)


-(void)gifWithUrl:(NSURL *)url
       returnData:(void(^)(NSArray<UIImage *> * imageArray,
                           NSArray<NSNumber *>*timeArray,
                           CGFloat totalTime,
                           NSArray<NSNumber *>* widths,
                           NSArray<NSNumber *>* heights))dataBlock
{
    //通过文件的 url 来将 gif 文件读取为图片数据引用
    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)url,NULL);
    //获取 gif 文件中的图片个数
    size_t count = CGImageSourceGetCount(source);
    //定义一个变量记录 gif 播放一轮的时间
    float allTime = 0;
    //存放所有图片
    NSMutableArray *imageArray = [NSMutableArray array];
    //存放每一帧播放的时间
    NSMutableArray *timeArray = [NSMutableArray array];
    //存放每张图片的宽度（一般在一个 gif 文件中，所有文件的尺寸都一样）
    NSMutableArray *widthArray = [NSMutableArray array];
    //存放每张图片的高度
    NSMutableArray * heightArray = [NSMutableArray array];
    //遍历
    for(size_t i = 0;i < count; i++){
        //获取图片信息
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        [imageArray addObject:(__bridge UIImage *)(image)];
        CGImageRelease(image);
        //获取图片信息
        NSDictionary *info = (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        NSLog(@"%@",info);
        CGFloat width = [[info objectForKey:(__bridge NSString *)kCGImagePropertyPixelWidth]floatValue];
        CGFloat height = [[info objectForKey:(__bridge NSString *)kCGImagePropertyPixelHeight]floatValue];
        [widthArray addObject:[NSNumber numberWithFloat:width]];
        [heightArray addObject:[NSNumber numberWithFloat:height]];
        
        NSDictionary *timeDic = [info objectForKey:(__bridge NSString *)kCGImagePropertyGIFDictionary];
        CGFloat time = [[timeDic objectForKey:(__bridge NSString *)kCGImagePropertyGIFDelayTime]floatValue];
        allTime += time;
        [timeArray addObject:[NSNumber numberWithFloat:time]];
    }
    dataBlock(imageArray,timeArray,allTime,widthArray,heightArray);
}


#pragma mark -- 加载 GIF
- (void)cc_setImage:(NSURL *)imageUrl {
    __weak id _self = self;
    [self gifWithUrl:imageUrl returnData:^(NSArray<UIImage *> *imageArray, NSArray<NSNumber *> *timeArray, CGFloat totalTime, NSArray<NSNumber *> *widths, NSArray<NSNumber *> *heights) {
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
        NSMutableArray * times = [[NSMutableArray alloc]init];
        float currentTime = 0;
        //设置每一帧的时间占比
        for (int i = 0; i < imageArray.count; i++) {
            [times addObject:[NSNumber numberWithFloat:currentTime/totalTime]];
            currentTime += [timeArray[i] floatValue];
        }
        [animation setKeyTimes:times];
        [animation setValues:imageArray];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        //设置循环
        animation.repeatCount= MAXFLOAT;
        //设置播放总时长
        animation.duration = totalTime;
        //Layer层添加
        [[(UIImageView *)_self layer]addAnimation:animation forKey:@"gifAnimation"];
    }];
}





@end
