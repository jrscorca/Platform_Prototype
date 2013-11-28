//
//  HelloWorldScene.m
//  Platform_Prototype
//
//  Created by Joshua Scorca on 11/19/13.
//  Copyright Joshua Scorca 2013. All rights reserved.
//
// -----------------------------------------------------------------------

#import "HelloWorldScene.h"
#import "IntroScene.h"
#import "Character.h"
#import "InputComponent.h"
#import "Platform.h"

// -----------------------------------------------------------------------
#pragma mark - HelloWorldScene
// -----------------------------------------------------------------------
@implementation HelloWorldScene
{
    
}



// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (HelloWorldScene *)scene
{
    return [[self alloc] init];
}

// -----------------------------------------------------------------------


// This method is called anytime the ball collides with something.
// The argument names in collision delegate methods correspond to the collisionType strings set on the CCPhysicsBody objects.
-(BOOL)ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair ball:(CCNode *)ball wildcard:(CCNode *)other
{
    // Ball collisions should always be perfectly bouncy and frictionless.
    pair.friction = 0.0;
    pair.restitution = 1.0;
    
    return YES;
}

// This is called when the ball collides with a block.
-(BOOL)ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair ball:(CCNode *)ball block:(CCNode *)block
{
    [block removeFromParent];
    
    return YES;
}

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    // Crash if basic initialization for some reason failed
    NSAssert(self, @"Unable to create class HelloWorldScene");
    
    
    [self setupPhysicsObjects];
    [self setupHUDObjects];
    
    // done
	return self;
}

-(void)setupHUDObjects{
    buttonUp = [CCButton buttonWithTitle:@"up"];
    buttonDown = [CCButton buttonWithTitle:@"down"];
    buttonLeft = [CCButton buttonWithTitle:@"left"];
    buttonRight = [CCButton buttonWithTitle:@"right"];
    
    buttonUp.positionType = CCPositionTypeNormalized;
    buttonDown.positionType = CCPositionTypeNormalized;
    buttonLeft.positionType = CCPositionTypeNormalized;
    buttonRight.positionType = CCPositionTypeNormalized;
    
    buttonUp.position = ccp(0.2f, 0.3f);
    buttonDown.position = ccp(0.2f, 0.1f);
    buttonLeft.position = ccp(0.1f, 0.2f);
    buttonRight.position = ccp(0.3f, 0.2f);
    
    [buttonUp setTarget:self selector:@selector(upButtonTouched:)];
    [buttonDown setTarget:self selector:@selector(downButtonTouched:)];
    [buttonLeft setTarget:self selector:@selector(leftButtonTouched:)];
    [buttonRight setTarget:self selector:@selector(rightButtonTouched:)];
    
    
    [self addChild:buttonUp];
    [self addChild:buttonDown];
    [self addChild:buttonLeft];
    [self addChild:buttonRight];
}

-(void)setupPhysicsObjects
{
    CCPhysicsNode *physicsNode = [CCPhysicsNode node];
    physicsNode.gravity = ccp(0.0, -300.0);
    physicsNode.collisionDelegate = self;
    physicsNode.debugDraw = YES;
    [self addChild:physicsNode];
    
    NSString *str = @"A";
    
    CCSprite *sprite = [CCSprite spriteWithImageNamed:@"icon.png"];
    sprite.position = ccp(280, 140);
    CGSize size = sprite.contentSize;
    sprite.physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:0];
    sprite.physicsBody.collisionGroup = str;
    character1 = [[Character alloc] initWithSprite:sprite];
    character1.sprite.scale = 0.75f;
    [physicsNode addChild: character1.sprite];
    
    
    
    
    CCSprite *platformSprite = [CCSprite spriteWithImageNamed: @"icon.png"];
    platformSprite.position = ccp(200, 200);
    platformSprite.rotation = 0;
    platformSprite.scaleX = 3;
    
    size = platformSprite.contentSize;
    platformSprite.physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:0];
    platformSprite.physicsBody.collisionGroup = str;
    Platform *platform = [[Platform alloc] initWithSprite:platformSprite];
    [physicsNode addChild:platform.sprite];
    
    
    
    CCSprite *groundSprite = [CCSprite spriteWithImageNamed: @"icon.png"];
    //sprite.positionType = CCPositionTypeNormalized;
    groundSprite.position = ccp(240.0f, 0.0f);
    groundSprite.rotation = 0;
    groundSprite.scaleX = 6;
    
    size = groundSprite.contentSize;
    groundSprite.physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:0];
    groundSprite.physicsBody.type = CCPhysicsBodyTypeStatic;
    groundSprite.physicsBody.friction = 1.2;
    [physicsNode addChild:groundSprite];
    
    
    
    
    
    //        [CCPhysicsJoint connectedPivotJointWithBodyA:sprite1.physicsBody bodyB:sprite2.physicsBody anchor:CGPointMake(0, 0)];
    
    //CCPhysicsJoint *joint = [CCPhysicsJoint connectedPivotJointWithBodyA:sprite2.physicsBody bodyB:sprite1.physicsBody anchorA:ccp(sprite1.contentSize.width, sprite1.contentSize.height)];
    /*
     [self scheduleBlock:^(CCTimer *timer){
     [sprite1 removeFromParent];
     } delay:3.0];
     
     [self scheduleBlock:^(CCTimer *timer){
     [physicsNode addChild:sprite1];
     } delay:5.0];
     
     [self scheduleBlock:^(CCTimer *timer){
     [joint invalidate];
     } delay:7.0];
     */
    
    // Add our one way segment
    /*
     shape = cpSpaceAddShape(space, cpSegmentShapeNew(staticBody, cpv(-160,-100), cpv(160,-100), 10.0f));
     cpShapeSetElasticity(shape, 1.0f);
     cpShapeSetFriction(shape, 1.0f);
     cpShapeSetCollisionType(shape, 1);
     cpShapeSetLayers(shape, NOT_GRABABLE_MASK);
     
     // We'll use the data pointer for the OneWayPlatform struct
     platformInstance.n = cpv(0, 1); // let objects pass upwards
     cpShapeSetUserData(shape, &platformInstance);
     */
}

