//
//  XXPicturesCollectionViewCell.m
//  PicturesListData
//
//  Created by Mac on 2018/10/11.
//  Copyright © 2018年 xiangxx. All rights reserved.
//

#import "XXPicturesCollectionViewCell.h"

@implementation XXPicturesCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.deleteImage];
    }
    return self;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = self.bounds;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (UIButton *)deleteImage{
    if (!_deleteImage) {
        _deleteImage = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteImage.frame = CGRectMake(_imageView.frame.size.width-10, -5, 15, 15);
    }
    return _deleteImage;
}

@end
