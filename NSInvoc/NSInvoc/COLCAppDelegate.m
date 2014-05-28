//
//  COLCAppDelegate.m
//  NSInvoc
//
//  Created by Brian Clear (gbxc) on 28/05/2014.
//  Copyright (c) 2014 Brian Clear (gbxc). All rights reserved.
//

#import "COLCAppDelegate.h"
#import "ASCSlideTextManager.h"
@implementation COLCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    //Calling different methods on object using NSInvocation
    //Why? we can dynamically call methods which may change at runtime
    //obj_msgSend can also be used but NSInvocation is OO version
    //I also had problems with multiple parameters
    
    //  http://stackoverflow.com/questions/313400/nsinvocation-for-dummies
    [self call_methodNoParams];
    [self call_methodOneObjParams];
    [self call_methodWithParam0_param1];
    
    //This method as causing me problems in another project so I built this test project to check
    //what was wrong. I removed all code in ASCSlideTextManager except the method I wanted to call
    //just to confirm it wasnt something else
    [self call_addBullet_atLevel];
    

}

// - (SCNNode *)addBullet:(NSString *)text atLevel:(NSUInteger)level;
-(void)call_addBullet_atLevel{
    ASCSlideTextManager *ascSlideTextManager_ = [[ASCSlideTextManager alloc]init];
    
    SEL selector_ = NSSelectorFromString(@"addBullet:atLevel:");
    
    if([ascSlideTextManager_ respondsToSelector:selector_]){
        NSMethodSignature * mySignature = [ASCSlideTextManager instanceMethodSignatureForSelector:selector_];
        
        
        //-----------------------------------------------------------------------------------
        NSLog(@"%s \r%@", __PRETTY_FUNCTION__,[mySignature description]);
        // for more detail call this in console
        //(lldb)po mySignature
        
        //-----------------------------------------------------------------------------------
        /*
         <NSMethodSignature: 0x610000079c80>
         number of arguments = 4
         frame size = 224
         is special struct return? NO
         return value: -------- -------- -------- --------
         type encoding (@) '@'
         flags {isObject}
         modifiers {}
         frame {offset = 0, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         
         
         
         
         argument 0: -------- -------- -------- --------
         type encoding (@) '@'
         flags {isObject}
         modifiers {}
         frame {offset = 0, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         argument 1: -------- -------- -------- --------
         type encoding (:) ':'
         flags {}
         modifiers {}
         frame {offset = 8, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         argument 2: -------- -------- -------- --------
         type encoding (@) '@'
         flags {isObject}
         modifiers {}
         frame {offset = 16, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         argument 3: -------- -------- -------- --------
         type encoding (Q) 'Q'                                          <<<<< PARAM is int
         flags {}
         modifiers {}
         frame {offset = 24, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         
         
         */
        
        NSLog(@"%s mySignature.numberOfArguments:%lu", __PRETTY_FUNCTION__, (unsigned long)mySignature.numberOfArguments);
        //4
        //-----------------------------------------------------------------------------------
        
        NSInvocation * myInvocation = [NSInvocation invocationWithMethodSignature:mySignature];
        
        //Next, you would specify which object to send the message to:
        [myInvocation setTarget:ascSlideTextManager_];
        
        //Specify the message you wish to send to that object:
        [myInvocation setSelector:selector_];
        
        //And fill in any arguments for that method:
        
        //arg 0,1,2,3
        //0 = PARAM0
        //1 = PARAM1
        NSString *param0 = @"Param0_VALUE";
        [myInvocation setArgument:&param0 atIndex:2];
        
        //Note I accidentally passed NSString * in as param and app didnt crash so
        //NSString *param1 = @"Param1_VALUE";
        
        NSUInteger param1 = 123;
        [myInvocation setArgument:&param1 atIndex:3];
        
        //Note that object arguments must be passed by pointer. Thank you to Ryan McCuaig for pointing that out, and please see Apple's documentation for more details.
        
        //At this point, myInvocation is a complete object, describing a message that can be sent. To actually send the message, you would call:
    
        
        [myInvocation invoke];
        //-----------------------------------------------------------------------------------
        //same as calling
        [ascSlideTextManager_ addBullet:param0 atLevel:param1];
        
        //so why not just call the method directly
        //NSInvocation and obj_msgSend let you dynamically choose methods and params at runtime
        //I stored the names of object to call /methods/params in a plist as strings
        //I could use obj_msgSend but had problems with multiple parameters
        
        
    }else{
        NSLog(@"ERROR: [%s] [ascSlideTextManager_ respondsToSelector:selector_] FAILED", __PRETTY_FUNCTION__);
    }
}


