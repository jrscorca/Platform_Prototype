//
//  AnimationComponent.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 12/1/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import "cocos2d.h"
#import "Component.h"
@class Character;
@interface AnimationComponent : Component

@property(nonatomic, strong) CCAction *runAction;
@property(nonatomic, strong) CCAction *idleAction;

-(void)setup;

-(void)runIdleAction;
-(void)runRunAction;

@end
