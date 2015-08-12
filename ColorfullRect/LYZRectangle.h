//
//  LYZRectangle.h
//  ColorfullRect
//
//  Created by 李懿哲 on 8/11/15.
//  Copyright (c) 2015 lyzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYZRectangle : NSObject
@property (nonatomic, assign) BOOL flagHoriz;
@property (nonatomic, assign) BOOL flagVerti;
@property (nonatomic, assign) int speedHoriz;
@property (nonatomic, assign) int speedVerti;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) int width;
@property (nonatomic, assign) int height;
+(UILabel *)getRectLabel;
-(UILabel *)getRect;
-(LYZRectangle *)getLYZRect;
@end
