//
//  ViewController.m
//  PicturesListData
//
//  Created by Mac on 2018/10/10.
//  Copyright © 2018年 xiangxx. All rights reserved.
//

#import "ViewController.h"
#import "XXPicturesCollection.h"
#import "XXImageBrowseViewController.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    XXPicturesCollection *pictures;
}

@property (nonatomic, strong) NSMutableArray *addPicturesData;

@property (weak, nonatomic) IBOutlet XXPicturesCollection *addPicturesView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.addPicturesData = [[NSMutableArray alloc] initWithCapacity:0];

//    pictures = [[XXPicturesCollection alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 500)];
//    pictures.configuration.maxRow = 4;
//    pictures.configuration.maxValue = 6;
//
//    pictures.configuration.addImageName = [UIImage imageNamed:@"community_photo"];
//    pictures.configuration.deleteImageName = [UIImage imageNamed:@"community_close"];
//
//    [self.view addSubview:pictures];
//
//    __weak typeof(self)weakSelf = self;
//    pictures.configuration.selectBlock = ^(NSMutableArray *arrayPictures, NSInteger status) {
//        if (status == -1) {
//            //添加图片
//            weakSelf.addPicturesData = arrayPictures;
//            [weakSelf photoLibraychoosephoto];
//        }else{
//            //点击放大第几个图片
//            XXImageBrowseViewController *imageBro = [[XXImageBrowseViewController alloc] init];
//            imageBro.imageUrlStringArray =  arrayPictures;
//            imageBro.currentIndex = status;
//            [weakSelf.navigationController pushViewController:imageBro animated:NO];
//        }
//    };

    
    self.addPicturesView.configuration.addImageName = [UIImage imageNamed:@"community_photo"];
    self.addPicturesView.configuration.deleteImageName = [UIImage imageNamed:@"community_close"];

    self.addPicturesView.configuration.maxRow = 4;
    self.addPicturesView.configuration.maxValue = 5;
    __weak typeof(self)weakSelf = self;
    self.addPicturesView.configuration.selectBlock = ^(NSMutableArray *arrayPictures, NSInteger status) {
        if (status == -1) { //添加图片
            weakSelf.addPicturesData = arrayPictures;
            [weakSelf photoLibraychoosephoto];
        }else{ //点击放大第几个图片
            //点击放大第几个图片
            XXImageBrowseViewController *imageBro = [[XXImageBrowseViewController alloc] init];
            imageBro.imageUrlStringArray =  arrayPictures;
            imageBro.currentIndex = status;
            [weakSelf.navigationController pushViewController:imageBro animated:NO];
        }
    };
    
}


#pragma mark 调用相册 获取图片
-(void)photoLibraychoosephoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing =  YES;
    picker.navigationBar.translucent = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
    
    [self.addPicturesData insertObject:image atIndex:0];
    self.addPicturesView.imageArray = self.addPicturesData;
    
//    pictures.imageArray = self.addPicturesData;
}

//当用户取消选择的时候，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
