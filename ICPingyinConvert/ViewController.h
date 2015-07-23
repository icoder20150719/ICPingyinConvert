//
//  ViewController.h
//  ICPingyinConvert
//
//  Created by 朱封毅 on 23/07/15.
//  Copyright (c) 2015年 card. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *sortedArrForArrays;
@property (nonatomic, strong) NSMutableArray *sectionHeadsKeys;



@end

