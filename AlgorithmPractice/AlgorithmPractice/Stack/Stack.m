//
//  Stack.m
//  AlgorithmPractice
//
//  Created by zmx on 2020/3/31.
//  Copyright © 2020 ChenFeng. All rights reserved.
//

#import "Stack.h"

@interface Stack ()
@property (nonatomic, strong) NSMutableArray *data;
@end


@implementation Stack
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.data = @[].mutableCopy;
    }
    return self;
}

- (void)push:(id)data{
    [self.data addObject:data];
}

- (id)pop{
    if (_data.count == 0) {
        return nil;
    }
    
    id data = _data.lastObject;
    [_data removeLastObject];
    return data;
}

+ (void)runTest{
    Stack *stack = [Stack new];
    NSDictionary *map = @{@'(':@')',@'{':@'}',@'[':@']'};
    NSString *input = @"([{}])";
    BOOL ret = YES;
    
    for (int i = 0; i<input.length; i++) {
        unichar charCode = [input characterAtIndex:i];
        if (charCode == '(' || charCode == '[' || charCode == '{') {
            [stack push:@(charCode)];
        }else{
            unichar popChar = [[stack pop] unsignedCharValue];
            if ([map[@(popChar)] unsignedCharValue] != charCode) {
                ret = NO;
                break;
            }
        }
    }
                          
                          
    NSLog(@"input %@ is %@",input,@(ret));
    
}

+ (void)load{
    [Stack runTest];
}
@end
