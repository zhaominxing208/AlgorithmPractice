//
//  Queue.m
//  AlgorithmPractice
//
//  Created by zmx on 2020/3/31.
//  Copyright © 2020 ChenFeng. All rights reserved.
//

#import "Queue.h"

@interface Queue ()
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, assign) NSInteger indexHead;
@property (nonatomic, assign) NSInteger indexTail;
@end

@implementation Queue
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.data = @[].mutableCopy;
        self.indexHead = self.indexTail = 0;
    }
    return self;
}

- (void)push:(NSString*)data{
    [self.data insertObject:data atIndex:0];
}

- (NSString*)pop{
    if (_data.count == 0) {
        return nil;
    }
    
    NSString *data = _data.lastObject;
    [_data removeLastObject];
    return data;
}
@end
