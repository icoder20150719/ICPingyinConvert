//
//  ViewController.m
//  ICPingyinConvert
//
//  Created by 朱封毅 on 23/07/15.
//  Copyright (c) 2015年 card. All rights reserved.
//

#import "ViewController.h"
#import "MyModel.h"
#import "ICPinyinGroup.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self tableView];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
#pragma mark create method
- (void)initData {
    //init
    _dataArr = [[NSMutableArray alloc] init];
    _sortedArrForArrays = [[NSMutableArray alloc] init];
    _sectionHeadsKeys = [[NSMutableArray alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"name" ofType:nil];
    NSString  *str  = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *Arr  = [NSMutableArray arrayWithArray:[str componentsSeparatedByString:@"/"]];
    for(int i = 0;i<Arr.count; i++)
    {
        MyModel *model = [MyModel new];
        model.UserName = Arr[i];
        [_dataArr addObject:model];
    }
    NSDictionary *dict = [ICPinyinGroup group:_dataArr key:@"UserName"];
    _sortedArrForArrays = [dict objectForKey:LEOPinyinGroupResultKey];
    _sectionHeadsKeys = [dict objectForKey:LEOPinyinGroupCharKey];
    [self.tableView reloadData];}

#pragma mark   - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [[self.sortedArrForArrays objectAtIndex:section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sortedArrForArrays count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_sectionHeadsKeys objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.sectionHeadsKeys;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] ;
    }
    if ([self.sortedArrForArrays count] > indexPath.section) {
        NSArray *arr = [self.sortedArrForArrays objectAtIndex:indexPath.section];
        if ([arr count] > indexPath.row) {
            MyModel *str = (MyModel *) [arr objectAtIndex:indexPath.row];
            cell.textLabel.text = str.UserName;
        }
    }
    return cell;
}
@end
