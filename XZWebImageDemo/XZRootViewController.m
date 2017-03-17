//
//  XZRootViewController.m
//  XZWebImageDemo
//
//  Created by kkxz on 14/11/7.
//  Copyright (c) 2014年 kkxz. All rights reserved.
//

#import "XZRootViewController.h"

@interface XZRootViewController ()
@property(nonatomic,retain)NSArray * imagesArray;
@end

@implementation XZRootViewController
-(void)dealloc
{
    [_imagesArray release];
    [_tableView release];
    [super dealloc];
}
@synthesize imagesArray = _imagesArray;
-(NSArray *)imagesArray
{
    if(_imagesArray == nil){
        _imagesArray = [@[@"http://b.hiphotos.baidu.com/image/pic/item/d009b3de9c82d158353ac09a830a19d8bc3e4265.jpg",
                         @"http://f.hiphotos.baidu.com/image/pic/item/9f510fb30f2442a7646ae0ded243ad4bd1130260.jpg",
                         @"http://h.hiphotos.baidu.com/image/pic/item/242dd42a2834349bac5af9fccaea15ce36d3be6f.jpg",
                         @"http://g.hiphotos.baidu.com/image/pic/item/64380cd7912397dd67250f7d5a82b2b7d0a2876f.jpg",
                         @"http://c.hiphotos.baidu.com/image/pic/item/34fae6cd7b899e51b5a9276f41a7d933c8950da1.jpg"]retain];
    }
    return _imagesArray;
}
@synthesize tableView = _tableView;
-(UITableView *)tableView
{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(void)loadView
{
    [super loadView];
    self.title = @"WebImages";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imagesArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CommodityDetailsFirstKey =@"SPDetailImageCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CommodityDetailsFirstKey];
    if (cell==nil){
        cell =[[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CommodityDetailsFirstKey];
     }
    cell.textLabel.text =@"Text";
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[self.imagesArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"more_icon_photo"]];//下载图片，做展现，异步加载图片，自动缓存
      return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZMainViewController * mainVC = [[XZMainViewController alloc] init];
    mainVC.url = [NSURL URLWithString:[self.imagesArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:mainVC animated:YES];
    [mainVC release];
}
@end
