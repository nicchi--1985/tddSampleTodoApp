//
//  TodoTableViewController.h
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/17.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
#import "TodoManager.h"

@interface TodoTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TodoManager *sharedTodoManager;

- (IBAction)pushedAddTodoBtn;
- (IBAction)pushedDeleteTodoBtn:(id)sender;
- (IBAction)pushedFinishTodoBtn:(id)sender forEvent:(UIEvent *)event;

@end
