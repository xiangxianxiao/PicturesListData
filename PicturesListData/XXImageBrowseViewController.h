//
//  XXImageBrowseViewController.h
//  EZImageBrowserKitExample
//
//  Created by Mac on 2017/7/18.
//  Copyright © 2017年 Zhu yangjun. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface XXImageBrowseViewController : UIViewController

@property (strong, nonatomic) NSArray *imageUrlStringArray;

@property (nonatomic, copy) NSString *isNetWork;

@property (nonatomic, assign) NSInteger currentIndex;



@end
