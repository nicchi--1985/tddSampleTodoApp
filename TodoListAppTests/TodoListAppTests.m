//
//  TodoListAppTests.m
//  TodoListAppTests
//
//  Created by 谷 亮介 on 2014/12/15.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import "Kiwi.h"
#import "TodoTableViewController.h"
#import "CustomTableViewCell.h"
#import "TodoItem.h"

SPEC_BEGIN(TodoListAppSpec)
/*
 
 Todoを追加する
 Todoを完了させる
 Todoを編集する
 Todoを削除する

 describe(@"テスト対象(オブジェクト)", ^{
     context(@"状態(When)", ^{
         describe(@"テスト対象メソッド", ^{
             context(@"入力(With xx)", ^{
                 it(@"期待する出力(should be xx)", ^{
                     //テストコード
                 });
             });
         });
     });
 });
 
 scenario: Todoをリストに追加する
 given: 前提条件
 when: 注目する対象
 then: 期待値(アウトプット)
 
*/


 
describe(@"新しいタスクを追加する", ^{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    __block TodoTableViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"tableViewController"];
        
        context(@"textfieldに'firsttodo'入力した時", ^{
            viewController.textField.text = @"firsttodo";
            
            describe(@"addボタン押下(pushedAddTodoBtn:)", ^{
                [viewController pushedAddTodoBtn];
                context(@"after the pushedAddTodoBtn: complete.", ^{
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                    UITableView *tableView = (UITableView*)[viewController.view viewWithTag:10];
                    __block CustomTableViewCell *cell = [[CustomTableViewCell alloc] init];
                    
                    it(@"Todolistに'firstTodo' 追加されている", ^{
                        cell = (CustomTableViewCell*)[viewController tableView:tableView cellForRowAtIndexPath:indexPath];
                        [[expectFutureValue(cell.todoText.text) shouldEventually] equal:@"firsttodo"];
                    });
                });
            });
        });
        context(@"when textfieldに何も入力しない", ^{
            describe(@"pushedAddTodoBtn:", ^{
                it(@"Todolist should have nothing", ^{
                    // write test
                });
            });
        });
});

SPEC_END