//
//  UIAlertView+Sam.h
//  AlertWithBlock
//
//  Created by Tops on 12/19/14.
//  Copyright (c) 2014 Tops Technology Pvt.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Sam)
- (void) showWithCompletion: (void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion;
@end
