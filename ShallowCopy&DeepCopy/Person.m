//
//  Person.m
//  ShallowCopy&DeepCopy
//
//  Created by Zhaoyang on 16/8/9.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "Person.h"

@implementation Person


- (id)copyWithZone:(NSZone *)zone {
    Person *person = [[Person allocWithZone:zone] init];
    person.age = self.age;
    person.name = self.name;
    return person;
}
@end
