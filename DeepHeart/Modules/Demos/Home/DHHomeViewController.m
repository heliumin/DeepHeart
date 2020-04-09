//
//  DHHomeViewController.m
//  DeepHeart
//
//  Created by 贺刘敏 on 2020/4/9.
//  Copyright © 2020 hlm. All rights reserved.
//

#import "DHHomeViewController.h"

@interface DHHomeViewController ()

@end

@implementation DHHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    QMUIButton *btn =[QMUIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.qmui_width-100)/2.0, 100, 100, 50);
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor =[UIColor redColor];
    [btn setTitle:@"音乐" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}

- (void)btnAction{
    
    
}

@end
