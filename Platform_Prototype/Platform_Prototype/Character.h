//
//  Character.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class InputComponent;
@class PhysicsComponent;
@interface Character : NSObject

@property(nonatomic, strong) CCSprite *sprite;
@property(nonatomic, strong) InputComponent *input;
@property(nonatomic, strong) PhysicsComponent *physics;
@property(nonatomic, assign) int jumps;



-(id)initWithSprite:(CCSprite*)sprite;

@end
