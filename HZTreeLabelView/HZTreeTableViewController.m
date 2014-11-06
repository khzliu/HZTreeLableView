//
//  HZTreeTableViewController.m
//  HZTreeLabelViewDemo
//
//  Created by khzliu on 14/11/5.
//  Copyright (c) 2014年 khzliu@163.com. All rights reserved.
//

#import "HZTreeTableViewController.h"
#import "HZTreeLabel.h"

@interface HZTreeTableViewController ()

@property(strong, nonatomic) NSMutableArray *nodeArray;              //保存全部数据的数组
@property(strong, nonatomic) NSMutableArray *displayNodeArray;              //保存要显示在界面上的数据的数组
@property(strong, nonatomic) NSMutableArray *selectedModelArray;     //已经选择的model

@end

@implementation HZTreeTableViewController

- (NSMutableArray *)nodeArray
{
    if (_nodeArray == nil) {
        _nodeArray = [NSMutableArray array];
    }
    return _nodeArray;
}

- (NSMutableArray *)selectedModelArray
{
    if (_selectedModelArray == nil) {
        _selectedModelArray = [NSMutableArray array];
    }
    return _selectedModelArray;
}

- (NSMutableArray *)displayNodeArray
{
    if (_displayNodeArray == nil) {
        _displayNodeArray = [NSMutableArray array];
    }
    return _displayNodeArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype) initWithPlistPath:(NSString *) plistPath
{
    if (self = [super init]) {
        [self addSrcData:plistPath];//添加演示数据
        [self reloadDispalyNodeArray:self.nodeArray];//初始化将要显示的数据
    }
    return self;
}
//添加原始数据
- (void)addSrcData:(NSString *)plistPath
{
    
    NSMutableDictionary *areaDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSInteger deepth = 0;
    
    //解析全国省市区信息
    self.nodeArray = [self loadDataWithDictionary:areaDic deepth:deepth];
    
    
}
- (NSMutableArray *)loadDataWithDictionary:(NSDictionary *)dic deepth:(NSInteger) nDeepth
{
    NSMutableArray *nodeList = [NSMutableArray array];
    
    NSArray *keys = [dic allKeys];
    
    for (NSString *keyStr in keys)
    {
        id valueObject = [dic objectForKey:keyStr];
        //获取带子节点的数节点以及它的所有子树
        if ([valueObject isKindOfClass:[NSDictionary class]]) {
            HZTreeLeafCellModel *model = [[HZTreeLeafCellModel alloc] initWithCode:[NSString stringWithFormat:@"%d",nDeepth*100] name:keyStr isChosed:NO];
            
            NSMutableArray *sonItems = [self loadDataWithDictionary:valueObject deepth:(nDeepth + 1)];
            
            HZTreeLabelNode *node = [[HZTreeLabelNode alloc] initWithNodeDeepth:nDeepth type:HZTreeLabelNodeTypeTreeArrow model:model  sonNodes:sonItems];
            [nodeList addObject:node];
        }
        //获取带子节点的数节点以及它的所有叶子节点
        if ([valueObject isKindOfClass:[NSArray class]]) {
            HZTreeLeafCellModel *model = [[HZTreeLeafCellModel alloc] initWithCode:[NSString stringWithFormat:@"%d",nDeepth*100] name:keyStr isChosed:NO];
            
            NSMutableArray *sonItems = [NSMutableArray array];
            for (NSString *temStr in valueObject){
                HZTreeLeafCellModel *tmpModel = [[HZTreeLeafCellModel alloc] initWithCode:[NSString stringWithFormat:@"%d",(nDeepth+1)*100] name:temStr isChosed:NO];
                HZTreeLabelNode *tmpNode = [[HZTreeLabelNode alloc] initWithNodeDeepth:(nDeepth +1) type:HZTreeLabelNodeTypeLeafCheck model:tmpModel  sonNodes:nil];
                [sonItems addObject:tmpNode];
            }
            
            HZTreeLabelNode *node = [[HZTreeLabelNode alloc] initWithNodeDeepth:nDeepth type:HZTreeLabelNodeTypeTreeArrow model:model  sonNodes:sonItems];
            [nodeList addObject:node];
        }
    }
    return nodeList;
}
/*---------------------------------------
 初始化将要显示的cell的数据
 --------------------------------------- */
- (void)reloadDispalyNodeArray:(NSMutableArray *) nDataArray
{
    //遍历节点树，把要显示的节点放到数组中
    for (HZTreeLabelNode *node in nDataArray) {
        [self.displayNodeArray addObject:node];
        if(node.isExpanded){
            [self reloadDispalyNodeArray:node.sonNodes];
        }
    }
}
#pragma  mark --UITableViewDataSource
/*---------------------------------------
 cell分1个段
 --------------------------------------- */
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

/*---------------------------------------
 cell的个数
 --------------------------------------- */
-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return self.displayNodeArray.count;
}

/*---------------------------------------
 cell高度默认为42
 --------------------------------------- */
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 42;
}

#pragma mark --UITableViewDelegate
/*---------------------------------------
 建立cell
 --------------------------------------- */
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HZTreeLabelNode *node = [self.displayNodeArray objectAtIndex:indexPath.row];
    switch (node.type) {
            //树节点
        case HZTreeLabelNodeTypeTreeArrow:
        {
            HZTreeCell *cell = [HZTreeCell cellWithTableView:tableView];
            cell.node = node;
            return cell;
        }
            break;
            //叶子节点
        case HZTreeLabelNodeTypeLeafCheck:
        {
            HZNodeCell *cell = [HZNodeCell cellWithTableView:tableView];
            cell.node = node;
            return cell;
        }
            break;
    }
    return nil;
}


/*---------------------------------------
 处理cell选中事件，需要自定义的部分
 --------------------------------------- */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HZTreeLabelNode *node = [self.displayNodeArray objectAtIndex:indexPath.row];
    
    switch (node.type) {
        case HZTreeLabelNodeTypeTreeArrow:
        {
            HZTreeCell *cell = (HZTreeCell *) [tableView cellForRowAtIndexPath:indexPath];
            //修改cell的状态(关闭或打开)
            cell.node.isExpanded = !cell.node.isExpanded;
            cell.node = cell.node;
            //加载或卸载列表
            [self.displayNodeArray removeAllObjects];
            [self reloadDispalyNodeArray:self.nodeArray];
            [tableView reloadData];
        }
            break;
            
        case HZTreeLabelNodeTypeLeafCheck:
        {
            HZNodeCell *cell = (HZNodeCell *)[tableView cellForRowAtIndexPath:indexPath];
            HZTreeLeafCellModel *model = cell.node.model;
            model.isChosed = !model.isChosed;
            cell.node = cell.node;
        }
            break;
    }
    
}
@end
