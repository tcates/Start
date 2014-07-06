//
//  GoalBuddies.m
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import "GoalBuddies.h"
#import <Parse/PFObject+Subclass.h>

@implementation GoalBuddies

@dynamic name;
@synthesize buds;

+ (NSString *)parseClassName {
    return @"GoalBuddies";
}

@end
