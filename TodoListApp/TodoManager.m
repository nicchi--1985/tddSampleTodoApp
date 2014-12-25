//
//  TodoManager.m
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/20.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import "TodoManager.h"

@implementation TodoManager

+ (id)sharedManager
{
    static TodoManager *sharedManager;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        sharedManager = [[TodoManager alloc] init];
        sharedManager.todoList = [NSMutableArray array];
        sharedManager.finishedTodoList = [NSMutableArray array];
        NSLog(@"_todolist allocated in sharedManager method");
    });
    NSLog(@"sharedManager: %@", sharedManager);
    return  sharedManager;
}

- (void)addTodoToList:(NSString *)todoText
{
    if (!_todoList) {
        _todoList = [NSMutableArray array];
    }
    TodoItem *todoItem = [[TodoItem alloc] initWithTodo:todoText];
    // NSMutableArrayはそのままだとNotificationを発信しないので、-mutableArrayValueForKeyでラッピングする
    NSMutableArray *proxyarray = [self mutableArrayValueForKey:@"todoList"];
    // proxyarrayを通して要素を追加
    [proxyarray insertObject:todoItem atIndex:[proxyarray count]];
}

- (void)finishTodoAt:(NSInteger)indexNum
{
    NSMutableArray *proxyarray = [self mutableArrayValueForKey:@"todoList"];
    TodoItem *finishedTodo = [_todoList objectAtIndex:indexNum];
    [proxyarray removeObjectAtIndex:indexNum];
    [_finishedTodoList addObject:finishedTodo];
}

- (void)deleteTodoAt:(NSInteger)indexNum
{
    [_todoList removeObjectAtIndex:indexNum];
}

@end
