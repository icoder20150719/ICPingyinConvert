//
//  LEOPinyinGroup.h
//  CarSupermarket
//
//  Created by lion on 15/7/26.
//  Copyright (c) 2015年 lion. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  获取model数组
 */
UIKIT_EXTERN NSString *const LEOPinyinGroupResultKey;

/**
 *  获取所包函字母的数组
 */
UIKIT_EXTERN NSString *const LEOPinyinGroupCharKey;

@interface LEOPinyinGroup : NSObject

+(NSDictionary *)group:(NSArray *)datas key:(NSString *)key;

@end
