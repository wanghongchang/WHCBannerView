//
//  PGCustomBannerView.m
//  NewPagedFlowViewDemo
//
//  Created by Guo on 2017/8/24.
//  Copyright © 2017年 robertcell.net. All rights reserved.
//

#import "PGCustomBannerView.h"
#import <UIImageView+WebCache.h>
#define placeholderStr @""
@interface PGCustomBannerView ()
@property (nonatomic, strong) UILabel *indexLabel;
@end

@implementation PGCustomBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.indexLabel];
    }
    
    return self;
}


- (void)setModel:(BannerImageTitleModel *)model
{
    model = model;
    if (![model.imageName hasPrefix:@"http"] && ![model.imageName hasPrefix:@"https"])
    {
        self.mainImageView.image = [UIImage imageNamed:model.imageName];
    }
    else
    {
        [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:model.imageName] placeholderImage:[UIImage imageNamed:placeholderStr]];
    }
    self.indexLabel.text = model.titleStr;
}


- (void)setSubviewsWithSuperViewBounds:(CGRect)superViewBounds {

    if (CGRectEqualToRect(self.mainImageView.frame, superViewBounds)) {
        return;
    }
    
    self.mainImageView.frame = superViewBounds;
    self.coverView.frame = superViewBounds;
    self.indexLabel.frame = CGRectMake(0, 10, superViewBounds.size.width, 20);
}

- (UILabel *)indexLabel {
    if (_indexLabel == nil) {
        _indexLabel = [[UILabel alloc] init];
        _indexLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
        _indexLabel.font = [UIFont systemFontOfSize:16.0];
        _indexLabel.textColor = [UIColor whiteColor];
    }
    return _indexLabel;
}

@end
