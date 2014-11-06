//
//  HZTreeTableViewController.h
//  HZTreeLabelViewDemo
//
//  Created by khzliu on 14/11/5.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZTreeTableViewController : UITableViewController

//根据制定plist文件初始化控制器
- (instancetype) initWithPlistPath:(NSString *) plistPath;

@end
