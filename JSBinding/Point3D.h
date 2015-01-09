//
//  Point3D.h
//  JSBinding
//
//  Created by mac on 15/1/9.
//  Copyright (c) 2015年 mjc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JavaScriptCore/JavaScriptCore.h>
@protocol Point3DExport <JSExport>
@property double x;
@property double y;
@property double z;

-(double)length;

@end

@interface Point3D : NSObject<Point3DExport>{
    JSContext *_ctx;
}
-initWithContext:(JSContext*)ctx;

@end
