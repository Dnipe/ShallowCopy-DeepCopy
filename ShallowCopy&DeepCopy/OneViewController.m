//
//  OneViewController.m
//  ShallowCopy&DeepCopy
//
//  Created by zhaoyang on 2020/4/14.
//  Copyright © 2020 Zy. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"begin %s, %d", __FUNCTION__,__LINE__);
    NSLog(@"%p, %@", self.strongStr, self.strongStr);
    NSLog(@"%p, %@", self.copysStr, self.copysStr);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongMStr, self.strongMStr);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongArray, self.strongArray);
    NSLog(@"%p, %@", self.copysArray, self.copysArray);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongMArray, self.strongMArray);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongDic, self.strongDic);
    NSLog(@"%p, %@", self.copysDic, self.copysDic);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongMDic, self.strongMDic);
    
    
    
    self.strongStr = [self.strongStr stringByAppendingString:@"-one"];
    self.copysStr = [self.copysStr stringByAppendingString:@"-one"];
    
    [self.strongMStr appendString:@"-one"];
    
    NSString *str = self.strongArray.firstObject;
    str = [str stringByAppendingString:@"-one"];

    str = self.copysArray.firstObject;
    str = [str stringByAppendingString:@"-one"];

//    str = self.strongMArray.firstObject;
//    str = [str stringByAppendingString:@"-one"];
    [self.strongMArray addObject:@"one"];

    str = self.strongDic.allValues.firstObject;
    str = [str stringByAppendingString:@"-one"];

    str = self.copysDic.allValues.firstObject;
    str = [str stringByAppendingString:@"-one"];

//    str = self.strongMDic.allValues.firstObject;
//    str = [str stringByAppendingString:@"-one"];
    [self.strongMDic setObject:@"one" forKey:@"one"];
//    [self.copysDic setValue:@"one" forKey:@"one"];
//    [self.strongDic setValue:@"one" forKey:@"one"];

    
    
    NSLog(@"%s, %d", __FUNCTION__,__LINE__);
    NSLog(@"%p, %@", self.strongStr, self.strongStr);
    NSLog(@"%p, %@", self.copysStr, self.copysStr);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongMStr, self.strongMStr);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongArray, self.strongArray);
    NSLog(@"%p, %@", self.copysArray, self.copysArray);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongMArray, self.strongMArray);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongDic, self.strongDic);
    NSLog(@"%p, %@", self.copysDic, self.copysDic);
    NSLog(@"++++++++++++++++++");
    NSLog(@"%p, %@", self.strongMDic, self.strongMDic);
    
    NSLog(@"end %s, %d", __FUNCTION__,__LINE__);


}








@end
