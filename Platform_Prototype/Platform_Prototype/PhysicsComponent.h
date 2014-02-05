//
//  PhysicsComponent.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Component.h"
@class Character, Platform;
@interface PhysicsComponent : Component

-(CCPhysicsBody*)createPhysicsObjectOfSize:(CGSize)size;
-(BOOL)collisionBegin:(CCPhysicsCollisionPair *)pair character:(CCSprite *)characterSprite platform:(CCSprite *)platformSprite;

@end
