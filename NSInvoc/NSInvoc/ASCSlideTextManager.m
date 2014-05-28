//
//  ASCSlideTextManager.m
//  NSInvoc
//
//  Created by Brian Clear (gbxc) on 28/05/2014.
//  Copyright (c) 2014 Brian Clear (gbxc). All rights reserved.
//

#import "ASCSlideTextManager.h"

@implementation ASCSlideTextManager
-(void)methodNoParams{
    NSLog(@"%s OK", __PRETTY_FUNCTION__);
}

-(void)methodOneObjParams:(NSString *)param0{
    NSLog(@"%s param1:%@  OK", __PRETTY_FUNCTION__, param0);
}

-(void)methodWithParam0:(NSString *)param0 param1:(NSString *)param1{
    NSLog(@"%s param0:%@   OK", __PRETTY_FUNCTION__, param0);
    NSLog(@"%s param1:%@   OK", __PRETTY_FUNCTION__, param1);
}
- (SCNNode *)addBullet:(NSString *)text atLevel:(NSUInteger)level{

    SCNNode *scnNode_ = [[SCNNode alloc]init];
    NSLog(@"%s text:%@   OK", __PRETTY_FUNCTION__, text);
    NSLog(@"%s level:%lu   OK", __PRETTY_FUNCTION__, (unsigned long)level);
    return scnNode_;
}
@end
