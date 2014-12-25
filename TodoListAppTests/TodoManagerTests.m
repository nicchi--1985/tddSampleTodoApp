//
//  TodoManagerTests.m
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/19.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import "Kiwi.h"
#import "TodoItem.h"
#import "TodoManager.h"

/*
 前提：tableViewはTodoManager.todoListからデータを取得して表示
*/

SPEC_BEGIN(TodoManagerSpec)

    describe(@"TodoManager", ^{
        __block TodoManager *todoManager = [TodoManager sharedManager];
        __block NSString *todoText = @"firsttodo";
            // TodoListに要素を追加する
            describe(@"addTodoToList:", ^{
                context(@"Todoオブジェクトを", ^{
                    [todoManager addTodoToList:todoText];
                    it(@"TodoListに存在すべき", ^{
                        TodoItem *todoItem1 = (TodoItem*)todoManager.todoList.firstObject;
                        [[todoItem1.text should] equal:@"firsttodo"];
                    });
                });
            });
            // TodoManagerを生成する
            describe(@"sharedManager:",  ^{
            TodoManager *sharedTodoManager1 = [TodoManager sharedManager];
                    it(@"should exist todoManager", ^{
                            [[sharedTodoManager1 should] beNonNil];
                    });
                context(@"生成は一度しか実施されない。", ^{
                TodoManager *sharedTodoManager2 = [TodoManager sharedManager];
                    it(@"should always get the same instance.", ^{
                        [[sharedTodoManager1 should] equal:sharedTodoManager2];
                    });
                });
            });
            // Todoを完了させる
        context(@"When finishing a todoItem in the todolist", ^{
            TodoManager *finTodoManager = [[TodoManager alloc] init];
            finTodoManager.todoList = [NSMutableArray array];
            finTodoManager.finishedTodoList = [NSMutableArray array];
            [finTodoManager addTodoToList:@"finishedTodo"];
            describe(@"finishTodo:", ^{
                context(@"with indexNum = 0", ^{
                    NSInteger indexNum = 0;
                    [finTodoManager finishTodoAt:indexNum];
                    it(@"should replace todo from todoList to finishedTodoList.", ^{
                        [[finTodoManager.todoList should] equal:[NSMutableArray array]];
                        [[[(TodoItem*)finTodoManager.finishedTodoList.lastObject text] should] equal:@"finishedTodo"];
                    });
                });
            });
        });
            // Todoの内容を編集する
            // Todoを削除する
        context(@"When deleting todo", ^{
            TodoManager *delTodoManager = [[TodoManager alloc] init];
            delTodoManager.todoList = [NSMutableArray array];
            [delTodoManager addTodoToList:@"deleteTodo"];
            describe(@"deleteTodoAt:", ^{
                context(@"with indexNum", ^{
                    NSInteger indexNum = 0;
                    [delTodoManager deleteTodoAt:indexNum];
                    it(@"should remove todo from todolist", ^{
                        [[delTodoManager.todoList should] equal:[NSMutableArray array]];
                    });
                });
            });
        });
        
    });

SPEC_END