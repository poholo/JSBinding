//
//  ViewController.m
//  JSBinding
//
//  Created by mac on 15/1/9.
//  Copyright (c) 2015年 mjc. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "Point3D.h"
#import "Console.h"

@interface ViewController ()

@end

@implementation ViewController

void loadJS(JSContext *ctx,NSString *fileName,NSString *lastFileName){
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:lastFileName];
    NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [ctx evaluateScript:script];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JSContext *context = [[JSContext alloc] init];
    
    context.exceptionHandler = ^(JSContext *ctx,JSValue *excetion){
        NSLog(@"%@",excetion);
    };
    
    //
    JSValue *result = [context evaluateScript:@"1+2"];
    NSLog(@"%d",[result toInt32]);
    
    //js 函数
    context[@"sum"] = ^(int a,int b){
        return a + b;
    };
    JSValue *sum = context[@"sum"];
    JSValue *result1 = [sum callWithArguments:@[@1,@2]];
    NSLog(@"sum(1,2)=%d",[result1 toInt32]);
    
    
    //创建一个js的值
    JSValue *intValue = [JSValue valueWithInt32:3331 inContext:context];
    context[@"bar"] = intValue;
    [context evaluateScript:@"bar++"];
    
    NSLog(@"bar --- %d---%d",[intValue toInt32],[context[@"bar"] toInt32]);
    
    [context evaluateScript:@"var bar = 231"];
    NSLog(@"bar ======= %f",[context[@"bar"] toDouble]);
    
    //exception
    NSLog(@"ex--%f",[context[@"a.b=123"] toDouble]);
    
    
    //js->objc
    //1.block
    //2.create js export -> js code
    context[@"miximixi"] = ^(NSString *str1, NSString *str2){
        JSContext *ctx = [JSContext currentContext];
        ctx[@"newGlobal=3"];
        return [str1 stringByAppendingString:str2];
    };
    
//    Console *console = [[Console alloc] initWithJSContext:context];
    
    
    NSLog(@"**************************1**********************\n\n\n\n\n\n");
    
    Point3D *point3d = [[Point3D alloc] initWithContext:context];
    point3d.x = 1;
    point3d.y = 2;
    point3d.z = 3;
    
    context[@"point3D"] = point3d;
    NSString *script = @"point3D.x=2;point3D.y=3,point3D.z=4;point3D.length()";
    
    result = [context evaluateScript:script];
    double sqrt = [result toDouble];
    
    context[@"foo"] = ^(){
        return @"Hello OC,I'm from JS.";
    };
    
    script = @"Console.log()";
    [context evaluateScript:script];
    NSLog(@"**********************2**************************\n\n\n\n\n\n");
    loadJS(context, @"test", @"js");
    
    
    
    


    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
