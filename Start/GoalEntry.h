//
//  GoalEntry.h
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Goal;
@class User;

@interface GoalEntry : NSObject

@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSString *description; // optional
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) Goal *goal;
@property (strong, nonatomic) User *user;

@end
