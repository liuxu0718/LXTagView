//
//  LXTagView.m
//  LXTagView
//
//  Created by 美时美刻－01 on 16/7/27.
//  Copyright © 2016年 Liuxu. All rights reserved.
//

#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)

#import "LXTagView.h"

@interface LXTagView ()

@property (nonatomic, strong) NSMutableArray *selectedArray;
@property (nonatomic, assign) CGFloat contentLength;
@property (nonatomic, assign) NSInteger row;

@end

@implementation LXTagView

- (id)init {
    if (self = [super init]) {
        _tagHeight = 30;
        _tagFont = [UIFont systemFontOfSize:12];
        _tagBackgroundColor = [UIColor whiteColor];
        _tagTextColor = [UIColor blackColor];
        _tagSelectedBackgroundColor = [UIColor blackColor];
        _tagSelectedTextColor = [UIColor whiteColor];
        _tagBorderWidth = 1;
        _tagBorderColor = [UIColor blackColor];
        _tagPadding = 10;
        _tagVerticalMargin = 10;
        _tagHorizontalMargin = _tagVerticalMargin;
        _leftSpace = 15;
        _rightSpace = _leftSpace;
        _topSpace = _leftSpace;
        _bottomSpace = _leftSpace;
        _tagCornerRadius = 0;
        _isTagSelected = true;
        _dataArray = [NSArray array];
        _selectedArray = [NSMutableArray array];
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    _row = 0;
    _contentLength = 0;
    //为了重新设置数据源.刷新UI
    [self removeAllSubviews];
    [self initTagView];
}

- (void)initTagView {
    for (int i = 0; i < _dataArray.count; i++) {
        UIButton *tagButton = [[UIButton alloc]init];
        tagButton.tag = i;
        tagButton.backgroundColor = _tagBackgroundColor;
        [tagButton setTitle:_dataArray[i] forState:UIControlStateNormal];
        [tagButton setTitleColor:_tagTextColor forState:UIControlStateNormal];
        tagButton.titleLabel.font = _tagFont;
        tagButton.layer.borderWidth = _tagBorderWidth;
        tagButton.layer.borderColor = _tagBorderColor.CGColor;
        tagButton.layer.cornerRadius = _tagCornerRadius;
        tagButton.frame = [self getTagFrameWithIndex:i];
        [tagButton addTarget:self action:@selector(tagAction:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:tagButton];
    }
    self.frame = CGRectMake(0, 100, SCREEN_WIDTH, (_row + 1) * (_tagHeight + _tagVerticalMargin) - _tagVerticalMargin + _topSpace + _bottomSpace);
    self.backgroundColor = [UIColor cyanColor];
}

- (void)tagAction:(UIButton *)sender {
    if (_isTagSelected) {
        if ([sender.backgroundColor isEqual:_tagBackgroundColor]) {
            sender.backgroundColor = _tagSelectedBackgroundColor;
            [sender setTitleColor:_tagSelectedTextColor forState:UIControlStateNormal];
            sender.layer.borderColor = [UIColor clearColor].CGColor;
            [_selectedArray addObject:sender.titleLabel.text];
        } else {
            sender.backgroundColor = _tagBackgroundColor;
            [sender setTitleColor:_tagTextColor forState:UIControlStateNormal];
            sender.layer.borderColor = _tagBorderColor.CGColor;
            [_selectedArray removeObject:sender.titleLabel.text];
        }
    }
    if ([_delegate respondsToSelector:@selector(LXTagViewWithSelectedArray:WithSelectedTag:)]) {
        [_delegate LXTagViewWithSelectedArray:_selectedArray WithSelectedTag:sender];
    }
    
}

- (CGRect)getTagFrameWithIndex:(NSInteger)index {
    
    CGFloat tagLength = 0;
    CGFloat x = 0;
    tagLength = [self getTagLengthWithString:_dataArray[index]];
    if (_tagHorizontalMargin + tagLength >= SCREEN_WIDTH - _leftSpace - _rightSpace - _contentLength) {
        _row += 1;
        x = _leftSpace;
        _contentLength = tagLength;
    } else {
        if (index == 0) {
            x = _leftSpace;
        } else {
            x = _leftSpace + _contentLength + _tagHorizontalMargin;
            _contentLength = x - _leftSpace;
        }
        _contentLength += tagLength;
    }
    return CGRectMake(x, _topSpace + _row * (_tagVerticalMargin + _tagHeight), tagLength, _tagHeight);
}

- (CGFloat)getTagLengthWithString:(NSString *)string {
    CGSize tagSize = [string boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - (_leftSpace + _rightSpace), _tagHeight) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _tagFont} context:nil].size;
    return (tagSize.width + 2 * _tagPadding);
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
