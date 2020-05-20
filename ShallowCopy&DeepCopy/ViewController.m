//
//  ViewController.m
//  ShallowCopy&DeepCopy
//
//  Created by Zhaoyang on 16/8/9.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "OneViewController.h"

@interface ViewController ()


// copy and strong
//@property (nonatomic, copy) NSString *copysStr;
//@property (nonatomic, strong) NSString *strongStr;
@property (nonatomic, copy) NSMutableString *copsStr;

@property (nonatomic, strong) NSString *strongStr;
@property (nonatomic, copy) NSString *copysStr;

@property (nonatomic, strong) NSMutableString *strongMStr;

@property (nonatomic, strong) NSArray *strongArray;
@property (nonatomic, copy) NSArray *copysArray;

@property (nonatomic, strong) NSMutableArray *strongMArray;

@property (nonatomic, strong) NSDictionary *strongDic;
@property (nonatomic, copy) NSDictionary *copysDic;

@property (nonatomic, strong) NSMutableDictionary *strongMDic;

@end



//  blog address :   http://blog.ximu.site/deep-or-shallow-copy/
@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    OneViewController *one = [[OneViewController alloc] init];
    
    one.strongStr = self.strongStr;
    one.copysStr = self.copysStr;
    
    one.strongMStr = self.strongMStr;
    
    one.strongArray = self.strongArray;
    one.copysArray = self.copysArray;
    
    one.strongMArray = self.strongMArray;
    
    one.strongDic = self.strongDic;
    one.copysDic = self.copysDic;
    
    one.strongMDic = self.strongMDic;
    
    [self.navigationController pushViewController:one animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"begin %s, %d", __FUNCTION__,__LINE__);
    NSLog(@"%p, %@", self.strongStr, self.strongStr);
    NSLog(@"%p, %@", self.copysStr, self.copysStr);
    NSLog(@"===============");
    NSLog(@"%p, %@", self.strongMStr, self.strongMStr);
    NSLog(@"===============");
    NSLog(@"%p, %@", self.strongArray, self.strongArray);
    NSLog(@"%p, %@", self.copysArray, self.copysArray);
    NSLog(@"===============");
    NSLog(@"%p, %@", self.strongMArray, self.strongMArray);
    NSLog(@"===============");
    NSLog(@"%p, %@", self.strongDic, self.strongDic);
    NSLog(@"%p, %@", self.copysDic, self.copysDic);
    NSLog(@"===============");
    NSLog(@"%p, %@", self.strongMDic, self.strongMDic);
    NSLog(@"end %s, %d", __FUNCTION__,__LINE__);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.strongStr = @"strongStr";
    self.copysStr = @"copysStr";

    self.strongMStr = [NSMutableString stringWithString:@"strongMStr"];

    self.strongArray = @[@"strongArray"];
    self.copysArray = @[@"copysArray"];

    self.strongMArray = @[@"strongMArray"].mutableCopy;

    self.strongDic = @{@"key":@"strongDic"};
    self.copysDic = @{@"key":@"copysDic"};

    self.strongMDic = @{@"key":@"strongMDic"}.mutableCopy;
    
    
    
//    [self firstMethod];
//    [self secondMethod];
//    [self testMethod];
    
//    [self thirdMethod];
//    [self fourthMethod];
//    [self fifthMethod];
   
//    [self sixthMethod];
//
//
//    [self seventhMethod];
//
//    [self eighthMethod];
    
    
//    [self ninthMethod];

//    [self tenthMethod];
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

- (void)testMethod {
//    NSArray *array1 = @[@"1", @"2"];
//    NSLog(@"retainCount:%ld", [array1 retainCount]);
//    NSMutableArray *array2 = array1.mutableCopy;
//    NSLog(@"retainCount:%ld", [array1 retainCount]);
//    NSArray *array3 = array1.copy;
//    NSLog(@"retainCount:%ld", [array1 retainCount]);
//
//    NSLog(@"==========");
//    NSArray *array4 = @[@"1", @"2"].mutableCopy;
//    NSLog(@"retainCount:%ld", [array4 retainCount]);
//
//    NSArray *array5 = array4.copy;
//    NSLog(@"retainCount:%ld", [array4 retainCount]);
//
//    NSMutableArray *array6 = array4.mutableCopy;
//    NSLog(@"retainCount:%ld", [array4 retainCount]);
//
//
//
//
//    NSLog(@"%p, %p, %p", array1, array2, array3);
//    NSLog(@"%p, %p, %p", array4, array5, array6);
//    for (NSString *str in array4) {
//        NSLog(@"str1 = %p", str);
//    }
//    for (NSString *str in array5) {
//        NSLog(@"str2 = %p", str);
//    }
//    for (NSString *str in array6) {
//        NSLog(@"str3 = %p", str);
//    }
    
    NSMutableDictionary *dic1 = @{@"key":@"value"}.mutableCopy;
    NSLog(@"retainCount:%ld", [dic1 retainCount]);
    
    NSDictionary *dic2 = dic1.copy;
    NSLog(@"retainCount:%ld", [dic1 retainCount]);
    
    NSMutableDictionary *dic3 = dic1.mutableCopy;
    NSLog(@"retainCount:%ld", [dic1 retainCount]);
    
    NSLog(@"%p, %p, %p", dic1, dic2, dic3);
    

    for (NSString *str in dic1.allKeys) {
        NSLog(@"str1 = %p", str);
    }
    for (NSString *str in dic2.allKeys) {
        NSLog(@"str2 = %p", str);
    }
    
    for (NSString *str in dic3.allKeys) {
        NSLog(@"str3 = %p", str);
    }
    
    
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
    NSLog(@"dataArray1：%@",dataArray1);

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
    NSLog(@"dataArray1：%@",dataArray1);

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
    
    NSMutableArray *mArr1 = (NSMutableArray *)dataArray3[4];
    mStr = mArr1[0];
    [mStr appendString:@"--Test"];

    NSLog(@"dataArray3：%@",dataArray3);
    NSLog(@"dataArray2：%@",dataArray2);
    NSLog(@"dataArray1：%@",dataArray1);

}


