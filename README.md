

#import "UIAlertView+Sam.h"


-  (IBAction)btnclick:(id)sender {

      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"TITLE" message:@"MY MESSAGE" delegate:nil cancelButtonTitle:@"Cancle" otherButtonTitles:@"Ok", nil];
      
      [alertView showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
      
        NSLog(@"buttonIndex=%d",buttonIndex);
        
      }];
      
  }