//-(void)methodWithParam0:(NSString *)param0 param1:(NSString *)param1
-(void)call_methodWithParam0_param1{
    ASCSlideTextManager *ascSlideTextManager_ = [[ASCSlideTextManager alloc]init];
    
    SEL selector_ = NSSelectorFromString(@"methodWithParam0:param1:");
    
    if([ascSlideTextManager_ respondsToSelector:selector_]){
        NSMethodSignature * mySignature = [ASCSlideTextManager instanceMethodSignatureForSelector:selector_];
        
        //-----------------------------------------------------------------------------------
        NSLog(@"%s \r%@", __PRETTY_FUNCTION__,[mySignature description]);
        // DOESNT WORK - USE THIS INSTEAD IN CONSOLE
        //(lldb)po mySignature
        //-----------------------------------------------------------------------------------
        /*
         <NSMethodSignature: 0x610000266600>
         number of arguments = 4
         frame size = 224
         is special struct return? NO
         return value: -------- -------- -------- --------
         type encoding (v) 'v'
         flags {}
         modifiers {}
         frame {offset = 0, offset adjust = 0, size = 0, size adjust = 0}
         memory {offset = 0, size = 0}
         
         
         argument 0: -------- -------- -------- --------
         type encoding (@) '@'
         flags {isObject}
         modifiers {}
         frame {offset = 0, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         argument 1: -------- -------- -------- --------
         type encoding (:) ':'
         flags {}
         modifiers {}
         frame {offset = 8, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         argument 2: -------- -------- -------- --------
         type encoding (@) '@'
         flags {isObject}
         modifiers {}
         frame {offset = 16, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         argument 3: -------- -------- -------- --------
         type encoding (@) '@'
         flags {isObject}
         modifiers {}
         frame {offset = 24, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         
         
         */
        
        
        
        //-----------------------------------------------------------------------------------

        NSInvocation * myInvocation = [NSInvocation invocationWithMethodSignature:mySignature];
        
        //Next, you would specify which object to send the message to:
        [myInvocation setTarget:ascSlideTextManager_];
        
        //Specify the message you wish to send to that object:
        [myInvocation setSelector:selector_];
        
        //And fill in any arguments for that method:
        
        //arg 0,1,2,3
        //0 = PARAM0
        //1 = PARAM1
        NSString *param0 = @"Param0_VALUE";
        [myInvocation setArgument:&param0 atIndex:2];
        
        NSString *param1 = @"Param1_VALUE";
        [myInvocation setArgument:&param1 atIndex:3];
        
        //Note that object arguments must be passed by pointer. Thank you to Ryan McCuaig for pointing that out, and please see Apple's documentation for more details.
        
        //At this point, myInvocation is a complete object, describing a message that can be sent. To actually send the message, you would call:
        
        [myInvocation invoke];
    }else{
        NSLog(@"ERROR: [%s] [ascSlideTextManager_ respondsToSelector:selector_] FAILED", __PRETTY_FUNCTION__);
    }
    
    
    
    
}


-(void)call_methodOneObjParams{
    ASCSlideTextManager *ascSlideTextManager_ = [[ASCSlideTextManager alloc]init];
    
    SEL selector_ = NSSelectorFromString(@"methodOneObjParams:");
    
    if([ascSlideTextManager_ respondsToSelector:selector_]){
        NSMethodSignature * mySignature = [ASCSlideTextManager instanceMethodSignatureForSelector:selector_];
        /*
         <NSMethodSignature: 0x60800007b480>
         number of arguments = 3
         frame size = 224
         is special struct return? NO
         return value: -------- -------- -------- --------   <<<<<<<<<< RETURN VALUE
         type encoding (v) 'v'
         flags {}
         modifiers {}
         frame {offset = 0, offset adjust = 0, size = 0, size adjust = 0}
         memory {offset = 0, size = 0}
                                                                    3 ARGUMENTS FOR EACH PARAM
         argument 0: -------- -------- -------- --------
         type encoding (@) '@'
         flags {isObject}
         modifiers {}
         frame {offset = 0, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         argument 1: -------- -------- -------- --------
         type encoding (:) ':'
         flags {}
         modifiers {}
         frame {offset = 8, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         argument 2: -------- -------- -------- --------
         type encoding (@) '@'                                             <<< THIS IS THE NSString IN setArgument:  atIndex:2
         flags {isObject}
         modifiers {}
         frame {offset = 16, offset adjust = 0, size = 8, size adjust = 0}
         memory {offset = 0, size = 8}
         
         */
        
        
        NSInvocation * myInvocation = [NSInvocation invocationWithMethodSignature:mySignature];
        
        //Next, you would specify which object to send the message to:
        [myInvocation setTarget:ascSlideTextManager_];
        
        //Specify the message you wish to send to that object:
        [myInvocation setSelector:selector_];
        
        //And fill in any arguments for that method:
        NSString *param1 = @"Param1_VALUE";
        [myInvocation setArgument:&param1 atIndex:2];
        
        //Note that object arguments must be passed by pointer. Thank you to Ryan McCuaig for pointing that out, and please see Apple's documentation for more details.
        
        //At this point, myInvocation is a complete object, describing a message that can be sent. To actually send the message, you would call:
        
        [myInvocation invoke];
    }else{
        NSLog(@"ERROR: [%s] [ascSlideTextManager_ respondsToSelector:selector_] FAILED", __PRETTY_FUNCTION__);
    }
}



-(void)call_methodNoParams{
    ASCSlideTextManager *ascSlideTextManager_ = [[ASCSlideTextManager alloc]init];
    NSMethodSignature * mySignature = [ASCSlideTextManager
                                       instanceMethodSignatureForSelector:@selector(methodNoParams)];
    NSInvocation * myInvocation = [NSInvocation
                                   invocationWithMethodSignature:mySignature];
    //Next, you would specify which object to send the message to:
    
    [myInvocation setTarget:ascSlideTextManager_];
    
    //Specify the message you wish to send to that object:
    
    [myInvocation setSelector:@selector(methodNoParams)];
    
    //And fill in any arguments for that method:
    //see above for methods with arguments
    //    [myInvocation setArgument:&myString atIndex:2];
    
    //Note that object arguments must be passed by pointer. Thank you to Ryan McCuaig for pointing that out, and please see Apple's documentation for more details.
    
    //At this point, myInvocation is a complete object, describing a message that can be sent. To actually send the message, you would call:
    
    [myInvocation invoke];
    

}

@end
