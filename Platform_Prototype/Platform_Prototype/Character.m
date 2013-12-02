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

-(void)setup{
    //create animation
    NSMutableArray *runFrames = [NSMutableArray array];
    for (int i=1; i<=6; i++) {
        [runFrames addObject:
         [[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Mario_Run_%d",i]]  delayUnits:0.3f userInfo:nil]];
    }
    CCAnimation *runAnimation = [CCAnimation
                                 animationWithAnimationFrames:runFrames delayPerUnit:0.3f loops:-1];

    
    //create sprite and physics body
    CCSprite *sprite = [CCSprite spriteWithImageNamed:@"Mario_Run_1.png"];
    sprite.position = ccp(280, 80);
    CGSize size = sprite.contentSize;
    sprite.physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:0];
    sprite.physicsBody.collisionMask = [NSArray arrayWithObjects:@"PLATFORM", nil];
    sprite.physicsBody.collisionCategories = [NSArray arrayWithObjects:@"PLAYER", nil];
    sprite.physicsBody.collisionType = @"player";
    self.sprite = sprite;
    
    //run animation
    self.sprite.scale = 3.0f;
    [self.sprite runAction:[CCActionAnimate actionWithAnimation:runAnimation]];
    
    //initialize components
    _input = [[InputComponent alloc] initWithParent:self];
}

@end
