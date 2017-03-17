//
//  XZMainViewController.m
//  XZWebImageDemo
//
//  Created by kkxz on 14/11/7.
//  Copyright (c) 2014年 kkxz. All rights reserved.
//

#import "XZMainViewController.h"

@interface XZMainViewController ()

@end

@implementation XZMainViewController
-(void)dealloc
{
    [_imageView release];
    [super dealloc];
}
@synthesize url = _url;
@synthesize imageView = _imageView;
-(UIImageView *)imageView
{
    if(_imageView == nil){
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, (self.view.frame.size.height-200.0f)/2, self.view.frame.size.width, 200.0f)];
    }
    return _imageView;
}
-(void)loadView
{
    [super loadView];
    self.title =@"Details";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imageView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self asynchronousDownload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 异步下载
-(void)asynchronousDownload
{
    //SDWebImageDownloader,仅作图片下载
    //[NSURL URLWithString:@"http://h.hiphotos.baidu.com/image/pic/item/d6ca7bcb0a46f21f99aa714ff5246b600c33ae0b.jpg"]
    [[SDWebImageManager sharedManager] downloadImageWithURL:self.url options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize){
        
        NSLog(@"%u %d",receivedSize,expectedSize); //下载进度和文件大小
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        //异步处理，图片下载成功,并且自动缓存
        //SDImageCacheType 图片获取方式 网络、内存、本地磁盘
        NSLog(@"下载成功了:%d",UIImageJPEGRepresentation(image, 1).length);
        self.imageView.image = image;
    }];
}
@end
