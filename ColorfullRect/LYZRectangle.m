//
//  LYZRectangle.m
//  ColorfullRect
//
//  Created by 李懿哲 on 8/11/15.
//  Copyright (c) 2015 lyzz. All rights reserved.
//

#import "LYZRectangle.h"

@implementation LYZRectangle
-(instancetype)init{
           if (self = [super init]) {
                      _flagHoriz = arc4random() % 2;
                      _flagVerti = arc4random() % 2;
                      _speedHoriz = arc4random() % 7 + 1;
                      _speedVerti = arc4random() % 10 + 1;
           }
           return self;
}
+(UILabel *)getRectLabel{
           //获取屏幕宽高
           int screenWidth = [UIScreen mainScreen].bounds.size.width;
           int screenHeight = [UIScreen mainScreen].bounds.size.height;
           UILabel *label = [UILabel new];
           //随机颜色
           label.backgroundColor = [UIColor colorWithRed:(arc4random() % 255 + 1) / 255.0 green:(arc4random() % 255 + 1) / 255.0 blue:(arc4random() % 255 + 1) / 255.0 alpha:(arc4random() % 6 + 95.0) / 100];
           //随机长宽
           label.frame = CGRectMake(0, 0, arc4random() % (screenWidth / 4) + 30, arc4random() % (screenHeight / 5) + 15);
           //随机出生点
           label.center = CGPointMake(arc4random() % 310 + 10, arc4random() % 500 + 68);
           //如果生产的图形越界了，重新制造
           if (label.frame.origin.x + label.frame.size.width > screenWidth
               || label.frame.origin.y + label.frame.size.height > screenHeight
               || label.frame.origin.x + label.frame.size.width < 0
               || label.frame.origin.y + label.frame.size.height < 0) {
                      label = [LYZRectangle getRectLabel];
           }
           
           return label;
}
-(UILabel *)getRect{
          return [LYZRectangle getRectLabel];
}
-(LYZRectangle *)getLYZRect{
           LYZRectangle *rect = [LYZRectangle new];
           rect.label = [self getRect];
           rect.width = rect.label.frame.size.width;
           rect.height = rect.label.frame.size.height;
           return rect;
}
@end
