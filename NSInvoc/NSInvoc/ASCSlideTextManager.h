//
//  ASCSlideTextManager.h
//  NSInvoc
//
//  Created by Brian Clear (gbxc) on 28/05/2014.
//  Copyright (c) 2014 Brian Clear (gbxc). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCNNode.h"


/*
    just a dummy class which was causing problems in another project
    so just pulled out the basic shape so I could call NSInvocation on it and see what was wrong
 */
 
 
@interface ASCSlideTextManager : NSObject


-(void)methodNoParams;
-(void)methodOneObjParams:(NSString *)param1;
-(void)methodWithParam0:(NSString *)param0 param1:(NSString *)param1;


//method from another project I was trying to call but was failing
- (SCNNode *)addBullet:(NSString *)text atLevel:(NSUInteger)level;
@end
