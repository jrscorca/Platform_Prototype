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


-(BOOL)collisionBegin:(CCPhysicsCollisionPair *)pair character:(Character *)character platform:(Platform *)platform{
    int offset = 0;
    if(character.sprite.physicsBody.velocity.y<0){
        offset =(character.sprite.contentSize.height*character.sprite.scaleY)/4;
    }
    int a = character.sprite.position.y-((character.sprite.contentSize.height*character.sprite.scaleY)/2)+offset;
    int b =platform.sprite.position.y+((platform.sprite.contentSize.height*platform.sprite.scaleY)/2);
    if(a >= b){
        return YES;
    }
    return NO;
}


@end
