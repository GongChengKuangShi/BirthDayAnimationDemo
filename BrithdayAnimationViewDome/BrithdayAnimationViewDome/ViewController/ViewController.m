//
//  ViewController.m
//  BrithdayAnimationViewDome
//
//  Created by xrh on 2017/11/13.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "ViewController.h"
#import "BirthdayMgr.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
    [self showBirthdayViewController];
}



- (IBAction)showButtonAction:(UIButton *)sender {
    [self showBirthdayViewController];
}

- (void)showBirthdayViewController {
    BirthdayItem *birthdayItem = [[BirthdayItem alloc] init];
    birthdayItem.birthdayTitle = @"亲爱的戎马天涯";
    birthdayItem.birthdaySubTitle = @"简理财精心为您准备了3000元";
    birthdayItem.birthdayDescriptionTitle = @"生日礼金，和一份特别惊喜！";
    [[BirthdayMgr shareInstance] showBirthdayViewInviewController:self birthdayItem:birthdayItem];
}

@end
