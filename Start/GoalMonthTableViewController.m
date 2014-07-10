//
//  GoalMonthTableViewController.m
//  Start
//
//  Created by Tara Cates on 7/6/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import "GoalMonthTableViewController.h"
#import <Parse/Parse.h>
#import "User.h"
#import "Goal.h"

@interface GoalMonthTableViewCell : UITableViewCell
@property (strong, nonatomic) Goal *goal;

@end

@implementation GoalMonthTableViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        // this call says which class type to return when using the id GoalMonthCellIdentifier
        [self.tableView registerClass:[GoalMonthTableViewCell class] forCellReuseIdentifier:@"GoalMonthCellIdentifier"];
        self.tabBarItem.image = [UIImage imageNamed:@"second.png"];
        self.title = @"Second Tab";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setUser:(User *)user
{
    _user = user;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _user.goals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoalMonthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoalMonthCellIdentifier" forIndexPath:indexPath];

    cell.goal = (Goal *)_user.goals[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Goal *goal = _user.goals[indexPath.row];
    NSLog(@"selected goal: %@", goal.title);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

@implementation GoalMonthTableViewCell

- (void)setGoal:(Goal *)goal
{
    if (goal == _goal) {
        return;
    }
    _goal = goal;
    self.textLabel.text = goal.title;
}

@end
