//
//  XZMainViewController.h
//  XZWebImageDemo
//
//  Created by kkxz on 14/11/7.
//  Copyright (c) 2014年 kkxz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h" 
@interface XZMainViewController : UIViewController
@property(nonatomic,retain)UIImageView * imageView;
@property(nonatomic,assign)NSURL * url;
@end
