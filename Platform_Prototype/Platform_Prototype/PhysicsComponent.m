//
//  PhysicsComponent.m
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import "PhysicsComponent.h"
#import "Character.h"
#import "Platform.h"
#import "InputComponent.h"

@implementation PhysicsComponent

-(void)setup{
    Character *character = _parent;
    CCPhysicsBody *physicsBody = [[CCPhysicsBody alloc] init];
    physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(0, 0, character.sprite.contentSize.width, character.sprite.contentSize.height) cornerRadius:0];
    physicsBody.collisionMask = [NSArray arrayWithObjects:@"PLATFORM", nil];
    physicsBody.collisionCategories = [NSArray arrayWithObjects:@"CHARACTER", nil];
    physicsBody.collisionType = @"character";
    character.sprite.physicsBody = physicsBody;
    
}


-(BOOL)collisionBegin:(CCPhysicsCollisionPair *)pair character:(CCSprite *)characterSprite platform:(CCSprite *)platformSprite{
    int offset = 0;
    if(characterSprite.physicsBody.velocity.y<0){
        offset =(characterSprite.contentSize.height*characterSprite.scaleY)/4;
    }
    int a = characterSprite.position.y-((characterSprite.contentSize.height*characterSprite.scaleY)/2)+offset;
    int b =platformSprite.position.y+((platformSprite.contentSize.height*platformSprite.scaleY)/2);
    if(a >= b){
        Character *character = _parent;
        character.input.jumps = 0;
        return YES;
    }
    return NO;
}


@end
