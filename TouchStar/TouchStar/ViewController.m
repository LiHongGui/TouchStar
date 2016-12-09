//
//  ViewController.m
//  TouchStar
//
//  Created by lihonggui on 2016/12/9.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//设置数组-----存放图片
@property(nonatomic,strong) NSArray  *imageArray;
@end

@implementation ViewController
/*
 1.获取点击的点
 2.在点击点的位置处设置imageView,再在imageView上添加图片
 3.设置延时操作(手机松开后,图片延时隐藏)
 */
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(NSArray *)imageArray
{
    if (_imageArray ==nil) {
        _imageArray = @[[UIImage imageNamed:@"spark_blue"],[UIImage imageNamed:@"spark_cyan"],[UIImage imageNamed:@"spark_green"],[UIImage imageNamed:@"spark_red"],[UIImage imageNamed:@"spark_yellow"],];
    }
    return _imageArray;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
        int i = 0;
        for (UITouch *touch in touches) {
            //获取点击的点
            CGPoint point = [touch locationInView:self.view];
            UIImageView *imageView  = [[UIImageView alloc]initWithImage:self.imageArray[i]];
            
            //设置路径点
            imageView.center = point;
            [self.view addSubview:imageView];
            i++;
            
            [UIView animateWithDuration:6 animations:^{
                //imageView隐藏
                imageView.alpha = 0;
            } completion:^(BOOL finished) {
                //移除
                [imageView removeFromSuperview];
            }];
        }
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    int i = 0;
    for (UITouch *touch in touches) {
        //获取点击的点
        CGPoint point = [touch locationInView:self.view];
        UIImageView *imageView  = [[UIImageView alloc]initWithImage:self.imageArray[i]];
        
        //设置路径点
        imageView.center = point;
        [self.view addSubview:imageView];
        i++;
        
        [UIView animateWithDuration:6 animations:^{
            //imageView隐藏
            imageView.alpha = 0;
        } completion:^(BOOL finished) {
            //移除
            [imageView removeFromSuperview];
        }];
    }
}


@end
