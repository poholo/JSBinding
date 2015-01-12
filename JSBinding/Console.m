//
//  Conse.m
//  JSBinding
//
//  Created by mac on 15/1/12.
//  Copyright (c) 2015年 mjc. All rights reserved.
//

#import "Console.h"

@implementation Console
-(id)initWithJSContext:(JSContext *)ctx{
    if (self = [super init]) {
        _ctx = ctx;
        _ctx[@"Console"] = [Console class];
    }
    return self;
}

-(void)log{
    NSArray *arr = [JSContext currentArguments];
    NSLog(@"%@",[arr componentsJoinedByString:@","]);
}
@end
