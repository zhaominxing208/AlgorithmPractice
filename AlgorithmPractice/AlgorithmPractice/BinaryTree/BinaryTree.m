//
//  BinaryTree.m
//  AlgorithmPractice
//
//  Created by zmx on 2020/3/29.
//  Copyright © 2020 ChenFeng. All rights reserved.
//

#import "BinaryTree.h"

@implementation TreeNode

+ (TreeNode*)createWithName:(NSString*)name{
    TreeNode *node = [[TreeNode alloc]init];
    node.element = name;
    return node;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.element];
}
@end

@interface BinaryTree ()
@property (nonatomic, strong) TreeNode *root;
@property (nonatomic, assign) NSInteger count;
@end

@implementation BinaryTree
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithMaxInt:(NSInteger)maxInt
{
    self = [super init];
    if (self) {
        TreeNode *node = self.root;
        for (int i = 0; i < maxInt; i++) {
            node = [self addNode:node element:@(i).stringValue];
        }
    }
    return self;
}

- (instancetype)initWithArray:(NSArray*)array{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (TreeNode*)createFullTree:(TreeNode*)node withArray:(NSArray*)array index:(NSInteger)index{
    if (array.count == 0) {
        return nil;
    }
    
    if (!node && index < array.count) {
        node = [TreeNode createWithName:array[index]];
        node.left = [BinaryTree createFullTree:node.left withArray:array index:2*index+1];
        node.right = [BinaryTree createFullTree:node.right withArray:array index:2*index+2];
    }
    
    return node;
}

- (TreeNode*)addNode:(TreeNode*)root element:(NSString*)element{
    if (!root) {
 
        root = [TreeNode createWithName:element];
        if (self.count == 0) {
             self.root = root;
        }
        self.count ++;
    }
    else if ([element intValue] % 2 == 0){
        root.left  = [self addNode:root.left element:element];
    }else{
        root.right = [self addNode:root.right element:element];
    }
    

    return root;
}

+ (void)runTest{
    TreeNode *fullTree = [BinaryTree createFullTree:nil withArray:@[@7,@2,@9,@4,@23] index:0];
    
    [BinaryTree printLevel:fullTree];
}

+ (void)printFront:(TreeNode*)rootNode{
    if (rootNode) {
        NSLog(@"%@", rootNode.element);
        [self printFront:rootNode.left];
        [self printFront:rootNode.right];
    }
}

+ (void)printFrontLoop:(TreeNode*)rootNode{
    TreeNode *p = rootNode;
    NSMutableArray *stack = @[].mutableCopy;
    do {
        if (p != nil) {
            NSLog(@"%@", p.element);
            [stack addObject:p];
            p = p.left;
        }else{
            TreeNode *preRoot = stack.lastObject;
            [stack removeLastObject];
            p = preRoot.right;
        }

        
    } while (p != nil || stack.count > 0);
}

+ (void)printMid:(TreeNode*)rootNode{
    if (rootNode) {
        [self printFront:rootNode.left];
        NSLog(@"%@", rootNode.element);
        [self printFront:rootNode.right];
    }
}

+ (void)printMidLoop:(TreeNode*)rootNode{
    TreeNode *p = rootNode;
    NSMutableArray *stack = @[].mutableCopy;
    do {
        if (p != nil) {
            [stack addObject:p];
            p = p.left;
        }else{
            TreeNode *preRoot = stack.lastObject;
            [stack removeLastObject];
            NSLog(@"%@", preRoot.element);
            p = preRoot.right;
        }

        
    } while (p != nil || stack.count > 0);
}


+ (void)printEnd:(TreeNode*)rootNode{
    if (rootNode) {
        [self printFront:rootNode.right];
        NSLog(@"%@", rootNode.element);
        [self printFront:rootNode.left];
    }
}

+ (void)printEndLoop:(TreeNode*)rootNode{
    TreeNode *p = rootNode;
    NSMutableArray *stack = @[].mutableCopy;
    do {
        if (p != nil) {
            [stack addObject:p];
            p = p.left;
        }else{
            TreeNode *preRoot = stack.lastObject;
            [stack removeLastObject];
            NSLog(@"%@", preRoot.element);
            p = preRoot.right;
        }

        
    } while (p != nil || stack.count > 0);
}


+ (void)printLevel:(TreeNode*)rootNode{
    NSMutableArray *queue = @[].mutableCopy;
    
    [queue addObject:rootNode];
    while (queue.count > 0) {
        
        TreeNode *node = queue.lastObject;
        NSLog(@"%@", node.element);
        [queue removeLastObject];
        
        
        if (node.left) {
           [queue insertObject:node.left atIndex:0];
        }
        
        if (node.right) {
            [queue insertObject:node.right atIndex:0];
        }


    }
}

@end
