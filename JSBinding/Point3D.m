//
//  Point3D.m
//  JSBinding
//
//  Created by mac on 15/1/9.
//  Copyright (c) 2015年 mjc. All rights reserved.
//

#import "Point3D.h"

@implementation Point3D
@synthesize x,y,z;
-(id)initWithContext:(JSContext *)ctx{
    if (self = [super init]) {
        _ctx = ctx;
    }
    return self;
}

-(double)length{
    return <#expression#>
}
@end
