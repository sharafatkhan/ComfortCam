//
//  SubscriptionViewController.m
//  P2PCamera
//
//  Created by Gourav Gupta on 07/03/15.
//
//

#import "SubscriptionViewController.h"
#import "IpCameraClientAppDelegate.h"
#import "obj_common.h"
#import "RequestClass.h"



@interface SubscriptionViewController ()<RequestClassDelegate>
{
    IAPHelper *objInApp;
    NSString *strSubscriptionType;
}
@property (nonatomic, retain) RequestClass *connection;
@end

@implementation SubscriptionViewController
@synthesize connection;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.connection = [[RequestClass alloc] init];
    self.connection.delegate = self;
    
    NSString *strTitle;
        strTitle = @"Subscription";

    UIImage *image = [UIImage imageNamed:@"top_bg_blue.png"];
    if (![IpCameraClientAppDelegate is43Version]) {
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }    self.navigationBar.delegate = self;
    self.navigationBar.tintColor = [UIColor colorWithRed:BTN_NORMAL_RED/255.0f green:BTN_NORMAL_GREEN/255.0f blue:BTN_NORMAL_BLUE/255.0f alpha:0.5];
    UINavigationItem *back = [[UINavigationItem alloc] initWithTitle:NSLocalizedStringFromTable(@"Back", @STR_LOCALIZED_FILE_NAME, nil)];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:strTitle];
    UILabel *labelTile=[[UILabel alloc]init];
    labelTile.frame=CGRectMake(0, 0, TITLE_WITH, 20);
    labelTile.font=[UIFont systemFontOfSize:18];
    labelTile.textColor=[UIColor whiteColor];
    labelTile.textAlignment=UITextAlignmentCenter;
    labelTile.backgroundColor=[UIColor clearColor];
    labelTile.text= strTitle;
    item.titleView=labelTile;
    [labelTile release];
    //创建一个右边按钮
    UIButton *btnRight=[UIButton buttonWithType:UIButtonTypeCustom];
    btnRight.titleLabel.font=[UIFont systemFontOfSize:12];
    [btnRight setBackgroundImage:[UIImage imageNamed:@"done_normal.png"] forState:UIControlStateNormal];
    [btnRight setBackgroundImage:[UIImage imageNamed:@"done_pressed.png"] forState:UIControlStateHighlighted];
    [btnRight setTitle:NSLocalizedStringFromTable(@"Done", @STR_LOCALIZED_FILE_NAME, nil) forState:UIControlStateNormal];
    btnRight.frame=CGRectMake(0,0,50,30);
    [btnRight addTarget:self action:@selector(btnFinished) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton =[[UIBarButtonItem alloc] initWithCustomView:btnRight];
    
    
//    UIButton *btnLeft=[UIButton buttonWithType:UIButtonTypeCustom];
//    [btnLeft setBackgroundImage:[UIImage imageNamed:@"btn_back_normal.png"] forState:UIControlStateNormal];
//    [btnLeft setBackgroundImage:[UIImage imageNamed:@"btn_back_pressed.png"] forState:UIControlStateHighlighted];
//    btnLeft.titleLabel.font=[UIFont systemFontOfSize:12];
//    [btnLeft setTitle:NSLocalizedStringFromTable(@"Back", @STR_LOCALIZED_FILE_NAME, nil) forState:UIControlStateNormal];
//    btnLeft.frame=CGRectMake(0,0,60,30);
//    [btnLeft addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    
////    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc]initWithCustomView:btnLeft];
    
    
    
    item.rightBarButtonItem = rightButton;
//    item.leftBarButtonItem=leftButton;
    [rightButton release];
    
    NSArray *array = [NSArray arrayWithObjects:item, nil];
    [self.navigationBar setItems:array];
    
    [item release];
    [back release];
    
    
//    if ([IpCameraClientAppDelegate isIOS7Version]) {
//        NSLog(@"is ios7");
//        self.wantsFullScreenLayout = YES;
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//        
//        CGRect navigationBarFrame = self.navigationBar.frame;
//        navigationBarFrame.origin.y += 20;
//        self.navigationBar.frame = navigationBarFrame;
//        [self.view bringSubviewToFront:self.navigationBar];
//        
//        CGRect tableFrm=tableView.frame;
//        tableFrm.origin.y+=20;
//        tableView.frame=tableFrm;
//        self.view.backgroundColor=[UIColor blackColor];
//        tableView.contentInset=UIEdgeInsetsMake(-30, 0, 0, 0);
//    }else{
//        NSLog(@"less ios7");
//        
//    }
//    
//    
//    if (bAddCamera == NO) {
//        self.strOldDID = self.strCameraID;
//        self.strOldIp=self.strCameraIp;
//    }
    
    UIImageView *imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background.png"]];
    imgView.frame=self.view.frame;
    imgView.center=self.view.center;
    self.view.backgroundColor= [UIColor colorWithPatternImage:imgView.image];
    [imgView release];

    // Do any additional setup after loading the view from its nib.
}

