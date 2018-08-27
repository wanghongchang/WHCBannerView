//
//  WHCBannerView.h
//  NewPagedFlowViewDemo
//
//  Created by 汪弘昌 on 2018/8/23.
//  Copyright © 2018年 robertcell.net. All rights reserved.
//

#import "NewPagedFlowView.h"
#import "NSObject+SafeSetValue.h"
#import "BannerImageTitleModel.h"
#import "BannerImageModel.h"
#import "PGIndexBannerSubiew.h"
#import "PGCustomBannerView.h"
@interface WHCBannerView : NewPagedFlowView
@property (nonatomic, strong)NSArray *whc_bannerDara;
@property (nonatomic, assign)CGFloat whc_cornerRadius;
@property (nonatomic, assign)CGFloat whc_minimumPageAlpha;
@property (nonatomic, copy)NSString *whc_classStr;
@property (nonatomic, assign)CGFloat whc_cellBotton;
@property (nonatomic, strong)UIColor *whc_pageColor;
@property (nonatomic, strong)UIColor *whc_currentPageColor;
@property (nonatomic, copy) void(^whc_didSelectCellAtIndex)(NSInteger index);
@property (nonatomic, copy) void(^whc_didScrollToPage)(NSInteger pageNumber);
@end
