//
//  TodoManager.h
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/20.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"

@interface TodoManager : NSObject

@property (strong, nonatomic) NSMutableArray *todoList;
@property (strong, nonatomic) NSMutableArray *finishedTodoList;

+ (id)sharedManager;
- (void)addTodoToList:(NSString *)todoText;
- (void)finishTodoAt:(NSInteger)indexNum;
- (void)deleteTodoAt:(NSInteger)indexNum;

@end
