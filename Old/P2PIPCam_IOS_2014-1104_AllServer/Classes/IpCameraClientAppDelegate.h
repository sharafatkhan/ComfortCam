//
//  IpCameraClientAppDelegate.h
//  IpCameraClient
//
//  Created by jiyonglong on 12-4-23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartViewController.h"
#import "PlayViewController.h"
#import "CameraViewController.h"
#import "CameraListMgt.h"
#import "PicPathManagement.h"
#import "RecPathManagement.h"
#import "PlaybackViewController.h"
#import "PictureViewController.h"
#import "RecordViewController.h"
#import "PPPPChannelManagement.h"
#import "RemotePlaybackViewController.h"
#import "MyTabBarViewController.h"
#import "NetWorkUtiles.h"
#import "MoreViewPlayProtocol.h"
#import "AlarmViewController.h"
#import "KXStatusBar.h"

#import "Reachability.h"
#import "LoginViewController.h"

#define TITLE_WITH  120

@interface IpCameraClientAppDelegate : NSObject <UIApplicationDelegate> {
    
    IBOutlet UIWindow *window;
    UINavigationController *navigationController;
    StartViewController *startViewController;    
    PlayViewController *playViewController;
    CameraViewController *cameraViewController;
    PlaybackViewController *playbackViewController;
    AlarmViewController *alarmViewController;
    PictureViewController *picViewController;
    RecordViewController *recViewController;
    RemotePlaybackViewController *remotePlaybackViewController;
    LoginViewController *loginViewCntrl;
    
    CameraListMgt *m_pCameraListMgt;
    PicPathManagement *m_pPicPathMgt;
    RecPathManagement *m_pRecPathMgt;
    
    CPPPPChannelManagement *m_pPPPPChannelMgt ;
    
    MyTabBarViewController *myTabViewController ;
    NetWorkUtiles *netWorkUtile;
    id<MoreViewPlayProtocol> moreViewPlayProtocol;
    KXStatusBar *kxStatusBar;
    
    BOOL isOnPlayView;
    BOOL isBizInitSuccess;
    
    NetworkStatus netStatus;
    
    UINavigationController *nav;
    
    UIView *activityView;
    UIView *loadingView;
    UILabel *lblLoad;
}

@property (nonatomic,assign) id<MoreViewPlayProtocol> moreViewPlayProtocol;
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) StartViewController *startViewController;
@property (nonatomic, retain) PlayViewController *playViewController;
@property (nonatomic, retain) PlaybackViewController *playbackViewController;
@property (nonatomic, retain) RemotePlaybackViewController *remotePlaybackViewController;
@property (nonatomic, retain) MyTabBarViewController *myTabViewController ;
@property BOOL isOnPlayView;
- (void) switchPlayView: (PlayViewController *)playViewController;
- (void) switchPlaybackView: (PlaybackViewController*)_playbackViewController;
- (void) switchRemotePlaybackView: (RemotePlaybackViewController*)_remotePlaybackViewController;
- (void) switchBack;

-(void)addDeviceToBizServer:(NSDictionary *)dic;
-(void)deleteDeviceFromBizServer:(NSDictionary*)dic;

+(BOOL)is43Version;
+(BOOL)isIOS7Version;
+(BOOL)isiPhone;

-(void) changeP2PAndDDNS:(BOOL)isP2P;
- (void)addLoginView;
-(void)loginInBizSever;
-(void)openOrCloseAlarmPush:(BOOL)isOpen;

// Loading view methods
-(void) showLoadingView;
-(void) hideLoadingView;

+(IpCameraClientAppDelegate *)sharedAppDelegate;

@end

