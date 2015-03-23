//
//  LoginViewController.h
//  P2PCamera
//
//  Created by MonuRathor on 11/01/15.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *txtEmail;
@property (retain, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)clickedSignUp:(id)sender;
- (IBAction)clickedLogin:(id)sender;
- (IBAction)clickedForgotPassword:(id)sender;


@end
