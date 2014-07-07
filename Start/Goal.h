//
//  Goal.h
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@class User;
@class GoalBuddies;

@interface Goal : PFObject<PFSubclassing>
/*
 * Values stored in Parse for Goal objects
 */
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDate *startDate;
@property (nonatomic) NSInteger numDays;
@property (strong, nonatomic) NSString *customUnits;

// Either goal buddies or user will be set, not both
@property (strong, nonatomic) GoalBuddies *buddies;
@property (strong, nonatomic) User *user;

// health, relationships, etc.
@property (strong, nonatomic) NSString *categoryId;

- (instancetype)initWithTitle:(NSString *)title;

// an array of hearts
// an array of comments

+ (NSString *)parseClassName;

@end
