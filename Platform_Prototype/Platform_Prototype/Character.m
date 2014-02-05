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
#import "AnimationComponent.h"

@implementation Character
#pragma mark -Constructors-
-(id)init{
    if(self = [super init]){
        [self setup];
    }
    return self;
}

-(void)setup{
    CCSprite *sprite = [CCSprite spriteWithSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"Mario_Run_1"]];
    //sprite.positionType = CCPositionTypeNormalized;
    sprite.position = ccp(200, 60);
    self.sprite = sprite;
    self.sprite.scale = 2.5f;
    
    //initialize components
    _input = [[InputComponent alloc] initWithParent:self];
    _animation = [[AnimationComponent alloc] initWithParent:self];
    _physics = [[PhysicsComponent alloc] initWithParent:self];

}

@end
