//
//  BirthdayMgr.m
//  BrithdayAnimationViewDome
//
//  Created by xrh on 2017/11/13.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "BirthdayMgr.h"
#import "AudioPlayerMgr.h"
#import "HappyBirthdayViewController.h"

@interface BirthdayMgr ()

@property (strong, nonatomic) UIViewController *birthdayViewController;

@end

static BirthdayMgr *birthdayMgr = nil;

@implementation BirthdayMgr

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        birthdayMgr = [[BirthdayMgr alloc] init];
    });
    return birthdayMgr;
}

- (void)showBirthdayViewInviewController:(UIViewController *)viewController
                            birthdayItem:(BirthdayItem *)birthdayItem {
    
    __weak typeof(self) weakSelf = self;
    dispatch_block_t block = ^{
        typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            [strongSelf showInViewController:viewController birthdayItem:birthdayItem];
        }
    };
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

- (void)showInViewController:(UIViewController *)viewController
                birthdayItem:(BirthdayItem *)birthdayItem {
    [self clearBirthdayViewController];
    
    HappyBirthdayViewController *birthdayViewController = [[HappyBirthdayViewController alloc] initWithNibName:@"HappyBirthdayViewController" bundle:nil];
    birthdayViewController.birthdayItem = birthdayItem;
    __weak typeof(self) weakSelf = self;
    birthdayViewController.receiveActionBlock = ^{
        typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            [strongSelf hiddenBirthdayViewController:^{
                NSLog(@"动画完成后做一些处理");
            }];
        }
    };
    self.birthdayViewController = birthdayViewController;
    [birthdayViewController showInViewController:viewController];
}

- (void)hiddenBirthdayViewController:(YKBirthdayControllerHiddenCompelectionBlock)compelectionBlock {
    [UIView animateWithDuration:0.5 animations:^{
        [BirthdayMgr shareInstance].birthdayViewController.view.alpha = 0;
    } completion:^(BOOL finished) {
        //添加音乐
        [[AudioPlayerMgr sharedInstance] stopMusic:@"birthday.mp3"];
        [self.birthdayViewController removeFromParentViewController];
        [self.birthdayViewController.view removeFromSuperview];
        self.birthdayViewController = nil;
        if (compelectionBlock) {
            compelectionBlock();
        }
    }];
}

- (void)clearBirthdayViewController {
    if (self.birthdayViewController) {
    
        [[AudioPlayerMgr sharedInstance] stopMusic:@"birthday.mp3"];
        [self.birthdayViewController.view removeFromSuperview];
        [self.birthdayViewController removeFromParentViewController];
        self.birthdayViewController = nil;
    }
}

- (BOOL)isBirthdayViewControllerDisplaying {
    if (self.birthdayViewController) {
        return YES;
    } else {
        return NO;
    }
}

@end
