//
//  XXImageBrowseViewController.m
//  EZImageBrowserKitExample
//
//  Created by Mac on 2017/7/18.
//  Copyright © 2017年 Zhu yangjun. All rights reserved.
//

#import "XXImageBrowseViewController.h"

#import "EZImageBrowser.h"
#import "EZImageBrowserCell.h"
#import <EZImageBrowserKit/EZImageBrowserKit.h>
#import "UIImageView+WebCache.h"

@interface XXImageBrowseViewController ()<EZImageBrowserDelegate>


@end

@implementation XXImageBrowseViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    EZImageBrowser *browser = [[EZImageBrowser alloc] init];
    [browser setDelegate:self];
    [browser showWithCurrentIndex:_currentIndex completion:nil];
    
}

#pragma mark - EZImageBrowserDelegate
- (NSInteger)numberOfCellsInImageBrowser:(EZImageBrowser *)imageBrowser{
    return self.imageUrlStringArray.count - 1; // 减去最后的加号图片
}

- (EZImageBrowserCell *)imageBrowser:(EZImageBrowser *)imageBrowser cellForRowAtIndex:(NSInteger )index{
   
        EZImageBrowserCell *cell = [imageBrowser dequeueReusableCell];
        if (!cell) {
            cell = [[EZImageBrowserCell alloc] init];
        }
    
        if (self.isNetWork){
            cell.loadingView.hidden = YES;
            [cell.imageView sd_setImageWithURL:[[NSURL alloc] initWithString:self.imageUrlStringArray[index]] placeholderImage:[UIImage imageNamed:@"post_info_z"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
                CGFloat progress = (CGFloat)receivedSize / expectedSize;
                [cell.loadingView showAnimateByPropress:progress];
            } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                cell.loadingView.hidden = YES;
            }];
        }else{
            cell.imageView.image = self.imageUrlStringArray[index];
        }
        return cell;
}

//- (void)imageBrowserWillDisappear:(EZImageBrowser *)imageBrowser{
//    
//}

-(void)imageBrowserDidDisappear:(EZImageBrowser *)imageBrowser{
    [self.navigationController popViewControllerAnimated:NO];
}



@end
