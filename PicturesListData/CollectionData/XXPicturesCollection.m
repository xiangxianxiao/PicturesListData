//
//  XXPicturesCollection.m
//  PicturesListData
//
//  Created by Mac on 2018/10/10.
//  Copyright © 2018年 xiangxx. All rights reserved.
//

#import "XXPicturesCollection.h"
#import "XXPicturesCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation XXPicturesCollectionConfiguration

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData{
    
    self.maxValue = 9;
    self.maxRow = 3;
    
    self.topMargin = 10;
    self.leftMargin = 10;
    self.bottomMargin = 10;
    self.rightMargin = 10;
    
    self.horizontalSpacing = 8;
    self.verticalSpacing = 8;

    self.addImageName = [UIImage imageNamed:@"community_photo"];
    self.deleteImageName = [UIImage imageNamed:@"community_close"];
    
}

- (void)setMaxRow:(NSInteger)maxRow {
    _maxRow = maxRow;
    self.picturesCollection.configuration = self;
}

- (void)setMaxValue:(NSInteger)maxValue{
    _maxValue = maxValue;
    self.picturesCollection.configuration = self;
}

- (void)setTopMargin:(NSInteger)topMargin{
    _topMargin = topMargin;
    self.picturesCollection.configuration = self;
}

- (void)setLeftMargin:(NSInteger)leftMargin{
    _leftMargin = leftMargin;
    self.picturesCollection.configuration = self;
}

- (void)setBottomMargin:(NSInteger)bottomMargin{
    _bottomMargin = bottomMargin;
    self.picturesCollection.configuration = self;
}

- (void)setRightMargin:(NSInteger)rightMargin{
    _rightMargin = rightMargin;
    self.picturesCollection.configuration = self;
}

- (void)setHorizontalSpacing:(NSInteger)horizontalSpacing{
    _horizontalSpacing = horizontalSpacing;
    self.picturesCollection.configuration = self;
}

- (void)setVerticalSpacing:(NSInteger)verticalSpacing{
    _verticalSpacing = verticalSpacing;
    self.picturesCollection.configuration = self;
}

- (void)setaddImageName:(UIImage *)addImageName{
    _addImageName = addImageName;
    self.picturesCollection.configuration = self;
}

- (void)setDeleteImageName:(UIImage *)deleteImageName{
    _deleteImageName = deleteImageName;
    self.picturesCollection.configuration = self;
}

@end



@interface XXPicturesCollection()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *picturesArray;

@property (nonatomic, assign) NSInteger indexTag;

@end

@implementation XXPicturesCollection

- (instancetype)initWithFrame:(CGRect)frame AndConfiguration:(XXPicturesCollectionConfiguration *)configuration {
    if (self = [super initWithFrame:frame]) {
        self.configuration = configuration;
        self.configuration.picturesCollection = self;
        [self initUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.configuration = [[XXPicturesCollectionConfiguration alloc] init];
        self.configuration.picturesCollection = self;
//        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.configuration = [[XXPicturesCollectionConfiguration alloc] init];
        self.configuration.picturesCollection = self;
//        [self initUI];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.configuration = [[XXPicturesCollectionConfiguration alloc] init];
        self.configuration.picturesCollection = self;
        
    }
    return self;
}

#pragma mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _width =  self.frame.size.width;
    if (!self.collectionView) {
        [self initUI];
    }else {
        self.collectionView.frame = CGRectMake(0, 0, _width, self.frame.size.height);
    }
    
}

- (void)setConfiguration:(XXPicturesCollectionConfiguration *)configuration {
    _configuration = configuration;
    [self.collectionView reloadData];
}

- (void)initUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, _width, self.frame.size.height) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
    
    [self.collectionView registerClass:[XXPicturesCollectionViewCell class] forCellWithReuseIdentifier:@"XXPicturesCollectionViewCell"];
    
    self.picturesArray = [NSMutableArray arrayWithObjects:@"", nil];
    self.imageArray = [[NSMutableArray alloc] init];
}

- (void)setImageArray:(NSMutableArray *)imageArray{
    _imageArray = imageArray;
    if (imageArray.count > 0) {
        _picturesArray = _imageArray;
        [self.collectionView reloadData];
    }
}

#pragma mark - UICollectionDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (self.picturesArray.count < _configuration.maxValue) {
        return self.picturesArray.count;
    }
    return _configuration.maxValue;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XXPicturesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XXPicturesCollectionViewCell" forIndexPath:indexPath];
    
    [cell.deleteImage setBackgroundImage:self.configuration.deleteImageName forState:UIControlStateNormal];
    [cell.deleteImage addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleteImage.tag = 10000 + indexPath.row;
    
    if (self.configuration.isOnlyShowImage) {
        if (self.configuration.isImageUrl) {
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.picturesArray[indexPath.row]]];
        }else{
            [cell.imageView setImage:self.picturesArray[indexPath.row]];
        }
        return cell;
    }

    
    if (self.picturesArray.count-1 != self.configuration.maxValue) {
        
        if (self.picturesArray.count -1 == indexPath.row) {
            
            cell.deleteImage.hidden = YES;
            
            self.indexTag = indexPath.row;
            
            cell.imageView.image = self.configuration.addImageName;
            [cell.deleteImage setBackgroundImage:self.configuration.deleteImageName forState:UIControlStateNormal];
        
        }else{
            cell.deleteImage.hidden = NO;
            [cell.imageView setImage:self.picturesArray[indexPath.row]];
        }
    }else if(self.picturesArray.count-1 == self.configuration.maxValue){
        cell.deleteImage.hidden = NO;
        [cell.imageView setImage:self.picturesArray[indexPath.row]];
        self.indexTag = self.configuration.maxValue;
    }
    return cell;
}

- (void)deleteAction:(UIButton *)btn{
    
    NSInteger btnTag = btn.tag - 10000;
    if (self.picturesArray.count > 1) {
        [self.picturesArray removeObjectAtIndex:btnTag];
        [self.collectionView reloadData];
    }
}

#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat widthCollection = (_width - ((_configuration.maxRow-1) * _configuration.horizontalSpacing + _configuration.rightMargin + _configuration.leftMargin))/_configuration.maxRow;
    return  CGSizeMake(widthCollection, widthCollection);
}



#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(_configuration.topMargin, _configuration.leftMargin, _configuration.bottomMargin, _configuration.rightMargin);
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return _configuration.horizontalSpacing;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return _configuration.verticalSpacing;
}

#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (self.indexTag == indexPath.row) {// 相册选择图片
        
        if (self.configuration.selectBlock) {
            self.configuration.selectBlock(self.picturesArray, -1);
        }
    }else{ // 放大第几个图片
        if (self.configuration.selectBlock) {
            self.configuration.selectBlock(self.picturesArray, indexPath.row);
        }
    }
}

#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


//#pragma mark - 添加长按手势
//- (void)setUpLongPressGes {
//    UILongPressGestureRecognizer *longPresssGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressMethod:)];
//    [self.collectionView addGestureRecognizer:longPresssGes];
//}

@end



