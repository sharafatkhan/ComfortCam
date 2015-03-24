//
//  ChangePasswordViewController.m
//  P2PCamera
//
//  Created by Sharafat khan on 10/03/15.
//
//

#import "ChangePasswordViewController.h"
#import "RequestClass.h"

@interface ChangePasswordViewController ()<RequestClassDelegate, UIAlertViewDelegate>
@property (nonatomic, retain) RequestClass *connection;
@end

@implementation ChangePasswordViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Change Password";
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:161.0/255.0 green:205.0/255.0 blue:218.0/255.0 alpha:1.0];

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    
    
    self.connection = [[RequestClass alloc] init];
    self.connection.delegate = self;
    
//    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:161.0/255.0 green:205.0/255.0 blue:218.0/255.0 alpha:1.0];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc
{
    [_txtEmail release];
    [_txtNewPassword release];
    [_txtOldPassword release];
    [super dealloc];
}

-(void) changePassword
{
    //  action=CHANGE_PASSWORD,email,oldPassword,newPassword
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:@"CHANGE_PASSWORD" forKey:@"action"];
    [param setValue:self.txtEmail.text forKey:@"email"];
    [param setValue:self.txtOldPassword.text forKey:@"oldPassword"];
    [param setValue:self.txtNewPassword.text forKey:@"newPassword"];
    [self.connection makePostRequestFromDictionary:param];
}

-(void) validateFields
{
    if (self.txtEmail.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please fill in email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        [self.txtEmail becomeFirstResponder];
    }
    else if (self.txtOldPassword.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please fill in old password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        [self.txtOldPassword becomeFirstResponder];
    }
    else if (self.txtNewPassword.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please fill in new password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        [self.txtNewPassword becomeFirstResponder];
    }
    else if (!isEmailValid(self.txtEmail.text))
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please fill valid email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        [self.txtEmail becomeFirstResponder];
    }
    else
    {
        [self changePassword];
    }
}

- (IBAction)tapOnChangePassword:(id)sender
{
    [self validateFields];
}

#pragma mark -  Textfield delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag)
    {
        case Email:
            [self.txtOldPassword becomeFirstResponder];
            break;
        case OldPassword:
            [self.txtNewPassword becomeFirstResponder];
            break;
        case NewPassword:
            [textField resignFirstResponder];
            [self validateFields];
            NSLog(@"Save data");
            break;
        default:
            break;
    }
    return YES;
}

#pragma mark -  AlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //    if ([alertView.message isEqualToString:@"User registered successfully"])
    //    {
    [self.navigationController popViewControllerAnimated:YES];
    //    }
}

#pragma mark -  Request delegate

- (void)connectionSuccess:(id)result andError:(NSError *)error
{
    if (!error)
    {
        if ([result isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *resultDict = (NSDictionary *) result;
            NSString *strResponse = [resultDict valueForKey:@"response"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:strResponse delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}

@end
