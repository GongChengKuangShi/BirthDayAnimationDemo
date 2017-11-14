//
//  AudioPlayerMgr.h
//  BrithdayAnimationViewDome
//
//  Created by xrh on 2017/11/13.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioPlayerMgr : NSObject

+ (AudioPlayerMgr *)sharedInstance;

/**
 *  播放音乐
 *
 *  @param filename 音乐的文件名
 */
- (BOOL)playMusic:(NSString *)filename isLoops:(BOOL)isLoops;

- (void)stopMusic:(NSString *)filename;

@end
