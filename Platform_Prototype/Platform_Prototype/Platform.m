//
//  Platform.m
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import "Platform.h"
#import "Constants.h"

@implementation Platform

-(id)initWithPosition:(CGPoint)position{
    if(self = [super init]){
        [self setup];
        self.sprite.position = position;
    }
    return self;
}

-(void)setup{
    CCSprite *platformSprite = [CCSprite spriteWithImageNamed: @"Icon.png"];
    //platformSprite.positionType = CCPositionTypeNormalized;
    platformSprite.position = ccp(200, 150);
    platformSprite.rotation = 0;
    platformSprite.scaleX = 3;
    platformSprite.scaleY = .5;
    platformSprite.physicsBody.friction = kPlatformFriction;
    CGSize size = platformSprite.contentSize;
    platformSprite.physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:0];
    platformSprite.physicsBody.collisionMask = [NSArray arrayWithObjects: @"CHARACTER", nil];
    platformSprite.physicsBody.collisionCategories = [NSArray arrayWithObjects:@"PLATFORM", nil];
    platformSprite.physicsBody.collisionType = @"platform";
    platformSprite.physicsBody.type = CCPhysicsBodyTypeStatic;
    self.sprite = platformSprite;
}

@end
