//
//  ViewController.m
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import "ViewController.h"
#import "HZTreeLabel.h"
#import "HZTreeTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"];
    HZTreeTableViewController *tableVC = [[HZTreeTableViewController alloc] initWithPlistPath:plistPath];
    [tableVC setTitle:@"树形多级列表Demo"];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:tableVC];
    [nav.navigationBar setBackgroundColor:[UIColor yellowColor]];
    
    [self addChildViewController:nav];
    [self.view addSubview:nav.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
