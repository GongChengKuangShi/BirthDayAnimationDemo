//
//  BirthdayMgr.h
//  BrithdayAnimationViewDome
//
//  Created by xrh on 2017/11/13.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BirthdayItem.h"

typedef void(^YKBirthdayControllerHiddenCompelectionBlock)(void);

@interface BirthdayMgr : NSObject

+ (instancetype)shareInstance;

- (void)showBirthdayViewInviewController:(UIViewController *)viewController birthdayItem:(BirthdayItem *)birthdayItem;
- (void)clearBirthdayViewController;
- (BOOL)isBirthdayViewControllerDisplaying;
@end
