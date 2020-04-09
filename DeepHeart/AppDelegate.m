//
//  AppDelegate.m
//  DeepHeart
//
//  Created by 贺刘敏 on 2020/4/8.
//  Copyright © 2020 hlm. All rights reserved.
//

#import "AppDelegate.h"
#import "DHHomeViewController.h"
#import "DHNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - <UIApplicationDelegate>
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
                          
    self.window.backgroundColor =[UIColor whiteColor];
    
    [self didInitWindow];
    
    return YES;
}

- (void)didInitWindow {
    
    self.window.rootViewController = [self generateWindowRootViewController];
    
    [self.window makeKeyAndVisible];
    
    [self startLaunchingAnimation];
}

- (UIViewController *)generateWindowRootViewController {

    DHHomeViewController *homeVC = [[DHHomeViewController alloc]init];
    homeVC.hidesBottomBarWhenPushed = NO;
    
    DHNavigationController *HomeNavController = [[DHNavigationController alloc] initWithRootViewController:homeVC];
    
    return HomeNavController;
}

- (void)startLaunchingAnimation {
    
    UIWindow *window = self.window;
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Launch Screen" bundle:nil];
    UIViewController *luanchVC =[storyBoard instantiateInitialViewController];
    NSLog(@"luanchVC-SubViews:%@",luanchVC.view.subviews);

    
    UIView *launchScreenView = luanchVC.view;
    launchScreenView.frame = window.bounds;
    [window addSubview:launchScreenView];
    
    UIImageView *backgroundImageView = launchScreenView.subviews[0];
    backgroundImageView.clipsToBounds = YES;
    
//    UIImageView *logoImageView = launchScreenView.subviews[1];
    
    UILabel *copyrightLabel = launchScreenView.subviews.lastObject;
    
    UIView *maskView = [[UIView alloc] initWithFrame:launchScreenView.bounds];
    maskView.backgroundColor = UIColorWhite;
    [launchScreenView insertSubview:maskView belowSubview:backgroundImageView];
    
    [launchScreenView layoutIfNeeded];
    
    [launchScreenView.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.identifier isEqualToString:@"bottomAlign"]) {
            obj.active = NO;
            [NSLayoutConstraint constraintWithItem:backgroundImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:launchScreenView attribute:NSLayoutAttributeTop multiplier:1 constant:NavigationContentTop].active = YES;
            *stop = YES;
        }
    }];
    
    [UIView animateWithDuration:.15 delay:1.9 options:QMUIViewAnimationOptionsCurveOut animations:^{
        [launchScreenView layoutIfNeeded];
//        logoImageView.alpha = 0.0;
        copyrightLabel.alpha = 0;
        
    } completion:nil];
    
    [UIView animateWithDuration:1.2 delay:1.9 options:UIViewAnimationOptionCurveEaseOut animations:^{
        maskView.alpha = 0;
        backgroundImageView.alpha = 0;
    } completion:^(BOOL finished) {
        [launchScreenView removeFromSuperview];
    }];
}

@end
