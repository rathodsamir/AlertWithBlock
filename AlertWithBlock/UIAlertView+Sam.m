//
//  UIAlertView+Sam.m
//  AlertWithBlock
//
//  Created by Tops on 12/19/14.
//  Copyright (c) 2014 Tops Technology Pvt.Ltd. All rights reserved.
//
#import <objc/runtime.h>
#import "UIAlertView+Sam.h"

@interface SamirAlertWrapper : NSObject
@property (copy) void(^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);
@end


@implementation SamirAlertWrapper

// Called when a button is clicked. The view will be automatically dismissed after this call returns

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlock) {
        self.completionBlock(alertView,buttonIndex);
    }
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.

// If not defined in the delegate, we simulate a click in the cancel button

- (void)alertViewCancel:(UIAlertView *)alertView

{
    if (self.completionBlock) {
        self.completionBlock(alertView,alertView.cancelButtonIndex);
    }
    // Just simulate a cancel button click
    
}

@end

static const char kSAMAlertWrapper;

@implementation UIAlertView (Sam)
- (void)showWithCompletion:(void (^)(UIAlertView *, NSInteger))completion{
    SamirAlertWrapper *alertWrapper = [[SamirAlertWrapper alloc] init];
    alertWrapper.completionBlock=completion;
    self.delegate=alertWrapper;
    
    // Set the wrapper as an associated object
    objc_setAssociatedObject(self,&kSAMAlertWrapper,alertWrapper,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self show];
}
@end












