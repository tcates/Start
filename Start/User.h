//
//  User.h
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email; // optional
//@property (strong, nonatomic) NSArray /* User */ *posse;

+ (NSString *)parseClassName;

@end
