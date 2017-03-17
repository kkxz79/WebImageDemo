//
//  XZRootViewController.h
//  XZWebImageDemo
//
//  Created by kkxz on 14/11/7.
//  Copyright (c) 2014年 kkxz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h" 
#import "XZMainViewController.h"
@interface XZRootViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView * tableView;
@end
