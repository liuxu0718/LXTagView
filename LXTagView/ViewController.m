//
//  ViewController.m
//  LXTagView
//
//  Created by 美时美刻－01 on 16/7/27.
//  Copyright © 2016年 Liuxu. All rights reserved.
//

#import "ViewController.h"
#import "LXTagView.h"

@interface ViewController ()<LXTagViewDelegate>

@property (nonatomic, strong) NSArray *dataArray1;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) LXTagView *tagView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArray = @[@"十个十", @"十个十", @"十个", @"个十个", @"个个", @"个个十个", @"十个十", @"十个", @"十十萨十十萨达打算的撒的撒打算的是的撒打算个达个", @"个个个", @"十个个个", @"十个", @"十个", @"十个十个", @"if好用", @"请点个", @"star", @"谢谢"];
    _dataArray1 = @[@"1123312", @"123132", @"21312312", @"2131313", @"123", @"1231313123", @"123123", @"213", @"123123", @"123"];

    _tagView = [[LXTagView alloc]init];
    _tagView.delegate = self;
    _tagView.tagMargin = 15;
    _tagView.tagPadding = 20;
    _tagView.tagCornerRadius = 15;
    //when you set all propery. and then set dataArray, not need set 'frame', it will auto caculate.
    _tagView.dataArray = _dataArray;
    [self.view addSubview:_tagView];
    
    
    UIButton *reloadButton = [[UIButton alloc]initWithFrame:CGRectMake(120, 30, 60, 30)];
    reloadButton.backgroundColor = [UIColor blackColor];
    reloadButton.tag = 1;
    [reloadButton setTitle:@"reload" forState:UIControlStateNormal];
    [reloadButton addTarget:self action:@selector(reloadButtonAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:reloadButton];
}

- (void)LXTagViewWithSelectedArray:(NSMutableArray *)selectedArray WithSelectedTag:(UIButton *)selectedTag {
    NSLog(@"%@ %ld", selectedArray, selectedTag.tag);
}


- (void)reloadButtonAction:(UIButton *)sender {
    if (sender.tag == 1) {
        sender.tag = 2;
        _tagView.dataArray = _dataArray1;
    } else {
        sender.tag = 1;
        _tagView.dataArray = _dataArray;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
