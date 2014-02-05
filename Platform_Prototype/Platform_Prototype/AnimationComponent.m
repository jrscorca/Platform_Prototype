//
//  AnimationComponent.m
//  Platform_Prototype
//
//  Created by Joshua Scorca on 12/1/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import "AnimationComponent.h"
#import "Character.h"
#import "CCAnimation.h"
@implementation AnimationComponent


-(void)setup{
    Character *character = _parent;
    //create animation
    NSMutableArray *runFrames = [NSMutableArray array];
    for (int i=1; i<=6; i++) {
        [runFrames addObject:
         [[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Mario_Run_%d",i]]  delayUnits:0.3f userInfo:nil]];
    }
    CCAnimation *runAnimation = [CCAnimation
                                 animationWithAnimationFrames:runFrames delayPerUnit:0.3f loops:-1];
    _runAction = [CCActionAnimate actionWithAnimation:runAnimation];
    _runAction.tag = 1;
    
    //create animation
    NSMutableArray *idleFrames = [NSMutableArray array];
    for (int i=1; i<=4; i++) {
        float delayFrames = 1;
        if(i==1){
            delayFrames = 4;
        }
        [idleFrames addObject:
         [[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Mario_Idle_%d",i]]  delayUnits:delayFrames userInfo:nil]];
    }
    CCAnimation *idleAnimation = [CCAnimation
                                  animationWithAnimationFrames:idleFrames delayPerUnit:0.3f loops:-1];
    _idleAction = [CCActionAnimate actionWithAnimation:idleAnimation];
    _idleAction.tag = 2;
    [self runIdleAction];
}

-(void)runIdleAction{
    Character *character = _parent;
    CCAction* action = [character.sprite getActionByTag:2];
    if (!action) {
        [character.sprite runAction:_idleAction];
    }
}

-(void)runRunAction{
    Character *character = _parent;
    [character.sprite stopActionByTag:2];
    CCAction* action = [character.sprite getActionByTag:1];
    if (!action) {
        [character.sprite runAction:_runAction];
    }
}

@end
