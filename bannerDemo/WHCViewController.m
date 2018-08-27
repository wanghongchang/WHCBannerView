//
//  WHCViewController.m
//  WHCBase
//
//  Created by 汪弘昌 on 2018/7/25.
//  Copyright © 2018年 1111. All rights reserved.
//

#import "WHCViewController.h"
#import "WHCBannerView.h"
@interface WHCViewController ()
@property (nonatomic, strong)WHCBannerView *bannerView;
@property (nonatomic, strong)NSMutableArray *bannerData;
@end

@implementation WHCViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _bannerData = [NSMutableArray array];
    [self configBannerView];
    [self configBannerData];
}

- (void)configBannerView
{
    _bannerView = [[WHCBannerView alloc]initWithFrame:CGRectMake(0, 100, 375, 150)];
    _bannerView.whc_didSelectCellAtIndex = ^(NSInteger index) {
        NSLog(@"点击了第%ld张图",(long)index + 1);
    };
    [self.view addSubview:_bannerView];
}

- (void)configBannerData
{
    NSArray *arr = @[@"https://goss.veer.com/creative/vcg/veer/612/veer-171074405.jpg",@"https://goss.veer.com/creative/vcg/veer/612/veer-103986923.jpg",@"https://goss.veer.com/creative/vcg/veer/612/veer-161548038.jpg",@"https://goss.veer.com/creative/vcg/veer/612/veer-153439091.jpg",@"https://goss.veer.com/creative/vcg/veer/612/veer-133825919.jpg"];
    for (int i = 0; i < arr.count; i++) {
        BannerImageTitleModel *model = [BannerImageTitleModel new];
        model.imageName = arr[i];
        [_bannerData addObject:model];
    }
    _bannerView.whc_bannerDara = _bannerData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
