//
//  ViewController.m
//  ColorfullRect
//
//  Created by 李懿哲 on 8/11/15.
//  Copyright (c) 2015 lyzz. All rights reserved.
//

#import "ViewController.h"
#import "LYZRectangle.h"
@interface ViewController ()

@end

@implementation ViewController
{
           int count;
           NSMutableArray *_rectsArray;
}
-(instancetype)init{
           if (self = [super init]) {
                      _rectsArray = [NSMutableArray new];
           }
           NSLog(@"init方法被调用了！");//init方法并不会被调用...
           return self;
}
- (void)viewDidLoad {
           [super viewDidLoad];
           self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"BingWallpaper-2015-07-30.jpg"]];
           //持续制造rect
           [NSTimer scheduledTimerWithTimeInterval:arc4random() % 4 + 2 target:self selector:@selector(getRect) userInfo:nil repeats:YES];
           //让rect动起来
           [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(moveRect) userInfo:nil repeats:YES];
           
}

//产生rect
-(void)getRect{
           if (!_rectsArray) {
                      _rectsArray = [NSMutableArray new];
           }
           static int n = 0;
           //创建rect
           LYZRectangle *rect = [[LYZRectangle new] getLYZRect];
           //把rect存入数组
           [_rectsArray addObject:rect];
//                      NSLog(@"%@", _rectsArray);
           //获取rect的label
           UILabel *label = rect.label;
           //设置标签
           label.tag = ++n;
           [self.view addSubview:label];
           count = n;
}
//rect的定时移动
-(void)moveRect{
           //获取屏幕宽高
           int screenWidth = [UIScreen mainScreen].bounds.size.width;
           int screenHeight = [UIScreen mainScreen].bounds.size.height;
           
           for (int i = 0; i < count; i++) {
                      CGRect r = [self.view viewWithTag:i + 1].frame;
                      LYZRectangle *rect = _rectsArray[i];
                      
                      //到边界时改变方向
                      if (r.origin.x > screenWidth - rect.width) rect.flagHoriz = false;
                      else if(r.origin.x < 0) rect.flagHoriz = true;
                      
                      if (r.origin.y > screenHeight - rect.height) {
                                 rect.flagVerti = false;
                      }else if (r.origin.y < 0){
                                 rect.flagVerti = true;
                      }
                      //移动
                      if (rect.flagHoriz)r.origin.x += rect.speedHoriz;
                      else r.origin.x -= rect.speedHoriz;
                      if (rect.flagVerti) r.origin.y += rect.speedVerti;
                      else r.origin.y -= rect.speedVerti;
                      
                      [self.view viewWithTag:i + 1].frame = r;
           }
}

- (void)didReceiveMemoryWarning {
           [super didReceiveMemoryWarning];
           
}

@end
