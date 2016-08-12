//
//  ViewController.m
//  ShallowCopy&DeepCopy
//
//  Created by Zhaoyang on 16/8/9.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController ()


// copy and strong
@property (nonatomic, copy) NSString *copysStr;
@property (nonatomic, strong) NSString *strongStr;
@property (nonatomic, copy) NSMutableString *copsStr;
@end



//  blog address :   http://blog.ximu.site/deep-or-shallow-copy/
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self firstMethod];
//    [self secondMethod];
    
    
//    [self thirdMethod];
//    [self fourthMethod];
//    [self fifthMethod];
   
//    [self sixthMethod];
    
    
    [self seventhMethod];
    
//    [self eighthMethod];
    
}

/**
 *  先来看看苹果文档的定义：
 
 *  There are two kinds of object copying: shallow copies and deep copies. The normal copy is a shallow copy that produces a new collection that shares ownership of the objects with the original. Deep copies create new objects from the originals and add those to the new collection.
 
 *  In the case of these objects, a shallow copy means that a new collection object is created, but the contents of the original collection are not duplicated—only the object references are copied to the new container.
 *  A deep copy duplicates the compound object as well as the contents of all of its contained objects.
 */

/**
 *  再来看看stackoverfolow网友的总结：
 
 *  Shallow copies duplicate as little as possible. A shallow copy of a collection is a copy of the collection structure, not the elements. With a shallow copy, two collections now share the individual elements.
 
 *  Deep copies duplicate everything. A deep copy of a collection is two collections with all of the elements in the original collection duplicated
 
 */

/**
 简单来说：(总结)
 
 浅拷贝：只是复制容器本身，不会复制容器内部的元素，浅拷贝后生成的新容器对象和原始容器对象共享内部元素
 深拷贝：不仅复制容器本身，容器内部的元素也会复制，深拷贝后生成的新容器对象和原始容器的内部元素是独立的。
 */


- (void)firstMethod {
    NSMutableArray *dataArray2 = [NSMutableArray arrayWithObjects:
                                  [NSMutableString stringWithString:@"one"],
                                  [NSMutableString stringWithString:@"two"],
                                  [NSMutableString stringWithString:@"three"],
                                  [NSMutableString stringWithString:@"four"],
                                  nil];
    NSMutableArray *dataArray3;
    NSMutableString *mStr;
    
    // copy 生成不可变对象, mutableCopy 生成可变对象
    
    
    dataArray3 = [dataArray2 mutableCopy];
    
    mStr = dataArray2[0];
    [mStr appendString:@"--ONE"];
    
    NSLog(@"dataArray3 : %@", dataArray3);
    
    NSLog(@"dataArray2 : %@", dataArray2);
 
    NSLog(@"dataArray2 address = %p, dataArray3 address = %p", dataArray2, dataArray3);
    
    for (NSMutableString *str  in dataArray2) {
        NSLog(@"dataArray2 elements = %p", str);
    }
    
    for (NSMutableString *str  in dataArray3) {
        NSLog(@"dataArray3 elements = %p", str);
    }
    
//    2016-08-09 16:24:46.016 ShallowCopy&DeepCopy[33285:3312970] dataArray3 : (
//                                                                              "one--ONE",
//                                                                              two,
//                                                                              three,
//                                                                              four
//                                                                              )
//    2016-08-09 16:24:46.017 ShallowCopy&DeepCopy[33285:3312970] dataArray2 : (
//                                                                              "one--ONE",
//                                                                              two,
//                                                                              three,
//                                                                              four
//                                                                              )
//    2016-08-09 16:36:58.824 ShallowCopy&DeepCopy[33328:3345397] dataArray2 address = 0x7fd040c1bde0, dataArray3 address = 0x7fd040c21a20
//    2016-08-09 16:36:58.824 ShallowCopy&DeepCopy[33328:3345397] dataArray2 elements = 0x7fd040c1da90
//    2016-08-09 16:36:58.824 ShallowCopy&DeepCopy[33328:3345397] dataArray2 elements = 0x7fd040c0bc20
//    2016-08-09 16:36:58.824 ShallowCopy&DeepCopy[33328:3345397] dataArray2 elements = 0x7fd040c1fd60
//    2016-08-09 16:36:58.824 ShallowCopy&DeepCopy[33328:3345397] dataArray2 elements = 0x7fd040c07730
//    2016-08-09 16:36:58.825 ShallowCopy&DeepCopy[33328:3345397] dataArray3 elements = 0x7fd040c1da90
//    2016-08-09 16:36:58.825 ShallowCopy&DeepCopy[33328:3345397] dataArray3 elements = 0x7fd040c0bc20
//    2016-08-09 16:36:58.825 ShallowCopy&DeepCopy[33328:3345397] dataArray3 elements = 0x7fd040c1fd60
//    2016-08-09 16:36:58.825 ShallowCopy&DeepCopy[33328:3345397] dataArray3 elements = 0x7fd040c07730
    /**
     此时 mutableCopy 是浅拷贝, 只拷贝了容器, 分享内部元素
     */
    
}


