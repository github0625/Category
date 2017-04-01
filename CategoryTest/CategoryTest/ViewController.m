//
//  ViewController.m
//  CategoryTest
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "ViewController.h"
#import "NSString+category.h"
#import "UIView+category.h"
#import "UIColor+category.h"
#import "NSDate+category.h"
#import "UIImageView+category.h"
#import "UIImage+category.h"
@interface ViewController ()
{
    UIView * testView;
    UILabel *label1;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *s1=@"jkdsjkdsjksadjkasd";
    //用类目方法实现，该方法属于NSString
    NSNumber *n1=[s1 lengthASNumber];
    NSLog(@"n====%@",n1);
    
    
    testView=[[UIView alloc]initWithFrame:CGRectMake(10, 100, 100, 50)];
    testView.backgroundColor=[UIColor cyanColor];
    testView.layer.cornerRadius = 70;
    [testView.layer setMasksToBounds:YES];
    [self.view addSubview:testView];
    
    
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 240, 280, 40)];
    label1.backgroundColor = [UIColor grayColor];
    label1.adjustsFontSizeToFitWidth=YES;
    label1.text = @"测试NSDate类目 显示";
    label1.font = [UIFont fontWithName:@"Arial" size:30];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor blueColor];
    [self.view addSubview:label1];
    
    
    //GIF图片加载  利用UIImageView的类目
    UIImageView *imageView = [[UIImageView alloc ] initWithFrame:CGRectMake(50, CGRectGetMaxY(label1.frame)+20, 100, 100)];
    UIImage *image = [UIImage imageNamed:@"image_photo"];
    imageView.backgroundColor=[UIColor redColor];
    [imageView  cc_setImage:[NSURL URLWithString:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3097288950,2556487333&fm=23&gp=0.jpg"]];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    
    //普通图片加载  利用UIImage的类目
    UIImageView *imageDown = [[UIImageView alloc ] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+10, CGRectGetMaxY(label1.frame)+20, 100, 100)];
    
    imageDown.backgroundColor=[UIColor redColor];
    imageDown.image= [UIImage  getImageFromURL:@"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D200/sign=bc0dd5a3a4345982da8ae2923cf6310b/d009b3de9c82d158e76f1866890a19d8bd3e4273.jpg"];
    [self.view addSubview:imageDown];
    
    
    UIButton * testButton=[UIButton buttonWithType:UIButtonTypeSystem];
    testButton.frame=CGRectMake(CGRectGetMaxX(testView.frame), CGRectGetMaxY(imageDown.frame)+20, 100, 50);
    testButton.backgroundColor=[UIColor yellowColor];
    testButton.layer.cornerRadius = 5;
    [testButton.layer setMasksToBounds:YES];
    [testButton setTitle:@"点我" forState:0];
    [testButton addTarget:self action:@selector(clickTestButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    
}

-(void)clickTestButton
{
    //UIView的类目实现
    [testView startRotateAnimation];
    
    //UIColor的类目实现
    testView.backgroundColor=[UIColor colorWithHexRGB:@"#99887"];
    
    //NSDate的类目实现
    NSDate * date=[[NSDate alloc]init];
    label1.text= [date minuteDescription];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
