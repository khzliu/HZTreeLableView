//
//  HZNodeCell.m
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import "HZNodeCell.h"

@implementation HZNodeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+(instancetype) cellWithTableView:(UITableView *) tableView
{
    NSString *CellIdentifier = @"NodeCell";
    HZNodeCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HZNodeCell" owner:self options:nil] lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    return cell;
}

-(void) setNode:(HZTreeLabelNode *)node
{
    _node = node;
    
    //设置title 和 是否选中
    HZTreeLeafCellModel *model = (HZTreeLeafCellModel *)self.node.model;
    [self.title setText:model.name];
    
    //根据cell的层次重新描绘cell
    NSInteger addX = _node.nodeDeepth *25; //根据节点所在的层次计算平移距离
    CGRect nameFrame = _title.frame;
    nameFrame.origin.x = 12 + addX;
    _title.frame = nameFrame;
    
    if (model.isChosed) {
        [self.checkImg setHidden:NO];
    }else{
        [self.checkImg setHidden:YES];
    }
}
@end
