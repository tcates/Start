//
//  Goal.m
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import "Goal.h"
#import <Parse/PFObject+Subclass.h>

@implementation Goal

@dynamic title;
@dynamic startDate;
@dynamic numDays;
@dynamic customUnits;
@dynamic categoryId;
@synthesize buddies;
@synthesize user;

+ (NSString *)parseClassName {
    return @"Goal";
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    
    if (self != nil) {
        self.title = title;
    }
    
    return self;
}


@end
