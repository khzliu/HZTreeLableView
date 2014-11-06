//
//  HZTreeLabelNode.h
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZTreeLeafCellModel.h"

typedef NS_ENUM(NSInteger, HZTreeLabelNodeType){
    HZTreeLabelNodeTypeLeafCheck = 0,                //有对号选择的叶子UI
    HZTreeLabelNodeTypeTreeArrow = 1,                //带箭头的树UI
};

@interface HZTreeLabelNode : NSObject

@property (nonatomic, assign) NSInteger nodeDeepth;             //节点树深度
@property (nonatomic, assign) NSInteger sonNodeNumber;          //节点下子节点个数
@property (nonatomic, assign) HZTreeLabelNodeType type;         //节点所对应的UI类型
@property (nonatomic, strong) id model;                         //节点所对应UI类型的model
@property (nonatomic, assign) BOOL isExpanded;                  //节点是否展开
@property (nonatomic, strong) NSMutableArray *sonNodes;         //子节点

-(instancetype) initWithNodeDeepth:(NSInteger) nDeepth type:(HZTreeLabelNodeType) nType model:(id) nModel sonNodes:(NSMutableArray *) nSonNodes;
@end