- (void)btnFinished{
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (void)dealloc {
    [_navigationBar release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNavigationBar:nil];
    [super viewDidUnload];
}

-(IBAction) tapOnMonthSubscription:(id) sender
{
    
    IpCameraClientAppDelegate *appDelegate = (IpCameraClientAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate showLoadingView];
    
    NSLog(@"Purchase 1 month subscription");
    objInApp = [[IAPHelper alloc]init];
    objInApp.delegate = self;
    [objInApp purchaseLessionWithLessonProduct:kPRODUCT_TYPE_MONTH];
    
    strSubscriptionType = kPRODUCT_TYPE_MONTH;
}

-(IBAction) tapOnYearSubscription:(id) sender
{
    IpCameraClientAppDelegate *appDelegate = (IpCameraClientAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate showLoadingView];
    NSLog(@"Purchase 1 year subscription");
    objInApp = [[IAPHelper alloc]init];
    objInApp.delegate = self;
    [objInApp purchaseLessionWithLessonProduct:kPRODUCT_TYPE_YEAR];
        strSubscriptionType = kPRODUCT_TYPE_YEAR;
}

#pragma mark- In App Purchase Delegate -

- (void)completePayment:(SKPaymentTransaction *)transaction
{
    IpCameraClientAppDelegate *appDelegate = (IpCameraClientAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate hideLoadingView];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"ProductPurchase"];
//    [ProgressHUD dismiss];
    
    int subscriptionTypeNo = 0;
    if ([strSubscriptionType isEqualToString:kPRODUCT_TYPE_MONTH])
    {
        subscriptionTypeNo = 1;
    }
    else
    {
        subscriptionTypeNo = 2;
    }
    
    NSString *strUserName = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserName"];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:@"SUBSCRIBED" forKey:@"action"];
    [param setValue:strUserName forKey:@"email"];
    [param setValue:[NSNumber numberWithInt:subscriptionTypeNo] forKey:@"subscription_type"];
    [self.connection makePostRequestFromDictionary:param];
    
}
- (void)restoredPayment:(SKPaymentTransaction *)transactions
{
    IpCameraClientAppDelegate *appDelegate = (IpCameraClientAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate hideLoadingView];
    
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"ProductPurchase"];
//    [ProgressHUD dismiss];
}
- (void)failedPayment:(SKPaymentTransaction *)transaction
{
    IpCameraClientAppDelegate *appDelegate = (IpCameraClientAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate hideLoadingView];
//    [ProgressHUD dismiss];
}

#pragma mark -  Request Delegate

- (void)connectionSuccess:(id)result andError:(NSError *)error
{
    if (!error)
    {
        if ([result isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *dictResponse = (NSDictionary *) result;
            if ([[dictResponse valueForKey:@"code"] intValue] == 200 &&  [[dictResponse valueForKey:@"status"] isEqualToString:@"OK"])
            {
                [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isUserSubscribed"];
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"You are subscribed successfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
                [alert release];
            }
        }
        
        
        //        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}

@end
