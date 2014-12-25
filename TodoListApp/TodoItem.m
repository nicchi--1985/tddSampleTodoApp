//
//  TodoItem.m
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/15.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem


- (id)initWithTodo:(NSString *)text
{
    if (self = [super init]) {
        _text = text;
    }
    return  self;
}

@end
