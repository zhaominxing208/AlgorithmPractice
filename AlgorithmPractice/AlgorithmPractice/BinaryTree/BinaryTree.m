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
    BinaryTree *binaryTree = [[BinaryTree alloc]initWithMaxInt:20];
    
    [binaryTree printFront:binaryTree.root];
}

- (void)printFront:(TreeNode*)rootNode{

    
    if (rootNode) {
        NSLog(@"%@", rootNode.element);
        [self printFront:rootNode.left];
        [self printFront:rootNode.right];
        
        if (!rootNode.left || !rootNode.right) {
            NSLog(@"#");
        }
    }
}

@end
