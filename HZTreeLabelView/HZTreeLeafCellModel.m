//
//  HZTreeLeafCellModel.m
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import "HZTreeLeafCellModel.h"

@implementation HZTreeLeafCellModel

- (instancetype)initWithCode:(NSString *) aCode name:(NSString *)nName isChosed:(BOOL) nIsChosed
{
    if(self = [super init])
    {
        self.name = nName;
        self.code = aCode;
        self.isChosed = nIsChosed;
    }
    return self;
}

@end
