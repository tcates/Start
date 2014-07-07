//
//  User.m
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//


#import <Parse/PFObject+Subclass.h>

#import "Goal.h"
#import "User.h"

@implementation User

@dynamic name;
@dynamic email; // optional
@synthesize goals;

-(NSArray *)goals
{
    return @[
             [[Goal alloc] initWithTitle:@"Foo"],
             [[Goal alloc] initWithTitle:@"Bar"],
             [[Goal alloc] initWithTitle:@"Baz"],
             ];
}

@end
