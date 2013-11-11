//
//  AppDelegate.h
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/10/13.
//  Copyright Joshua Scorca 2013. All rights reserved.
//
// -----------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import "cocos2d.h"

// -----------------------------------------------------------------------

// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

// -----------------------------------------------------------------------

@interface AppController : NSObject <UIApplicationDelegate>

// -----------------------------------------------------------------------

@property (nonatomic, retain) UIWindow      *window;
@property (readonly) MyNavigationController *navController;
@property (weak, readonly) CCDirectorIOS    *director;

// -----------------------------------------------------------------------
@end