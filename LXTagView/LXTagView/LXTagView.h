//
//  LXTagView.h
//  LXTagView
//
//  Created by 美时美刻－01 on 16/7/27.
//  Copyright © 2016年 Liuxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LXTagViewDelegate <NSObject>

- (void)LXTagViewWithSelectedArray:(NSMutableArray *)selectedArray
                   WithSelectedTag:(UIButton *)selectedTag;

@end

@interface LXTagView : UIView

//tag height. default 30.
@property (nonatomic, assign) CGFloat tagHeight;

//tag font. default systemFont 12.
@property (nonatomic, strong) UIFont *tagFont;

//tag backgroundColor. default white.
@property (nonatomic, strong) UIColor *tagBackgroundColor;

//tag selected backgroundColor. default black.
@property (nonatomic, strong) UIColor *tagSelectedBackgroundColor;

//tag selected textColor. default white.
@property (nonatomic, strong) UIColor *tagSelectedTextColor;

//tag textColor. default black.
@property (nonatomic, strong) UIColor *tagTextColor;

//tag borderWidth. default 1.
@property (nonatomic, assign) CGFloat tagBorderWidth;

//tag borderColor. default black.
@property (nonatomic, strong) UIColor *tagBorderColor;

//tag padding. default 10.
@property (nonatomic, assign) CGFloat tagPadding;

//tag Vertical margin. default 10.
@property (nonatomic, assign) CGFloat tagVerticalMargin;

//tag Horizontal margin. default equal Vertical margin.
@property (nonatomic, assign) CGFloat tagHorizontalMargin;

//left space. default 15.
@property (nonatomic, assign) CGFloat leftSpace;

//right space. default equal left.
@property (nonatomic, assign) CGFloat rightSpace;

//top space. default equal left.
@property (nonatomic, assign) CGFloat topSpace;

//top space. default equal left.
@property (nonatomic, assign) CGFloat bottomSpace;

//tag cornerRadius. default 0.
@property (nonatomic, assign) CGFloat tagCornerRadius;

//is tag only support click not selected. default true.
@property (nonatomic, assign) BOOL isTagSelected;

//dataSource.
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, weak) id<LXTagViewDelegate> delegate;

@end