- (void)sixthMethod {
    Person *person = [[Person alloc] init];
    person.age = @"14";
    person.name = @"Tom";
    
    Person *copyPerson = [person copy];
    NSLog(@"%@ ==== %@", copyPerson.age, copyPerson.name);
    
    NSLog(@"+++++++++++++++++++++++++++++++++++++++");
}




- (void)seventhMethod {
    NSMutableString *copyString = [[NSMutableString alloc] initWithString:@"222"];
    self.copysStr = copyString;
    NSString *str = copyString;
    [copyString appendString:@"wwwwww"];
    NSLog(@"%p *** %p *** %p", copyString, self.copysStr, str);
    NSLog(@"%@ === %@ === %@", copyString, self.copysStr, str);
    
    self.strongStr = copyString ;
    [copyString appendString:@"FFFF"];
    NSLog(@"%p *** %p", copyString, self.strongStr);
    NSLog(@"%@ === %@", copyString, self.strongStr);
    
    NSLog(@"+++++++++++++++++++++++++++++++++++++++");
}

- (void)eighthMethod {
    
    
    // 运行时会 crash, copy关键字的string的setter方法实际上是把参数copy之后再赋值给变量string，那么此时变量string虽然被申明为NSMutableString，但是copy之后，就把 变量_string变成了不可变的NSString类型，所以就会出现方法报错，提示对不可变的NSString使用了NSMutableString的方法appendString
//    self.copsStr = [[NSMutableString alloc] initWithString:@"dadfq"];
//    [self.copsStr appendString:@"222"];
    
}



- (void)ninthMethod {
    
    NSArray *array = [NSArray arrayWithObjects:
                      [NSMutableString stringWithFormat:@"one"],
                      [NSMutableString stringWithFormat:@"two"],
                      nil];
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:
                              [NSMutableString stringWithFormat:@"three"],
                              [NSMutableString stringWithFormat:@"four"],
                              nil];
    
    NSArray *copyArray = [array copy];
    NSArray *mCopyArray = [array mutableCopy];
    
    
    
    NSArray *copyMArray = [mArray copy];
    NSArray *mCopyMArray = [mArray mutableCopy];
    
    
    
    
    NSLog(@"array: %@, mArray: %@", @([array retainCount]), @([mArray retainCount]));
    
    NSLog(@"%p ** %p ** %p", array, copyArray, mCopyArray);
    
    NSLog(@"%p ** %p ** %p", mArray, copyMArray, mCopyMArray);
    
    NSLog(@"%@ ** %@ ** %@ ** %@", copyMArray.class, mCopyArray.class, copyMArray.class, mCopyMArray.class);
    
    
    NSLog(@"=====================================");
    
    
    [(NSMutableString *)copyArray[0] appendString:@"-test"];
    [(NSMutableString *)mCopyArray[0] appendString:@"*test"];
    
    [(NSMutableString *)copyMArray[0] appendString:@"=test"];
    [(NSMutableString *)mCopyMArray[0] appendString:@"+test"];
    
    
    NSLog(@"%@", array);
    NSLog(@"%@", mArray);
    NSLog(@"%@", copyArray);
    NSLog(@"%@", mCopyArray);
    NSLog(@"%@", copyMArray);
    NSLog(@"%@", mCopyMArray);
    
    NSLog(@"+++++++++++++++++++++++++++++++++++++++");
}


- (void)tenthMethod {
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSMutableString stringWithFormat:@"one"], @"one", [NSMutableString stringWithFormat:@"two"], @"tow", nil];
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSMutableString stringWithFormat:@"three"], @"three", [NSMutableString stringWithFormat:@"four"], @"four", nil];
    
    
    NSDictionary *copyDic = [dic copy];
    NSDictionary *mCopyDic = [dic mutableCopy];
    
    NSDictionary *copyMDic = [mDic copy];
    NSDictionary *mCopyMDic = [mDic mutableCopy];
    
    NSLog(@"%@, %@", @([dic retainCount]), @([mDic retainCount]));
    
    
    
    NSLog(@"%p ** %p ** %p", dic, copyDic, mCopyDic);
    
    NSLog(@"%p ** %p ** %p", mDic, copyMDic, mCopyMDic);
    
    NSLog(@"%@ ** %@ ** %@ ** %@", copyDic.class, mCopyDic.class, copyMDic.class, mCopyMDic.class);
    
    NSLog(@"=====================================");
    
    
    [(NSMutableString *)[copyDic objectForKey:@"one"] appendString:@"-test"];
    [(NSMutableString *)[mCopyDic objectForKey:@"one"] appendString:@"*test"];
    [(NSMutableString *)[copyMDic objectForKey:@"three"] appendString:@"=test"];
    [(NSMutableString *)[mCopyMDic objectForKey:@"three"] appendString:@"+test"];
    
    NSLog(@"%@", dic);
    NSLog(@"%@", mDic);
    NSLog(@"%@", copyDic);
    NSLog(@"%@", mCopyDic);
    NSLog(@"%@", copyMDic);
    NSLog(@"%@", mCopyMDic);
}



/**
 
 由上面的例子可以看出, copy和 mutableCopy 都不是深拷贝, 在使用时要注意拷贝对象改变时, 被拷贝的对象也会改变, 属性对象设置为 copy 时也要特别注意
 
 */







@end
