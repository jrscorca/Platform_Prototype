/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 * Copyright (c) 2013 Lars Birkemose
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 *
 * File autogenerated with Xcode. Adapted for cocos2d needs.
 */

#import <Foundation/Foundation.h>
#import "CCResponderManager.h"

// -----------------------------------------------------------------
/**
 *  CCResponder is the base class for all nodes.
 *  It exposes the touch and mouse interface to any node, which enables user interaction
 *
 *  To make a responder react to user interaction, the touchesXXX / mouseXXX event must be overridden.
 *  If this is not the case, the event will be passed on to the next responder.
 *  To force the events to be passed to next responder, call the super as last step, before returning from the event
 */
@interface CCResponder : NSObject

// -----------------------------------------------------------------
/** 
 *  Enables user interaction on a node
 */
@property ( nonatomic, assign, getter = isUserInteractionEnabled ) BOOL userInteractionEnabled;

/** 
 *  Enables multiple touches inside a single node
 */
@property ( nonatomic, assign, getter = isMultipleTouchEnabled ) BOOL multipleTouchEnabled;

/** 
 *  Locks the touch to the node if touch moved outside
 *  If a node claims user interaction, the touch will continue to be sent to the node, no matter where the touch is moved
 *  If the node does not claim user interaction, a touch will be cancelled, if moved outside the nodes detection area
 *  If the node does not claim user interaction, and a touch is moved from outside the nodes detection area, to inside, a touchesBegan will be generated
 */
@property (nonatomic, assign) BOOL claimsUserInteraction;

/** 
 *  All other touches will be cancelled / ignored, if a node with exclusive touch, is active
 *  Only one exclusive touch can be active at a time.
 */
@property (nonatomic, assign, getter = isExclusiveTouch) BOOL exclusiveTouch;

// -----------------------------------------------------------------
/**
 *  @name Initialize
 */

/**
 *  Initialzes a new CCResponder
 *
 *  @return CCResponder instance
 */
- (id)init;

#if ( TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR )

// -----------------------------------------------------------------
/**
 *  @name Touch handling
 */

/**
 *  Called then one or more touches began
 *  If touches are dragged inside nodes which does not claim user interaction, start will be called
 *  If node has exclusive touch, all other ongoing touches will be canceled
 *
 *  @param touches Contains a set of the touches
 *  @param event   Current event information
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 *  Called then one or more touches are moved
 *
 *  @param touches Contains a set of the touches
 *  @param event   Current event information
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 *  Called then one or more touches ended
 *
 *  @param touches Contains a set of the touches
 *  @param event   Current event information
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 *  Called then one or more touches were cancelled
 *  If touches are dragged outside nodes which does not claim user interaction, cancel will be called
 *  If another node with exclusive touch is activated, cancel will be called for all ongoing touches
 *
 *  @param touches Contains a set of the touches
 *  @param event   Current event information
 */
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

#else

// -----------------------------------------------------------------
/**
 *  @name Mouse handling
 */

/**
 *  Called when left mouse button is pressed inside a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)mouseDown:(NSEvent *)theEvent;

/**
 *  Called when left mouse button is dragged for a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)mouseDragged:(NSEvent *)theEvent;

/**
 *  Called when left mouse button is released for a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)mouseUp:(NSEvent *)theEvent;

/**
 *  Called when right mouse button is pressed inside a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)rightMouseDown:(NSEvent *)theEvent;

/**
 *  Called when right mouse button is dragged for a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)rightMouseDragged:(NSEvent *)theEvent;

/**
 *  Called when right mouse button is released for a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)rightMouseUp:(NSEvent *)theEvent;

/**
 *  Called when middle mouse button is pressed inside a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)otherMouseDown:(NSEvent *)theEvent;

/**
 *  Called when middle mouse button is dragged for a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)otherMouseDragged:(NSEvent *)theEvent;

/**
 *  Called when middle mouse button is released for a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)otherMouseUp:(NSEvent *)theEvent;

/**
 *  Called when scroll wheel is activated inside a node accepting user interaction
 *
 *  @param theEvent The event created
 */
- (void)scrollWheel:(NSEvent *)theEvent;

#endif


// -----------------------------------------------------------------

@end
