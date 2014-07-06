//
//  User.m
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import "User.h"
#import <Parse/PFObject+Subclass.h>

@implementation User

@dynamic name;
@dynamic email; // optional

+ (NSString *)parseClassName {
    return @"User";
}
@end
