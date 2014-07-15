//
//  GoalCreationViewController.m
//  Start
//
//  Created by Tara Cates on 7/8/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import "GoalCreationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Goal.h"

@interface MultiPlaceholderTextField : UIView
- (instancetype)initWithPlaceholders:(NSArray *)/* NSString */ placeholders;
@property UITextField *textField;
@end

@implementation GoalCreationViewController {
    MultiPlaceholderTextField *_goal;
    MultiPlaceholderTextField *_category;
    MultiPlaceholderTextField *_unit;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIImage *starImage = [UIImage imageNamed:@"first.png"];
        
        starImage = [starImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem = [self.tabBarItem initWithTitle:@"New Goal" image:starImage selectedImage:starImage];

    }
    return self;
}

- (UILabel *)_newLabelWithString:(NSString *)string
{
    UILabel *label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.numberOfLines = 0;
    label.text = string;
    [self.view addSubview:label];
    
    return label;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *categoryLabel = [self _newLabelWithString:@"What area in your life would you like to focus on?"];
    _category = [[MultiPlaceholderTextField alloc] initWithPlaceholders:@[@"mind", @"body", @"spirit"]];
    [self.view addSubview:_category];
    
    UILabel *goalLabel = [self _newLabelWithString:@"What will you do everyday to better that area of life?"];
    _goal = [[MultiPlaceholderTextField alloc] initWithPlaceholders:@[@"read", @"exercise", @"journal"]];
    [self.view addSubview:_goal];
    
    UILabel *unitLabel = [self _newLabelWithString:@"Is this goal measureable? What is it measured by?"];
    _unit = [[MultiPlaceholderTextField alloc] initWithPlaceholders:@[@"pages", @"miles", @"words"]];
    [self.view addSubview:_unit];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(categoryLabel, _category, goalLabel, _goal, unitLabel, _unit);
    NSDictionary *metrics = @{
                              @"topPadding": @(10.0),
                              @"lPadding": @(10.0),
                              @"rPadding": @(10.0),
                              };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(lPadding)-[categoryLabel]-(rPadding)-|"
                                                                          options:0
                                                                          metrics:metrics
                                                                            views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(topPadding)-[categoryLabel]-[_category]-[goalLabel]-[_goal]-[unitLabel]-[_unit]"
                                                                          options:NSLayoutFormatAlignAllLeading | NSLayoutFormatAlignAllTrailing
                                                                          metrics:metrics
                                                                            views:views]];
    
    // Do any additional setup after loading the view.
    self.parentViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(_cancelButtonPressed)];
    self.parentViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Habituate!" style:UIBarButtonItemStyleDone target:self action:@selector(_doneButtonPressed)];
}

- (void)_cancelButtonPressed
{
    NSLog(@"cancel button pressed");
}

- (void)_doneButtonPressed
{
    NSLog(@"done button pressed");
    
    Goal *newGoal = [Goal object];
    
    NSLog(@"category:%@\n", _category.textField.text);
    newGoal.categoryId = _category.textField.text;
    
    NSLog(@"goal:%@\n", _goal.textField.text);
    newGoal.title = _goal.textField.text;
    
    NSLog(@"units:%@\n", _unit.textField.text);
    newGoal.customUnits = _unit.textField.text;
    [newGoal saveInBackground];
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

@interface MultiPlaceholderTextField ()  <UITextFieldDelegate>

@end

@implementation MultiPlaceholderTextField {
    UITextField *_placeholderTextField;
    NSArray *_placeholders;
    NSUInteger _currentPlaceholder;
}

static NSMutableSet *s_instances;

+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instances = [NSMutableSet new];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self _updatePlaceholder];
        });
    });
}

+ (void)_updatePlaceholder
{
    [UIView animateWithDuration:1.0
                     animations:^{
                         [s_instances enumerateObjectsUsingBlock:^(MultiPlaceholderTextField *instance, BOOL *stop) {
                             instance->_placeholderTextField.alpha = 0.0;
                         }];
                     }
                     completion:^(BOOL finished) {
                         [s_instances enumerateObjectsUsingBlock:^(MultiPlaceholderTextField *instance, BOOL *stop) {
                             instance->_placeholderTextField.placeholder = instance->_placeholders[++instance->_currentPlaceholder % instance->_placeholders.count];
                         }];
                         [UIView animateWithDuration:1.0
                                          animations:^{
                                              [s_instances enumerateObjectsUsingBlock:^(MultiPlaceholderTextField *instance, BOOL *stop) {
                                                  instance->_placeholderTextField.alpha = 1.0;
                                              }];
                                          }
                                          completion:^(BOOL finished) {
                                              dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                  [self _updatePlaceholder];
                                              });
                                          }];
                     }];
}

- (instancetype)initWithPlaceholders:(NSArray *)placeholders
{
    self = [self init];
    
    if (self != nil) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        _placeholders = placeholders;
        _currentPlaceholder = 0;
        
        _placeholderTextField = [UITextField new];
        _placeholderTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _placeholderTextField.borderStyle = UITextBorderStyleRoundedRect;
        _placeholderTextField.placeholder = placeholders[_currentPlaceholder];
        [self addSubview:_placeholderTextField];
        
        _textField = [UITextField new];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.returnKeyType = UIReturnKeyDefault;
        _textField.autocapitalizationType = NO;
        _textField.delegate = self;
        [self addSubview:_textField];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_placeholderTextField, _textField);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_placeholderTextField]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_textField]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_placeholderTextField]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_textField]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:views]];
        
        [s_instances addObject:self];
    }
    
    return  self;
}

- (void)dealloc
{
    [s_instances removeObject:self];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _placeholderTextField.hidden = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_textField.text.length == 0) {
        _placeholderTextField.hidden = NO;
    }
}

@end