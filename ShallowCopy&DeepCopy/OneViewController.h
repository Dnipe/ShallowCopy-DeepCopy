//
//  OneViewController.h
//  ShallowCopy&DeepCopy
//
//  Created by zhaoyang on 2020/4/14.
//  Copyright © 2020 Zy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OneViewController : UIViewController

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

NS_ASSUME_NONNULL_END
