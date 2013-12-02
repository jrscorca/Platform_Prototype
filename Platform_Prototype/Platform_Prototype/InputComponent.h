//
//  InputComponent.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Character;
@interface InputComponent : NSObject

@property(nonatomic, weak) id parent;

-(void)update;
-(void)up;
-(void)right;
-(void)left;
-(void)down;
-(void)noInput;
-(id)initWithParent:(id)parent;

@end
