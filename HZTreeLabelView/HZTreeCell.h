//
//  HZTreeCell.h
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//
//  树的UI
#import <UIKit/UIKit.h>
#import "HZTreeLabelNode.h"

@interface HZTreeCell : UITableViewCell

@property (strong, nonatomic) HZTreeLabelNode *node;                 //该UI对应的节点信息
@property (strong, nonatomic) IBOutlet UIImageView *arrowView;       //箭头
@property (strong, nonatomic) IBOutlet UILabel *sonCount;            //叶子数
@property (strong, nonatomic) IBOutlet UILabel *title;               //标题

+ (instancetype)cellWithTableView:(UITableView *) tableView;

@end
