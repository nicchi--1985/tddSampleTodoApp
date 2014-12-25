//
//  CustomTableViewCell.h
//  TodoListApp
//
//  Created by 谷 亮介 on 2014/12/17.
//  Copyright (c) 2014年 Ryosuke Tani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *todoText;
@property (assign, nonatomic) NSInteger todoID;

- (IBAction)pushedFinishTodoBtn:(id)sender;


@end
