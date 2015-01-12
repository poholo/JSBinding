//
//  Conse.h
//  JSBinding
//
//  Created by mac on 15/1/12.
//  Copyright (c) 2015年 mjc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ConsoleExport <JSExport>
-(void)log;
@end

@interface Console : NSObject<ConsoleExport>{
    JSContext *_ctx;
}
-(id)initWithJSContext:(JSContext*)ctx;
@end
