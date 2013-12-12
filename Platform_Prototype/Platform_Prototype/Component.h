//
//  Component.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 12/1/13.
//  Copyright (c) 2013 Joshua Scorca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Component : NSObject{
    __weak id _parent;
}

@property(nonatomic, weak) id parent;

-(id)initWithParent:(id)parent;

@end
