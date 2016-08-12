//
//  Person.h
//  ShallowCopy&DeepCopy
//
//  Created by Zhaoyang on 16/8/9.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import <Foundation/Foundation.h>

// class copy


@interface Person : NSObject<NSCopying>

@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *name;

@end
