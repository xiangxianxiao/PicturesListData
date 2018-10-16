//
//  XXPicturesCollection.h
//  PicturesListData
//
//  Created by Mac on 2018/10/10.
//  Copyright © 2018年 xiangxx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 选择进行处理操作

 @param arrayPictures 相册数组数据
 @param status 0 添加 1相片放大
 */
typedef void(^SelectPicturesBlock)(NSMutableArray *arrayPictures,NSInteger status);
@class XXPicturesCollection;
@interface XXPicturesCollectionConfiguration : NSObject

@property (nonatomic, copy) SelectPicturesBlock selectBlock;

/**
 图片最大值
 */
@property (nonatomic, assign) NSInteger maxValue;


/**
 一排最大值
 */
@property (nonatomic, assign) NSInteger maxRow;


/**
 边距的间距 上边 左边 下边 右边
 */
@property (nonatomic, assign) NSInteger topMargin;
@property (nonatomic, assign) NSInteger leftMargin;
@property (nonatomic, assign) NSInteger bottomMargin;
@property (nonatomic, assign) NSInteger rightMargin;


/**
 图片横向间距
 */
@property (nonatomic, assign) NSInteger horizontalSpacing;

/**
 图片竖向间距
 */
@property (nonatomic, assign) NSInteger verticalSpacing;


/**
 相关视图
 */
@property (nonatomic, strong) XXPicturesCollection * picturesCollection;

/**
 添加事件的图片
 */
@property (nonatomic, strong) UIImage *addImageName;


/**
 删除事件的图片
 */
@property (nonatomic, strong) UIImage *deleteImageName;


/**
 是否允许长按移动位置
 */
@property (nonatomic, assign) BOOL isLongPress;

@end



@interface XXPicturesCollection : UIView

/**
 初始化

 @param frame 位置
 @param configuration 配置
 @return 图片添加器
 */
- (instancetype)initWithFrame:(CGRect)frame AndConfiguration:(XXPicturesCollectionConfiguration *)configuration;

/**
 配置
 */
@property (nonatomic, strong) XXPicturesCollectionConfiguration * configuration;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end


