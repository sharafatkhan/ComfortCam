//
//  InAppAlertView.m
//  P2PCamera
//
//  Created by Sharafat khan on 16/03/15.
//
//

#import "InAppAlertView.h"


@implementation InAppAlertView
@synthesize delegate, navigationController;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)dealloc {
    [_lblSubscriptionMessage release];
    [super dealloc];
}
@end
