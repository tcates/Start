//
//  GoalBuddies.h
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface GoalBuddies : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray /* User */ *buds;

+ (NSString *)parseClassName;

@end
