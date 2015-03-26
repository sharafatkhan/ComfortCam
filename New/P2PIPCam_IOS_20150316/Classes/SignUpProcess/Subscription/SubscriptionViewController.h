//
//  SubscriptionViewController.h
//  P2PCamera
//
//  Created by Gourav Gupta on 07/03/15.
//
//

#import <UIKit/UIKit.h>
#import "IAPHelper.h"

@interface SubscriptionViewController : UIViewController<UINavigationBarDelegate, IAPHelperDelegate>
@property (retain, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (retain, nonatomic) IBOutlet UIScrollView *scrlView;

-(IBAction) tapOnMonthSubscription:(id) sender;
-(IBAction) tapOnYearSubscription:(id) sender;


@end
