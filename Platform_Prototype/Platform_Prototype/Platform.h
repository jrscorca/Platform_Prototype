//
//  Platform.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/20/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Platform : NSObject

@property(nonatomic, strong) CCSprite *sprite;

-(id)initWithSprite:(CCSprite*)sprite;

@end
