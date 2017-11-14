//
//  HappyBirthdayViewController.h
//  BrithdayAnimationViewDome
//
//  Created by xrh on 2017/11/13.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BirthdayView.h"
@class BirthdayItem;

@interface HappyBirthdayViewController : UIViewController

@property (weak, nonatomic) IBOutlet BirthdayView *birthView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *birthViewConstrainsHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *birthViewConstrainsWidth;
@property (copy, nonatomic) BirthdayReceiveActionBlock receiveActionBlock;
@property (strong, nonatomic) BirthdayItem *birthdayItem;

- (void)showInViewController:(UIViewController *)viewController;

@end
