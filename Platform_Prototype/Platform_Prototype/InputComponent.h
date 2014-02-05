//
//  InputComponent.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"
@class Character;
@interface InputComponent : Component

-(void)update;
-(void)up;
-(void)right;
-(void)left;
-(void)down;
-(void)noInput;

@property (assign) int jumps;

@end
