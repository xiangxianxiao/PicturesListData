# PicturesListData
针对选择相册或拍照 使用九宫格显示照片，可以设置图片的最大数量、一排最大值、上下左右边距、图片的横向 纵向间距、默认图片、删除图标、

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

图一
https://img-blog.csdn.net/20181019110145954?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTEwNDM5OTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70


图二
https://img-blog.csdn.net/20181019110255614?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTEwNDM5OTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70

图三
https://img-blog.csdn.net/2018101911040980?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTEwNDM5OTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70

