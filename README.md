# LXTagView
一个简单实用的标签排列控件

![image](https://github.com/liuxu0718/LXTagView/blob/master/LXTagView.gif)


####selectedResult
#####- (void)LXTagViewSelectedArray:(NSMutableArray *)selectedArray;


####property
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

//tag margin. default 10.
@property (nonatomic, assign) CGFloat tagMargin;

//left space. default 15.
@property (nonatomic, assign) CGFloat leftSpace;

//right space. default equal left.
@property (nonatomic, assign) CGFloat rightSpace;

//tag cornerRadius. default 0.
@property (nonatomic, assign) CGFloat tagCornerRadius;

//dataSource.
@property (nonatomic, strong) NSArray *dataArray;