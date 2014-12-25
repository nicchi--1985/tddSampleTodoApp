//
//  TodoTableViewController.m
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/17.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import "TodoTableViewController.h"
#import "TodoItem.h"

@interface TodoTableViewController ()

- (NSIndexPath *)indexPathForControlEvent:(UIEvent *)event;
- (CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sharedTodoManager = [TodoManager sharedManager];
    [_sharedTodoManager addObserver:self forKeyPath:@"todoList" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
}

// 監視対象の変化を検知して、tableViewを更新
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"todoList was updated.");
    
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_sharedTodoManager.todoList count];
}

- (CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    // Configure the cell...
        cell.todoID = [indexPath row];
        cell.todoText.text = [_sharedTodoManager.todoList[cell.todoID] text];
    
    return cell;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [_tableView setEditing:editing animated:animated];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSInteger row = [indexPath row];
        [_sharedTodoManager deleteTodoAt:row];
        [self tableView:tableView numberOfRowsInSection:0];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pushedDeleteTodoBtn:(id)sender {
    
}

- (IBAction)pushedAddTodoBtn {
    
    NSString *todoText = self.textField.text;
    if (![todoText  isEqual: @""]) {
        [_sharedTodoManager addTodoToList:todoText];
    }
    self.textField.text = @"";
}

- (IBAction)pushedFinishTodoBtn:(id)sender forEvent:(UIEvent *)event
{
    NSIndexPath *indexPath = [self indexPathForControlEvent:event];
    NSInteger indexNum = [self getTodoIdFromTableViewCellAt:indexPath];
    [_sharedTodoManager finishTodoAt:indexNum];
}

- (NSIndexPath *)indexPathForControlEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint p = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    return indexPath;
}

- (NSInteger)getTodoIdFromTableViewCellAt:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = (CustomTableViewCell*)[self tableView:_tableView cellForRowAtIndexPath:indexPath];
    NSInteger indexNum = cell.todoID;
    return  indexNum;
}

@end
