//
//  TodoItemTests.m
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/21.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import "Kiwi.h"
#import "TodoItem.h"

SPEC_BEGIN(TodoItemSpec)

describe(@"TodoItem", ^{
    context(@"when creating object", ^{
        describe(@"initWithText:", ^{
            context(@"With 'todoText'", ^{
                TodoItem *todoItem = [[TodoItem alloc] initWithTodo:@"todoText"];
                it(@"should equal to 'todoText'", ^{
                    [[todoItem.text should] equal:@"todoText"];
                });
            });
        });
    });
});

SPEC_END
