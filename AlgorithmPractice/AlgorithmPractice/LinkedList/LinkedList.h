//
//  LinkedList.h
//  AlgorithmPractice
//
//  Created by zmx on 2020/3/28.
//  Copyright © 2020 ChenFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Node *next;

+ (Node*)createWithName:(NSString*)name;
@end

@interface LinkedList : NSObject

@property (nonatomic, strong, readonly) Node *head;
@property (nonatomic, strong, readonly) Node *tail;
@property (nonatomic, assign, readonly) NSInteger count;

- (void)addNode:(Node*)insertNode forIndex:(NSInteger)index;
- (void)removeNodeForIndex:(NSInteger)index;
- (void)setNode:(Node*)newNode forIndex:(NSInteger)index;

+ (void)runTest;
@end
