//
//  HelloWorldScene.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/19/13.
//  Copyright Joshua Scorca 2013. All rights reserved.
//
// -----------------------------------------------------------------------

// Importing cocos2d.h and cocos2d-ui.h, will import anything you need to start using Cocos2D v3
#import "cocos2d.h"
#import "cocos2d-ui.h"

// -----------------------------------------------------------------------

/**
 *  The main scene
 */
@class Character, Platform;
@interface HelloWorldScene : CCScene<CCPhysicsCollisionDelegate>{
    CCButton *buttonUp;
    CCButton *buttonDown;
    CCButton *buttonLeft;
    CCButton *buttonRight;
    Character *character1;
    Platform *platform, *groundPlatform;
    
    int platformCount;
}

// -----------------------------------------------------------------------

+ (HelloWorldScene *)scene;
- (id)init;

// -----------------------------------------------------------------------
@end