- (void)secondMethod {
    NSArray *array = @[@1];
    NSLog(@"retainCount:%ld", [array retainCount]);
    
    NSArray *array2 = [array copy];
    
    NSLog(@"retainCount:%ld", [array2 retainCount]);
    NSLog(@"retainCount:%ld", [array retainCount]);
    NSLog(@"内存地址:%p---%p", array,array2);
    
    /**
     
     copy操作返回的必然是一个不可变对象，无论源对象是可变对象还是不可变对象。如果源对象是一个不可变对象，那么它们（源对象和新生成的对象）指向同一个对象，如果源对象是可变对象，它们指向不同对象。
     mutableCopy]返回的必然是一个可变对象，无论源对象是可变对象还是不可变对象，它们（源对象和新生成的对象）仍指向不同地址，是两个对象。
     copy和mutableCopy都生成新对象
     */
}

// 单层深拷贝, 完全深拷贝

/// 单层深拷贝
- (void)thirdMethod {
    
    NSMutableArray *dataArray1 = [NSMutableArray arrayWithObjects:
                                  [NSMutableString stringWithString:@"1"],
                                  [NSMutableString stringWithString:@"2"],
                                  [NSMutableString stringWithString:@"3"],
                                  [NSMutableString stringWithString:@"4"],
                                  nil];
    
    NSMutableArray * dataArray2 = [NSMutableArray arrayWithObjects:
                                  [NSMutableString stringWithString:@"one"],
                                  [NSMutableString stringWithString:@"two"],
                                  [NSMutableString stringWithString:@"three"],
                                  [NSMutableString stringWithString:@"four"],
                                  dataArray1,
                                  nil
                                  ];
    NSMutableArray * dataArray3;
    NSMutableString * mStr;
    
    dataArray3=[[NSMutableArray alloc]initWithArray:dataArray2 copyItems:YES]; // 此方法只能复制单层
    
    mStr = dataArray2[0];
    [mStr appendString:@"--ONE"];
    
    NSLog(@"dataArray3：%@",dataArray3);
    NSLog(@"dataArray2：%@",dataArray2);
}
 
- (void)fourthMethod {
    NSMutableArray * dataArray1=[NSMutableArray arrayWithObjects:
                                 [NSMutableString stringWithString:@"1"],
                                 [NSMutableString stringWithString:@"2"],
                                 [NSMutableString stringWithString:@"3"],
                                 [NSMutableString stringWithString:@"4"],
                                 nil
                                 
                                 ];
    NSMutableArray * dataArray2=[NSMutableArray arrayWithObjects:
                                 [NSMutableString stringWithString:@"one"],
                                 [NSMutableString stringWithString:@"two"],
                                 [NSMutableString stringWithString:@"three"],
                                 [NSMutableString stringWithString:@"four"],
                                 dataArray1,
                                 nil
                                 ];
    
    NSMutableArray * dataArray3;
    NSMutableString * mStr;
    
    dataArray3=[[NSMutableArray alloc]initWithArray:dataArray2 copyItems:YES]; // 此方法只能复制单层
    
    NSMutableArray *mArr = (NSMutableArray *)dataArray2[4];
    mStr = mArr[0];
    [mStr appendString:@"--ONE"];
    
    NSLog(@"dataArray3：%@",dataArray3);
    NSLog(@"dataArray2：%@",dataArray2);
}

// deep copy
- (void)fifthMethod {
    NSMutableArray * dataArray1=[NSMutableArray arrayWithObjects:
                                 [NSMutableString stringWithString:@"1"],
                                 [NSMutableString stringWithString:@"2"],
                                 [NSMutableString stringWithString:@"3"],
                                 [NSMutableString stringWithString:@"4"],
                                 nil
                                 
                                 ];
    NSMutableArray * dataArray2=[NSMutableArray arrayWithObjects:
                                 [NSMutableString stringWithString:@"one"],
                                 [NSMutableString stringWithString:@"two"],
                                 [NSMutableString stringWithString:@"three"],
                                 [NSMutableString stringWithString:@"four"],
                                 dataArray1,
                                 nil
                                 ];
    
    NSMutableArray * dataArray3;
    NSMutableString * mStr;
    
    dataArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:dataArray2]];
    
    NSMutableArray *mArr = (NSMutableArray *)dataArray2[4];
    mStr = mArr[0];
    [mStr appendString:@"--ONE"];
    
    NSLog(@"dataArray3：%@",dataArray3);
    NSLog(@"dataArray2：%@",dataArray2);
}


- (void)sixthMethod {
    Person *person = [[Person alloc] init];
    person.age = @"14";
    person.name = @"Tom";
    
    Person *copyPerson = [person copy];
    NSLog(@"%@ ==== %@", copyPerson.age, copyPerson.name);
}




- (void)seventhMethod {
    NSMutableString *copyString = [[NSMutableString alloc] initWithString:@"222"];
    self.copysStr = copyString;
    NSString *str = copyString;
    [copyString appendString:@"wwwwww"];
    NSLog(@"%p *** %p *** %p", copyString, self.copysStr, str);
    NSLog(@"%@ === %@ === %@", copyString, self.copysStr, str);
    
    self.strongStr = copyString ;
    
    NSLog(@"%p *** %p", copyString, self.strongStr);
    NSLog(@"%@ === %@", copyString, self.strongStr);
}

- (void)eighthMethod {
    
    
    // 运行时会 crash, copy关键字的string的setter方法实际上是把参数copy之后再赋值给变量string，那么此时变量string虽然被申明为NSMutableString，但是copy之后，就把 变量_string变成了不可变的NSString类型，所以就会出现方法报错，提示对不可变的NSString使用了NSMutableString的方法appendString
    self.copsStr = [[NSMutableString alloc] initWithString:@"dadfq"];
    [self.copsStr appendString:@"222"];
    
}
















@end
