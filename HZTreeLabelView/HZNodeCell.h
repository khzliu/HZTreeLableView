//
//  HZNodeCell.h
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTreeLabelNode.h"

@interface HZNodeCell : UITableViewCell

@property (strong, nonatomic) HZTreeLabelNode *node;                 //该UI对应的节点信息
@property (strong, nonatomic) IBOutlet UILabel *title;               //标题
@property (strong, nonatomic) IBOutlet UIImageView *checkImg;        //对号

+(instancetype) cellWithTableView:(UITableView *) tableView;

@end
