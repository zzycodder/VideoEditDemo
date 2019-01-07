//
//  ViewController.m
//  VideoEditDemo
//
//  Created by ZHANGZHONGYANG on 2019/1/5.
//  Copyright © 2019年 ZHANGZHONGYANG. All rights reserved.
//

#import "ViewController.h"
#import "VideoEditVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"视频处理" forState:UIControlStateNormal];
    button.frame = CGRectMake(150, 150, 100, 100);
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchDown];
}

- (void)clickAction {
    VideoEditVC *vc = [[VideoEditVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
