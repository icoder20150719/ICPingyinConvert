//
//  ChineseString.h
//  ChineseSort
//
//  Created by Bill on 12-8-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChineseString : NSObject
//string 存储的是一个中文字符串，比如”郭靖“
@property(nonatomic, copy) NSString *string;
//pinYin 存储的是中文对应的大写字母  比如 “郭靖”  对应  “GJ”
@property(nonatomic, copy)NSString *pinYin;

@end
