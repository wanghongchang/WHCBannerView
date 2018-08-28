# WHCBannerView
基于NewPagedFlowView的轻度封装，不会影响习惯的处理模式，使用块方式进行操作，简易的代码风格，不在需要写代理，设置高度，使用只需要传一个数据源会自动赋值，可自定义CELL，也会自动赋值，刷新只要重新传一遍数据源即可
_bannerView = [[WHCBannerView alloc]initWithFrame:CGRectMake(0, 100, 375, 150)];
    _bannerView.whc_didSelectCellAtIndex = ^(NSInteger index) {
        NSLog(@"点击了第%ld张图",(long)index + 1);
    };
    [self.view addSubview:_bannerView];
    _bannerView.whc_bannerDara = _bannerData;
