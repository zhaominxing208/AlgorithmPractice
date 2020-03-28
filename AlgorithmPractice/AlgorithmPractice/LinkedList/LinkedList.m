//
//  LinkedList.m
//  AlgorithmPractice
//
//  Created by zmx on 2020/3/28.
//  Copyright © 2020 ChenFeng. All rights reserved.
//

#import "LinkedList.h"
@interface LinkedList ()
@property (nonatomic, strong) Node *head;
@property (nonatomic, assign) NSInteger count;
@end


@implementation Node
- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

+ (Node*)createWithName:(NSString*)name{
    return [[Node alloc]initWithName:name];
}

@end

@implementation LinkedList

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.head = [Node createWithName:@"head"];
    }
    return self;
}

- (void)addNode:(Node*)insertNode forIndex:(NSInteger)index{
    if (index > self.count + 1) {
        return;
    }
    
    Node *prevNode = self.head;
    for (int i = 0; i < index; i++) {
        prevNode = prevNode.next;
    }
    
    insertNode.next = prevNode.next;
    prevNode.next = insertNode;
    self.count ++;
}

- (void)removeNodeForIndex:(NSInteger)index{
    if (index > self.count + 1) {
        return;
    }
    
    Node *prevNode = self.head;
    for (int i = 0; i < index; i++) {
        prevNode = prevNode.next;
    }
    
    Node *nodeDel = prevNode.next;
    prevNode.next = prevNode.next.next;
    nodeDel = nil;
    self.count --;
}

- (void)setNode:(Node*)newNode forIndex:(NSInteger)index{
    if (index > self.count + 1) {
         return;
    }
     
    Node *prevNode = self.head;
    for (int i = 0; i < index; i++) {
        prevNode = prevNode.next;
    }
    prevNode.name = newNode.name;
}

- (Node*)getNodeForIndex:(NSInteger)index{
    Node *prev = self.head;
    for (int i = 0; i < index; i++) {
        prev = prev.next;
    }
    return prev;
}


- (NSString*)description{
    NSMutableString *printSelf = [NSMutableString string];
    Node *node = self.head;
    do {
        [printSelf appendString:node.name?:@"null"];
        [printSelf appendString:@","];
        node = node.next;
    } while (node != nil);
        
    return printSelf.copy;
}


// 反转链表
- (LinkedList*)reversal{
    Node *curr = self.head;
    Node *prev = nil;

    do {
        
        Node *tempNode = curr.next;
        
        // 反转
        curr.next = prev;
        prev = curr;

        // 找到下一个要移位的结点
        curr = tempNode;
        
        if (!curr) {
            self.head = prev;
        }
        
    } while (curr != nil);
    
    return self;
}

+ (void)runTest{
    LinkedList *linkedList = [[LinkedList alloc]init];
    for (int i = 0; i < 10; i++) {
        Node *node = [[Node alloc]init];
        node.name = @(i).stringValue;
        [linkedList addNode:node forIndex:i];
    }
    
    NSLog(@"init print linkedList %@",linkedList);
    
    [linkedList addNode:[Node createWithName:@"detal9"] forIndex:9];

    NSLog(@"add print linkedList %@",linkedList);

    [linkedList removeNodeForIndex:9];

    NSLog(@"remove print linkedList %@",linkedList);


    [linkedList setNode:[Node createWithName:@"new8"] forIndex:9];

    NSLog(@"set print linkedList %@",linkedList);
    
    
    linkedList = [linkedList reversal];
    NSLog(@"reversal print linkedList %@",linkedList);
}

@end
