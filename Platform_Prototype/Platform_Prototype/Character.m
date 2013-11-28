//
//  Character.m
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import "Character.h"
#import "InputComponent.h"
#import "PhysicsComponent.h"

@implementation Character
#pragma mark -Constructors-
-(id)init{
    if(self = [super init]){
        [self setup];
    }
    return self;
}

-(id)initWithSprite:(CCSprite*)sprite{
    if(self = [super init]){
        _sprite = sprite;
        [self setup];
    }
    return self;
}

-(void)setup{
    _input = [[InputComponent alloc] initWithParent:self];
    _physics = [[PhysicsComponent alloc] init];
    _jumps = 0;
}

@end
