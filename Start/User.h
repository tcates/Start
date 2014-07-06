//
//  User.h
//  Start
//
//  Created by Tara Cates on 7/5/14.
//  Copyright (c) 2014 Tara Cates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email; // optional
@property (strong, nonatomic) NSString *objectId;
//@property (strong, nonatomic) NSArray /* User */ *posse;

@end
