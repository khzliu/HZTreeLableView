//
//  HZTreeLeafCellModel.h
//  HZTreeLabelViewDemo
//
//  Created by Khzliu on 14/11/4.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

//UI所对应的数据model

#import <Foundation/Foundation.h>

@interface HZTreeLeafCellModel : NSObject

@property (nonatomic, strong) NSString *name;       //省份名字名字
@property (nonatomic, strong) NSString *code;       //省份代码代码
@property (nonatomic, assign) BOOL isChosed;        //是否被选中

- (instancetype)initWithCode:(NSString *) aCode name:(NSString *)nName isChosed:(BOOL) nIsChosed;

@end
