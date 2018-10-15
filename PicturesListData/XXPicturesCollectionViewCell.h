//
//  XXPicturesCollectionViewCell.h
//  PicturesListData
//
//  Created by Mac on 2018/10/11.
//  Copyright © 2018年 xiangxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXPicturesCollectionViewCell : UICollectionViewCell


/**
 显示的图片
 */
@property (nonatomic, strong) UIImageView *imageView;


/**
 删除图片
 */
@property (nonatomic, strong) UIButton *deleteImage;

@end
