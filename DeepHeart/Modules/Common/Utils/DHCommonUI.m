//
//  DHCommonUI.m
//  DeepHeart
//
//  Created by 贺刘敏 on 2020/4/9.
//  Copyright © 2020 hlm. All rights reserved.
//

#import "DHCommonUI.h"
#import "DHUIHelper.h"

NSString *const DHSelectedThemeIdentifier = @"selectedThemeIdentifier";
NSString *const DHThemeIdentifierDefault = @"Default";
NSString *const DHThemeIdentifierGrapefruit = @"Grapefruit";
NSString *const DHThemeIdentifierGrass = @"Grass";
NSString *const DHThemeIdentifierPinkRose = @"Pink Rose";
NSString *const DHThemeIdentifierDark = @"Dark";

const CGFloat DHButtonSpacingHeight = 72;

@implementation DHCommonUI

+ (void)renderGlobalAppearances {
    
    [DHUIHelper customMoreOperationAppearance];
    [DHUIHelper customAlertControllerAppearance];
    [DHUIHelper customDialogViewControllerAppearance];
    [DHUIHelper customImagePickerAppearance];
    [DHUIHelper customEmotionViewAppearance];
    
    UISearchBar *searchBar = [UISearchBar appearance];
    searchBar.searchTextPositionAdjustment = UIOffsetMake(4, 0);
    
    QMUILabel *label = [QMUILabel appearance];
    label.highlightedBackgroundColor = TableViewCellSelectedBackgroundColor;
}

@end


@implementation DHCommonUI (ThemeColor)

static NSArray<UIColor *> *themeColors = nil;
+ (UIColor *)randomThemeColor {
    if (!themeColors) {
        themeColors = @[UIColorTheme1,
                        UIColorTheme2,
                        UIColorTheme3,
                        UIColorTheme4,
                        UIColorTheme5,
                        UIColorTheme6,
                        UIColorTheme7,
                        UIColorTheme8,
                        UIColorTheme9,
                        UIColorTheme10];
    }
    return themeColors[arc4random() % themeColors.count];
}

@end

@implementation DHCommonUI (Layer)

+ (CALayer *)generateSeparatorLayer {
    
    CALayer *layer = [CALayer layer];
    [layer qmui_removeDefaultAnimations];
    layer.backgroundColor = UIColorSeparator.CGColor;
    return layer;
}

@end
