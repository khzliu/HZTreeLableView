//
//  HZTreeLabelNode.m
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import "HZTreeLabelNode.h"

@implementation HZTreeLabelNode

- (NSMutableArray *)sonNodes{
    if (_sonNodes == nil) {
        _sonNodes = [NSMutableArray array];
    }
    return _sonNodes;
}

-(instancetype) initWithNodeDeepth:(NSInteger) nDeepth type:(HZTreeLabelNodeType) nType model:(id) nModel sonNodes:(NSMutableArray *) nSonNodes
{
    if (self = [super init]) {
        self.nodeDeepth = nDeepth;
        self.type = nType;
        self.model = nModel;
        self.sonNodes = nSonNodes;
        self.sonNodeNumber = [self.sonNodes count];
        self.isExpanded = NO;
    }
    return self;
}

@end
