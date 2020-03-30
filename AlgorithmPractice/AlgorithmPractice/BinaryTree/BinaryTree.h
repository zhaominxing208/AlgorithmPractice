//
//  BinaryTree.h
//  AlgorithmPractice
//
//  Created by zmx on 2020/3/29.
//  Copyright © 2020 ChenFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface TreeNode : NSObject
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;
@property (nonatomic, strong) NSString *element;

+ (TreeNode*)createWithName:(NSString*)name;
@end
@interface BinaryTree : NSObject
@property (nonatomic, strong, readonly) TreeNode *root;
@property (nonatomic, assign, readonly) NSInteger depth;

+ (void)runTest;
@end

NS_ASSUME_NONNULL_END