// -----------------------------------------------------------------------

- (void)dealloc
{
    // clean up code goes here
}

// -----------------------------------------------------------------------
#pragma mark - Enter & Exit
// -----------------------------------------------------------------------

- (void)onEnter
{
    // always call super onEnter first
    [super onEnter];
    
    // In pre-v3, touch enable and scheduleUpdate was called here
    // In v3, touch is enabled by setting userInterActionEnabled for the individual nodes
    // Pr frame update is automatically enabled, if update is overridden
    
}

// -----------------------------------------------------------------------

- (void)onExit
{
    
    
    // always call super onExit last
    [super onExit];
}

// -----------------------------------------------------------------------
#pragma mark - update
// -----------------------------------------------------------------------

- (void)update:(CCTime)dt
{
    character1.sprite.physicsBody.allowsRotation = NO;
    
    [self updateControls:dt];
    [self updatePositionCheck:dt];
}

-(void)updatePositionCheck:(CCTime)dt{
    if (character1.sprite.position.y < -100) {
        character1.sprite.position = ccp(200, 200);
    }
}

-(void)updateControls:(CCTime)dt{
    if(buttonUp.highlighted){
        [character1.input up];
    }
    
    if(buttonRight.highlighted){
        [character1.input right];
    }
    
    if(buttonLeft.highlighted){
        [character1.input left];
    }
}

// -----------------------------------------------------------------------
#pragma mark - Button Callbacks
// -----------------------------------------------------------------------

- (void)onBackClicked:(id)sender
{
    // back to intro scene with transition
    [[CCDirector sharedDirector] replaceScene:[IntroScene scene]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0f]];
}

// -----------------------------------------------------------------------

#pragma mark -
#pragma mark Touch Event

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
{
    for(UITouch *touch in touches){
        CGPoint point = [touch locationInView:[touch view]];
        point = [[CCDirector sharedDirector]convertToGL:point];
    }
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
{
    for(UITouch *touch in touches){
        CGPoint point = [touch locationInView:[touch view]];
        point = [[CCDirector sharedDirector]convertToGL:point];
    }
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
{
	for(UITouch *touch in touches){
        CGPoint point = [touch locationInView:[touch view]];
        point = [[CCDirector sharedDirector]convertToGL:point];
    }
}

-(void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
}

-(void)upButtonTouched:(CCButton*)sender{
    if(sender.state == CCControlStateHighlighted){
        NSLog(@"up started");
    }else{
        NSLog(@"up ended");
    }
}

-(void)downButtonTouched:(CCButton*)sender{
    NSLog(@"down");
}

-(void)leftButtonTouched:(CCButton*)sender{
    NSLog(@"left");
}

-(void)rightButtonTouched:(CCButton*)sender{
    NSLog(@"right");
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair typeA:(CCNode *)nodeA typeB:(CCNode *)nodeB{
    
    return YES;
}

-(BOOL)ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair typeA:(CCNode *)nodeA typeB:(CCNode *)nodeB{
    
    return YES;
}

-(void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair *)pair typeA:(CCNode *)nodeA typeB:(CCNode *)nodeB{
    
}

-(void)ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair typeA:(CCNode *)nodeA typeB:(CCNode *)nodeB{
    
}

@end