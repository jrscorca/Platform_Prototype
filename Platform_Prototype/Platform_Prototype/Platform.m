//
//  Platform.m
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import "Platform.h"

@implementation Platform

-(id)initWithSprite:(CCSprite*)sprite{
    if(self = [super init]){
        _sprite = sprite;
    }
    return self;
}

@end
