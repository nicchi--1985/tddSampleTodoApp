//
//  TodoItem.h
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/15.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject
@property (strong, nonatomic) NSString *text;

- (id)initWithTodo:(NSString *)text;

@end
