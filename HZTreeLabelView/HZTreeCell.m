//
//  HZTreeCell.m
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import "HZTreeCell.h"

@implementation HZTreeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *) tableView
{
    NSString *CellIdentifier = @"TreeCell";
    HZTreeCell *cell = (HZTreeCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HZTreeCell" owner:self options:nil] lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    return cell;
}

- (void)setNode:(HZTreeLabelNode *)node{
    _node = node;
    //有多少子树
    [self.sonCount setText:[NSString stringWithFormat:@"%d", self.node.sonNodeNumber]];
    //是否展开树
    if (self.node.isExpanded) {
        [self rotateArrowWithDegree:M_PI_2];
    }else{
        [self rotateArrowWithDegree:0.0];
    }
    //设置title 和 是否选中
    HZTreeLeafCellModel *model = (HZTreeLeafCellModel *)self.node.model;
    [self.title setText:model.name];
    
    //根据cell的层次重新描绘cell
    NSInteger addX = _node.nodeDeepth *25; //根据节点所在的层次计算平移距离
    CGRect nameFrame = _title.frame;
    nameFrame.origin.x = 12 + addX;
    _title.frame = nameFrame;
    
    
}

/*---------------------------------------
 旋转箭头图标
 --------------------------------------- */
-(void) rotateArrowWithDegree:(double)degree{
    __weak typeof(self) wself = self;
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        wself.arrowView.layer.transform = CATransform3DMakeRotation(degree, 0, 0, 1);
    } completion:nil];
}


@end
