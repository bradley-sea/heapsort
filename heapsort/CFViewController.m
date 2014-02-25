//
//  CFViewController.m
//  heapsort
//
//  Created by Brad on 2/24/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFViewController.h"
#import "Node.h"

@interface CFViewController ()
{
    int _heapSize;
    
}

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *Array = [NSMutableArray new];
    
    Node *node9 = [Node new];
    node9.data = 9;
    Node *node6 = [Node new];
    node6.data = 6;
    Node *node3 = [Node new];
    node3.data = 3;
    Node *node7 = [Node new];
    node7.data = 7;
    Node *node8 = [Node new];
    node8.data = 8;
    Node *node2 = [Node new];
    node2.data = 2;
    Node *node4 = [Node new];
    node4.data = 4;
    Node *node5 = [Node new];
    node5.data = 5;
    Node *node1 = [Node new];
    node1.data = 1;
    Node *node10 = [Node new];
    node10.data = 10;
    
    Array = [NSMutableArray arrayWithObjects:node9,node6,node3,node7,node8,node2,node4,node5,node1,node10, nil];
    _heapSize = Array.count;
    
    NSMutableArray *heapArray = [self heapArray:Array];
    
    NSMutableArray *sortedHeapArray = [self heapSortArray:heapArray];
    
    
    NSLog(@"hooray");
    
 
}

-(NSMutableArray *)heapArray:(NSMutableArray *)array
{
    
    for (int i = (array.count- 1) /2; i >= 0; i--)
    {
        
        [self maxHeapifyForArray:array ForIndex:i];
    }
    
    
    
    return array;
    
}


-(void)maxHeapifyForArray:(NSMutableArray *)A ForIndex:(NSInteger)i
{
    int l = (2 *i);
    int r = (2*i)+1;
    Node *largest = A[i];
    
    if (l < _heapSize)
    {
        Node *left = A[l];
        if (left.data > largest.data)
        {
        largest = left;
        }
    }
    
    if (r < _heapSize)
    {
        Node *right = A[r];
        if (right.data > largest.data)
        {
        largest = right;
        }
    }
    
    if (![largest isEqual: A[i]])
    {
        int largestI = [A indexOfObject:largest];
        
        [A exchangeObjectAtIndex:i withObjectAtIndex:largestI];
        
        [self maxHeapifyForArray:A ForIndex:largestI];
    }
    
}

-(NSMutableArray *)heapSortArray:(NSMutableArray*)array
{
    
    
    for (int i = (array.count -1);i > 0; i--)
    {
        [array exchangeObjectAtIndex:0 withObjectAtIndex:i];
        _heapSize--;
        [self maxHeapifyForArray:array ForIndex:0];
    }
    
    return array;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
