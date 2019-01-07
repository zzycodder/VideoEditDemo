//
//  VideoEditView.m
//  VideoEditDemo
//
//  Created by ZHANGZHONGYANG on 2019/1/7.
//  Copyright © 2019年 ZHANGZHONGYANG. All rights reserved.
//

#import "VideoEditView.h"

@interface VideoEditView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *categoryView;
@property (nonatomic, strong) UICollectionView *editItemView;

@end

@implementation VideoEditView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

#pragma mark - init SubViews

- (void)addSubViews {
    [self addSubview:self.categoryView];
    [self addSubview:self.editItemView];
}

#pragma mark - Setter && Getter

- (UICollectionView *)categoryView {
    if (!_categoryView) {
        self.categoryView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
        UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        self.categoryView.collectionViewLayout = layout;
        self.categoryView.delegate = self;
        self.categoryView.dataSource = self;
    }
    return _categoryView;
}

- (UICollectionView *)editItemView {
    if (!_editItemView) {
        self.editItemView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.categoryView.frame), self.bounds.size.width, 120)];
        self.editItemView.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        self.editItemView.delegate = self;
        self.editItemView.dataSource = self;
    }
    return _editItemView;
}



@end
