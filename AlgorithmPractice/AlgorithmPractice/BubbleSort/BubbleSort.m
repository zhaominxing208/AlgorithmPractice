//
//  BubbleSort.m
//  AlgorithmPractice
//
//  Created by zmx on 2020/3/28.
//  Copyright © 2020 ChenFeng. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort
// 降序
+ (NSMutableArray*)sort:(NSMutableArray*)array{
    for (int i = 0; i < array.count; i++) {
        for (int j = 0; j < array.count - 1; j++) {
            // 不申请临时变量交换数组元素
            // 对于任何整数x有x^x = 0, x^0 = x ，且运算满足结合律。所以可以用如下方法完成交换。
            if ([array[j] intValue] < [array[j+1] intValue]) {
                array[j] =@([array[j] intValue] ^ [array[j+1] intValue]);
                array[j+1] =@([array[j] intValue] ^ [array[j+1] intValue]);
                array[j] =@([array[j] intValue] ^ [array[j+1] intValue]);
            }
        }
    }
    
    return array;
}

+ (void)runTest{
    NSMutableArray *array = @[@1,@5,@3,@20,@4].mutableCopy;
    array = [self sort:array];
    NSLog(@"%@",array);
}

@end
