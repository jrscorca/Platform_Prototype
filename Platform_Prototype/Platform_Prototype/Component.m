//
//  Component.m
//  Platform_Prototype
//
//  Created by Joshua Scorca on 12/1/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import "Component.h"

@implementation Component

-(id)init{
    if(self = [super init]){
        NSAssert( _parent != nil, @"parent must be non-nil");
        [self setup];
    }
    return self;
}

-(id)initWithParent:(id)parent{
    if(self = [super init]){
        _parent = parent;
        NSAssert( _parent != nil, @"parent must be non-nil");
        [self setup];
    }
    return self;
}

-(void)setup{
    NSLog(@"This function is supposed to be Overridden");
}

@end
