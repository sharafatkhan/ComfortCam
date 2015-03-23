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
#import "FourViewController.h"
#import "Reachability.h"
#import "KXNavViewController.h"
#import "KXPlayViewController.h"
#define TITLE_WITH  120

@interface IpCameraClientAppDelegate : NSObject <UIApplicationDelegate> {
    
    IBOutlet UIWindow *window;
    KXNavViewController *navigationController;
    StartViewController *startViewController;    
    KXPlayViewController *playViewController;
    CameraViewController *cameraViewController;
    PlaybackViewController *playbackViewController;
    AlarmViewController *alarmViewController;
    PictureViewController *picViewController;
    RecordViewController *recViewController;
    RemotePlaybackViewController *remotePlaybackViewController;
    FourViewController *fourViewController;
    
    
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
    BOOL isFirstStartApp;
}

@property (nonatomic,assign) id<MoreViewPlayProtocol> moreViewPlayProtocol;
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) KXNavViewController *navigationController;
@property (nonatomic, retain) StartViewController *startViewController;
@property (nonatomic, retain) KXPlayViewController *playViewController;
@property (nonatomic, retain) PlaybackViewController *playbackViewController;
@property (nonatomic, retain) RemotePlaybackViewController *remotePlaybackViewController;
@property (nonatomic, retain) MyTabBarViewController *myTabViewController ;
@property (nonatomic, retain) FourViewController *fourViewController;
@property BOOL isOnPlayView;
- (void) switchPlayView: (KXPlayViewController *)playViewController;
- (void) switchPlaybackView: (PlaybackViewController*)_playbackViewController;
- (void) switchRemotePlaybackView: (RemotePlaybackViewController*)_remotePlaybackViewController;
- (void) switchBack;

-(void)addDeviceToBizServer:(NSDictionary *)dic;
-(void)deleteDeviceFromBizServer:(NSDictionary*)dic;

+(BOOL)is43Version;
+(BOOL)isIOS7Version;
+(BOOL)isiPhone;

-(void) changeP2PAndDDNS:(BOOL)isP2P;
-(void)loginInBizSever;
-(void)openOrCloseAlarmPush:(BOOL)isOpen;


-(void)enterMoreView:(FourViewController*)vc;
-(void)playEnterFourView;
@end

