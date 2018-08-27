//
//  WHCBannerView.m
//  NewPagedFlowViewDemo
//
//  Created by 汪弘昌 on 2018/8/23.
//  Copyright © 2018年 robertcell.net. All rights reserved.
//

#import "WHCBannerView.h"

#define modelNameStr       @"model"
@interface WHCBannerView()<NewPagedFlowViewDelegate, NewPagedFlowViewDataSource>
@property (nonatomic, assign)CGFloat whc_page_y;


@end

@implementation WHCBannerView
- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self initialize];
        [self whc_initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self initialize];
        [self whc_initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}
-(void)whc_initialize{
    
    self.whc_cellBotton = 20.f;
    self.whc_minimumPageAlpha = 0.3;
    self.whc_page_y = self.frame.size.height - (_whc_cellBotton + 10);
    self.whc_cornerRadius = 4;
    self.whc_pageColor = [UIColor whiteColor];
    self.whc_currentPageColor = [UIColor redColor];
    self.delegate = self;
    self.dataSource = self;
    self.minimumPageAlpha = _whc_minimumPageAlpha;
    self.whc_classStr = NSStringFromClass([PGIndexBannerSubiew class]);
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.whc_page_y, self.frame.size.width, 10)];
    pageControl.pageIndicatorTintColor = self.whc_pageColor;
    pageControl.currentPageIndicatorTintColor = self.whc_currentPageColor;
    self.pageControl = pageControl;
    [self addSubview:pageControl];
}


- (void)dealloc
{
    self.delegate = nil;
    self.dataSource = nil;
}

- (void)whc_reloadData
{
    if (_whc_bannerDara.count>0 && _whc_bannerDara)
    {
        [self reloadData];
    }
}

#pragma mark ************setter
- (void)setWhc_classStr:(NSString *)whc_classStr
{
    _whc_classStr = whc_classStr;
    [self whc_reloadData];
}
- (void)setWhc_pageColor:(UIColor *)whc_pageColor
{
    _whc_pageColor = whc_pageColor;
    self.pageControl.pageIndicatorTintColor = whc_pageColor;
}
- (void)setWhc_currentPageColor:(UIColor *)whc_currentPageColor
{
    _whc_currentPageColor = whc_currentPageColor;
    self.pageControl.currentPageIndicatorTintColor = whc_currentPageColor;
}
- (void)setWhc_cornerRadius:(CGFloat)whc_cornerRadius
{
    _whc_cornerRadius = whc_cornerRadius;
    [self whc_reloadData];
}
- (void)setWhc_bannerDara:(NSArray *)whc_bannerDara
{
    _whc_bannerDara = whc_bannerDara;
    [self whc_reloadData];
}
- (void)setWhc_page_y:(CGFloat)whc_page_y
{
    _whc_page_y = whc_page_y;
    self.pageControl.frame = CGRectMake(0, self.whc_page_y, self.frame.size.width, 10);
}
- (void)setWhc_minimumPageAlpha:(CGFloat)whc_minimumPageAlpha
{
    _whc_minimumPageAlpha = whc_minimumPageAlpha;
    self.minimumPageAlpha = whc_minimumPageAlpha;
}
- (void)setWhc_cellBotton:(CGFloat)whc_cellBotton
{
    _whc_cellBotton = whc_cellBotton;
    self.whc_page_y = self.frame.size.height - (whc_cellBotton/2 + 20);
}
#pragma mark --NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    
    return self.whc_bannerDara.count;
}

- (PGIndexBannerSubiew *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    Class cls = NSClassFromString(_whc_classStr);
    PGIndexBannerSubiew *bannerView = (PGIndexBannerSubiew *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[cls alloc] init];
        bannerView.layer.cornerRadius = self.whc_cornerRadius;
        bannerView.layer.masksToBounds = YES;
    }
    NSArray *proNames = [bannerView getAllPropertyNames];
    for (NSString *proStr in proNames)
    {
        if([proStr.uppercaseString containsString:modelNameStr.uppercaseString]){
            [bannerView safeSetValue:_whc_bannerDara[index] forKey:proStr];
            break;
        }
    }
    
    return bannerView;
}
#pragma mark NewPagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(self.frame.size.width - 60, self.frame.size.height - _whc_cellBotton);;
}

- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex {
    if (self.whc_didSelectCellAtIndex)
    {
        return self.whc_didSelectCellAtIndex(subIndex);
    }
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(NewPagedFlowView *)flowView {
    
    if (self.whc_didScrollToPage)
    {
        return self.whc_didScrollToPage(pageNumber);
    }
}


@end
