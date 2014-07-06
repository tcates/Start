//
//  GoalEntry.m
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import "GoalEntry.h"
#import <Parse/PFObject+Subclass.h>

@implementation GoalEntry

@dynamic description; // optional
@dynamic date;
@dynamic customCount;
@synthesize goal;
@synthesize user;

+ (NSString *)parseClassName {
    return @"GoalEntry";
}
@end
