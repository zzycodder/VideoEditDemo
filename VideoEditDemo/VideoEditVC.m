//
//  VideoEditVC.m
//  VideoEditDemo
//
//  Created by ZHANGZHONGYANG on 2019/1/7.
//  Copyright © 2019年 ZHANGZHONGYANG. All rights reserved.
//

#import "VideoEditVC.h"

#import <AVFoundation/AVFoundation.h>

#import "VideoEditView.h"

@interface VideoEditVC ()

@property (nonatomic, strong) AVPlayer *mainPlayer;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *pauseButton;
@property (nonatomic, strong) UIButton *fiterButton;
@property (nonatomic, strong) UIButton *musicButton;
@property (nonatomic, strong) UIButton *stickerButton;

@end

@implementation VideoEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addNotification];
    [self addSubViews];
}

#pragma mark - init SubViews

- (void)addSubViews {
    [self.view.layer addSublayer:self.playerLayer];
    [self.mainPlayer play];
    [self.view addSubview:self.button];
    [self.view addSubview:self.pauseButton];
    [self.view addSubview:self.fiterButton];
    [self.view addSubview:self.musicButton];
    [self.view addSubview:self.stickerButton];

}

#pragma mark - NSNotification

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playCompletion:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}


#pragma mark - Action

- (void)begin {
    [_mainPlayer play];
}

- (void)pause {
    [_mainPlayer pause];
}

- (void)playCompletion:(NSNotification *)noti {
    [_mainPlayer seekToTime:kCMTimeZero];
}

- (void)addFiter {
    
}

- (void)addMusic {
    
}

- (void)addSticker {
    
}

#pragma mark - Setter && Getter

- (AVPlayerLayer *)playerLayer {
    if (!_playerLayer) {
        self.playerItem = [[AVPlayerItem alloc] initWithURL:[self videoURL]];
        self.mainPlayer = [[AVPlayer alloc] initWithPlayerItem:_playerItem];
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:_mainPlayer];
        self.playerLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 400);
    }
    return _playerLayer;
}

- (NSURL *)videoURL {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1546854415882962" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    return url;
}

- (UIButton *)button {
    if (!_button) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"开始" forState:UIControlStateNormal];
        button.frame = CGRectMake(50, CGRectGetHeight(self.view.frame) - 300, 100, 100);
        [button addTarget:self action:@selector(begin) forControlEvents:UIControlEventTouchDown];
        self.button = button;
    }
    return _button;
}

- (UIButton *)pauseButton {
    if (!_pauseButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"暂停" forState:UIControlStateNormal];
        button.frame = CGRectMake(200, CGRectGetHeight(self.view.frame) - 300, 100, 100);
        [button addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchDown];
        self.pauseButton = button;
    }
    return _pauseButton;
}

- (UIButton *)fiterButton {
    if (!_fiterButton) {
        self.fiterButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.fiterButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.fiterButton setTitle:@"滤镜" forState:UIControlStateNormal];
        self.fiterButton.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 200, 100, 40);
        [self.fiterButton addTarget:self action:@selector(addFiter) forControlEvents:UIControlEventTouchDown];
    }
    return _fiterButton;
}

- (UIButton *)musicButton {
    if (!_musicButton) {
        self.musicButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.musicButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.musicButton setTitle:@"音乐" forState:UIControlStateNormal];
        self.musicButton.frame = CGRectMake(100, CGRectGetHeight(self.view.frame) - 200, 100, 40);
        [self.musicButton addTarget:self action:@selector(addMusic) forControlEvents:UIControlEventTouchDown];
    }
    return _musicButton;
}

- (UIButton *)stickerButton {
    if (!_stickerButton) {
        self.stickerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.stickerButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.stickerButton setTitle:@"贴纸" forState:UIControlStateNormal];
        self.stickerButton.frame = CGRectMake(200, CGRectGetHeight(self.view.frame) - 200, 100, 40);
        [self.stickerButton addTarget:self action:@selector(addSticker) forControlEvents:UIControlEventTouchDown];
    }
    return _stickerButton;
}



@end
