//
//  GoalEntry.h
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@class Goal;
@class User;

@interface GoalEntry : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *description; // optional
@property (nonatomic) NSInteger customCount;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) Goal *goal;
@property (strong, nonatomic) User *user;

+ (NSString *)parseClassName;

@end
