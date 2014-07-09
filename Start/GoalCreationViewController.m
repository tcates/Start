//
//  GoalCreationViewController.m
//  Start
//
//  Created by Tara Cates on 7/8/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import "GoalCreationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GoalCreationViewController ()

@end

@implementation GoalCreationViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UILabel *categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 80)];
    categoryLabel.text = @"What area in your life would you like to focus on?";
    categoryLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    categoryLabel.numberOfLines = 2;
    
    UITextField *category = [[UITextField alloc] initWithFrame:CGRectMake(10, 120, 300, 40)];
    
    category.borderStyle = UITextBorderStyleRoundedRect;
    category.placeholder = @"category, e.g. health, love, etc.";
    category.clearButtonMode = UITextFieldViewModeWhileEditing;
    category.returnKeyType = UIReturnKeyDefault;
    category.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    category.autocapitalizationType = NO;
   // category.leftViewMode = UITextFieldViewModeAlways;
   // category.leftView = label;
    category.delegate = self;
    
    
    UILabel *goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, 300, 80)];
    goalLabel.text = @"What will you do everyday to better that area of life?";
    goalLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    goalLabel.numberOfLines = 2;
    
    UITextField *goal = [[UITextField alloc] initWithFrame:CGRectMake(10, 230, 300, 40)];
    
    goal.borderStyle = UITextBorderStyleRoundedRect;
    goal.placeholder = @"measureable goal, e.g. exercise, floss, journal gratitudes.";//code here for suggestions?
    goal.clearButtonMode = UITextFieldViewModeWhileEditing;
    goal.returnKeyType = UIReturnKeyDefault;
    goal.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    category.autocapitalizationType = NO;
    goal.delegate = self;
    
    UILabel *unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 270, 300, 80)];
    unitLabel.text = @"Is this goal measureable? What is it measured by?";
    unitLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    unitLabel.numberOfLines = 2;
    
    
    UITextField *unit = [[UITextField alloc] initWithFrame:CGRectMake(10, 340, 300, 40)];
    
    unit.borderStyle = UITextBorderStyleRoundedRect;
    unit.placeholder = @"measurement by, e.g. pages, miles, minutes";//code here for suggestions?
    unit.clearButtonMode = UITextFieldViewModeWhileEditing;
    unit.returnKeyType = UIReturnKeyDefault;
    unit.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    category.autocapitalizationType = NO;
    unit.delegate = self;
    
    //habituate!
    
    UIButton *habituateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [habituateButton.layer setBorderWidth:1.0f];
    [habituateButton.layer setBorderColor:[UIColor redColor].CGColor];
    [habituateButton.layer setCornerRadius:10.0f];
    
    habituateButton.frame = CGRectMake(100, 390, 100, 30);
    
    [habituateButton setTitle:@"Habituate!" forState:UIControlStateNormal];

    
    UIView *containerView = [UIView new];
    containerView.autoresizesSubviews = YES;

    [containerView addSubview:category];
    [containerView addSubview:categoryLabel];
    [containerView addSubview:goal];
    [containerView addSubview:goalLabel];
    [containerView addSubview:unit];
    [containerView addSubview:unitLabel];
    [containerView addSubview:habituateButton];
    
    
    [self setView:containerView];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
