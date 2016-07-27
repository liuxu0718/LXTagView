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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *dataArray = @[@"十个十", @"十个十", @"十个", @"个十个", @"个个", @"个个十个", @"十个十", @"十个", @"十十萨十十萨达打算的撒的撒打算的是的撒打算个达个", @"个个个", @"十个个个", @"十个", @"十个", @"十个十个"];
    
    LXTagView *tagView = [[LXTagView alloc]init];
    tagView.delegate = self;
    tagView.dataArray = dataArray;
    [self.view addSubview:tagView];
    
}

- (void)LXTagViewSelectedArray:(NSMutableArray *)selectedArray {
    NSLog(@"%@", selectedArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
