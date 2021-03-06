//
//  InputComponent.m
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import "InputComponent.h"
#import "Character.h"
#import "AnimationComponent.h"

@implementation InputComponent

-(void)update{
    if([_parent isKindOfClass:[Character class]]){
        
    }
}

-(void)up{
    if([_parent isKindOfClass:[Character class]]){
        [self characterUp];
    }
}

-(void)down{
    if([_parent isKindOfClass:[Character class]]){
        [self characterDown];
    }
}

-(void)left{
    if([_parent isKindOfClass:[Character class]]){
        [self characterLeft];
    }
}

-(void)right{
    if([_parent isKindOfClass:[Character class]]){
        [self characterRight];
    }
}

-(void)characterUp{
    Character *character = ((Character*)_parent);
    
    if(character.input.jumps == 1){
        character.sprite.physicsBody.velocity = ccp(character.sprite.physicsBody.velocity.x, 0);
        [character.sprite.physicsBody applyForce:ccp(0, 15000)];
        character.input.jumps++;
    }else if (character.sprite.physicsBody.velocity.y == 0 && (character.input.jumps == 0) ){
        [character.sprite.physicsBody applyForce:ccp(0, 15000)];

    }
    NSLog(@"%f",character.sprite.physicsBody.velocity.y);
    /*
    if (character.sprite.physicsBody.velocity.y > 100) {
        character.sprite.physicsBody.velocity = ccp(character.sprite.physicsBody.velocity.x, 100);
    }
     */
}

-(void)characterRight{
    Character *character = ((Character*)_parent);
    [character.animation runRunAction];
    character.sprite.flipX = NO;
    [character.sprite.physicsBody applyForce:ccp(1000, 0)];
    NSLog(@"%f",character.sprite.physicsBody.velocity.x);
    
    if (character.sprite.physicsBody.velocity.x > 140) {
        character.sprite.physicsBody.velocity = ccp(140, character.sprite.physicsBody.velocity.y);
    }
    if (character.sprite.physicsBody.velocity.x < 0) {
        character.sprite.physicsBody.velocity = ccp(0, character.sprite.physicsBody.velocity.y);
    }
}

-(void)characterLeft{
    Character *character = ((Character*)_parent);
    [character.animation runRunAction];
    character.sprite.flipX = YES;
    [character.sprite.physicsBody applyForce:ccp(-1000, 0)];
    NSLog(@"%f",character.sprite.physicsBody.velocity.x);
    
    if (character.sprite.physicsBody.velocity.x < -140) {
        character.sprite.physicsBody.velocity = ccp(-140, character.sprite.physicsBody.velocity.y);
    }
    if (character.sprite.physicsBody.velocity.x > 0) {
        character.sprite.physicsBody.velocity = ccp(0, character.sprite.physicsBody.velocity.y);
    }
}

-(void)characterDown{
    Character *character = ((Character*)_parent);

}

-(void)noInput{
    Character *character = ((Character*)_parent);
    [character.sprite stopAction:[character.sprite getActionByTag:1]];
    [character.animation runIdleAction];
}


@end
