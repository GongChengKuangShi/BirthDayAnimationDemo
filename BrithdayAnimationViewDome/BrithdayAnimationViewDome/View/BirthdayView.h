//
//  BirthdayView.h
//  BrithdayAnimationViewDome
//
//  Created by xrh on 2017/11/13.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BirthdayAnimationType) {
    YKBirthdayAnimationTypeUnknown,
    YKBirthdayAnimationTypeLidGroup,
    YKBirthdayAnimationTypeHappyBirthdayShow,
    YKBirthdayAnimationTypeHappyBirthdayHidden,
};

typedef void(^BirthdayReceiveActionBlock)(void);

@interface BirthdayView : UIView
/**
 动画界面整体高度
 */
@property (nonatomic, assign, readonly) CGFloat height;
/**
 动画界面整体宽度
 */
@property (nonatomic, assign, readonly) CGFloat width;

@property (nonatomic, strong) NSString *birthdayTitle;
@property (nonatomic, strong) NSString *birthdaySubTitle;
@property (nonatomic, strong) NSString *birthdayDescritpion;
@property (copy, nonatomic) BirthdayReceiveActionBlock receiveActionBlock;
/**
 controller销毁时设为yes 处理动画代理强引用造成的循环引用问题
 */
@property (nonatomic, assign) BOOL isCloseAnimation;

/**
 盒子打开动画
 */
- (void)animationForBirthdayLid;

@end
