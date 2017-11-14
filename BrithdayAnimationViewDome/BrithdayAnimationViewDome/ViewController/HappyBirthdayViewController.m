//
//  HappyBirthdayViewController.m
//  BrithdayAnimationViewDome
//
//  Created by xrh on 2017/11/13.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "HappyBirthdayViewController.h"
#import "BirthdayView.h"
#import "BirthdayItem.h"

@interface HappyBirthdayViewController ()

@end

@implementation HappyBirthdayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.birthViewConstrainsHeight.constant = self.birthView.height;
    self.birthViewConstrainsWidth.constant  = self.birthView.width;
    [self handleBirthdayViewEvent];
    
}

- (void)handleBirthdayViewEvent {
    [self.birthView animationForBirthdayLid];
    self.birthView.birthdaySubTitle = self.birthdayItem.birthdaySubTitle;
    self.birthView.birthdayTitle    = self.birthdayItem.birthdayTitle;
    self.birthView.birthdayDescritpion = self.birthdayItem.birthdayDescriptionTitle;
    __weak typeof(self) weakSelf = self;
    self.birthView.receiveActionBlock = ^{
        typeof(self) strongSelf = weakSelf;
        if (strongSelf && strongSelf.receiveActionBlock) {
            strongSelf.receiveActionBlock();
        }
    };
}

- (void)showInViewController:(UIViewController *)viewController {
    [viewController addChildViewController:self];
    self.view.frame = viewController.view.frame;
    [viewController.view addSubview:self.view];
    [self didMoveToParentViewController:viewController];
}

- (void)dealloc {
    self.birthView.isCloseAnimation = YES;
    [self.birthView removeFromSuperview];
    self.birthView = nil;
}

@end
