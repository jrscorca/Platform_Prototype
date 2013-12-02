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

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    // Crash if basic initialization for some reason failed
    NSAssert(self, @"Unable to create class HelloWorldScene");
    
    
    [self setupLevel];
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

-(void)setupLevel
{
    CCPhysicsNode *physicsNode = [CCPhysicsNode node];
    physicsNode.gravity = ccp(0.0, -300.0);
    physicsNode.collisionDelegate = self;
   // physicsNode.debugDraw = YES;
    [self addChild:physicsNode];
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Mario_Mario.plist"];
    CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"Mario_Mario.png"];
    [self addChild:spriteSheet];
    
    platform = [[Platform alloc] init];
    [physicsNode addChild:platform.sprite];
    
    character1 = [[Character alloc] init];
    [physicsNode addChild: character1.sprite];
    
    CCSprite *groundSprite = [CCSprite spriteWithImageNamed: @"icon.png"];
    //sprite.positionType = CCPositionTypeNormalized;
    groundSprite.position = ccp(240.0f, 0.0f);
    groundSprite.rotation = 0;
    groundSprite.scaleX = 6;
    
    CGSize size = groundSprite.contentSize;
    groundSprite.physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:0];
    groundSprite.physicsBody.type = CCPhysicsBodyTypeStatic;
    groundSprite.physicsBody.friction = 1.2;
    [physicsNode addChild:groundSprite];
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
    if (character1.sprite.position.y > [[CCDirector sharedDirector] viewSize].height+100) {
        character1.sprite.position = ccp(200, 200);
    }
    if (character1.sprite.position.x < -100) {
        character1.sprite.position = ccp(200, 200);
    }
    if (character1.sprite.position.x > [[CCDirector sharedDirector] viewSize].width+100) {
        character1.sprite.position = ccp(200, 200);
    }
}

-(void)updateControls:(CCTime)dt{
    if(buttonUp.highlighted){
        [character1.input up];
    }else if(buttonRight.highlighted){
        [character1.input right];
    }else if(buttonLeft.highlighted){
        [character1.input left];
    }else if(buttonDown.highlighted){
        [character1.input down];
    }else{
        [character1.input noInput];
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
    NSLog(@"up ended");
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

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair player:(CCPhysicsBody *)nodeA platform:(CCPhysicsBody *)nodeB{
    int offset = 0;
    if(character1.sprite.physicsBody.velocity.y<0){
        offset =(character1.sprite.contentSize.height*character1.sprite.scaleY)/4;
    }
    int a = character1.sprite.position.y-((character1.sprite.contentSize.height*character1.sprite.scaleY)/2)+offset;
    int b =platform.sprite.position.y+((platform.sprite.contentSize.height*platform.sprite.scaleY)/2);
    if(a >= b){
        return YES;
    }
    return NO;
}

-(BOOL)ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair player:(CCPhysicsBody *)nodeA platform:(CCPhysicsBody *)nodeB{
    return YES;
}

-(void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair *)pair player:(CCPhysicsBody *)nodeA platform:(CCPhysicsBody *)nodeB{
    
}

-(void)ccPhysicsCollisionSeparate:(CCPhysicsCollisionPair *)pair player:(CCPhysicsBody *)nodeA platform:(CCPhysicsBody *)nodeB{
}

@end