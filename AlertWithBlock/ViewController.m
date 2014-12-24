//
//  ViewController.m
//  AlertWithBlock
//
//  Created by Tops on 12/19/14.
//  Copyright (c) 2014 Tops Technology Pvt.Ltd. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+Sam.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   }

- (IBAction)btnclick:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"TITLE" message:@"MY MESSAGE" delegate:nil cancelButtonTitle:@"Cancle" otherButtonTitles:@"Ok", nil];
    [alertView showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"buttonIndex=%d",buttonIndex);
        
        UIAlertView *responseAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"NSCBSampleAlertTitle", @"")
                                                                message:[NSString stringWithFormat:NSLocalizedString(@"NSCBSampleAlertCallbackFormat", @""), buttonIndex ? NSLocalizedString(@"NSCBSampleAlertOk", @"") : NSLocalizedString(@"NSCBSampleAlertCancel", @"")]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
        
        [responseAlert showWithCompletion:NULL];
    
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
