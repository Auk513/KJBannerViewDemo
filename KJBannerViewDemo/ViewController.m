//
//  ViewController.m
//  KJBannerViewDemo
//
//  Created by 杨科军 on 2018/12/22.
//  Copyright © 2018 杨科军. All rights reserved.
//

#import "ViewController.h"
#import "KJBannerView.h"

@interface ViewController ()<KJBannerViewDelegate>
@property (nonatomic,strong) KJBannerView *banner;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setDatas];
    
    KJBannerView *banner = [[KJBannerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*0.4)];
    banner.center = self.view.center;
    self.banner = banner;
    banner.backgroundColor = UIColor.clearColor;
    banner.cellPlaceholderImage = [UIImage imageNamed:@"tu3"];
    banner.autoScrollTimeInterval = 2;
    banner.isZoom = YES;
    banner.itemSpace = -10;
    banner.imgCornerRadius = 15;
    banner.itemWidth = self.view.frame.size.width-120;
    banner.delegate = self;
    [self.view addSubview:banner];
}

#pragma mark - KJBannerViewDelegate
//点击图片的代理
- (void)kj_BannerView:(KJBannerView *)banner SelectIndex:(NSInteger)index{
    NSLog(@"index = %ld",(long)index);
    
}

- (void)_setDatas{
    __weak typeof(self) weakself = self;
    //  延时执行
    int64_t delayInSeconds = 1.0; // 延迟的时间
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *images = @[
        @"http://img12.360buyimg.com/piao/jfs/t2743/132/3170930521/77809/42cfd6d4/57836e27N06956fd3.jpg",
        @"http://photos.tuchong.com/285606/f/4374153.jpg",
        @"http://img5.cache.netease.com/photo/0003/2012-06-21/84G462VS51GQ0003.jpg",
        @"http://thumb.niutuku.com/960x1/2f/fd/2ffd3765c4b43c743751246b156d1896.jpg",
        @"http://i2.hdslb.com/bfs/archive/1c471796343e34a8613518cc0d393792680a1022.jpg",
        @"http://thumb.niutuku.com/960x1/2f/fd/2ffd3765c4b43c743751246b156d1896.jpg",
        @"http://i2.hdslb.com/bfs/archive/1c471796343e34a8613518cc0d393792680a1022.jpg",
        @"http://img5.cache.netease.com/photo/0003/2012-06-21/84G462VS51GQ0003.jpg",
        ];
        weakself.banner.imageDatas = images;
    });
}

@end