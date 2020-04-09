//
//  DHThemeManager.m
//  DeepHeart
//
//  Created by 贺刘敏 on 2020/4/9.
//  Copyright © 2020 hlm. All rights reserved.
//

#import "DHThemeManager.h"

@interface DHThemeManager ()

@property(nonatomic, strong) UIColor *dh_backgroundColor;
@property(nonatomic, strong) UIColor *dh_backgroundColorLighten;
@property(nonatomic, strong) UIColor *dh_backgroundColorHighlighted;
@property(nonatomic, strong) UIColor *dh_tintColor;
@property(nonatomic, strong) UIColor *dh_titleTextColor;
@property(nonatomic, strong) UIColor *dh_mainTextColor;
@property(nonatomic, strong) UIColor *dh_descriptionTextColor;
@property(nonatomic, strong) UIColor *dh_placeholderColor;
@property(nonatomic, strong) UIColor *dh_codeColor;
@property(nonatomic, strong) UIColor *dh_separatorColor;
@property(nonatomic, strong) UIColor *dh_gridItemTintColor;

@property(nonatomic, strong) UIImage *dh_searchBarTextFieldBackgroundImage;
@property(nonatomic, strong) UIImage *dh_searchBarBackgroundImage;

@property(nonatomic, strong) UIVisualEffect *dh_standardBlueEffect;

@property(class, nonatomic, strong, readonly) DHThemeManager *sharedInstance;

@end

@implementation DHThemeManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static DHThemeManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (instancetype)init {
    if (self = [super init]) {
        self.dh_backgroundColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themeBackgroundColor;
        }];
        self.dh_backgroundColorLighten = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<DHThemeProtocol> * _Nullable theme) {
            return theme.themeBackgroundColorLighten;
        }];
        self.dh_backgroundColorHighlighted = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themeBackgroundColorHighlighted;
        }];
        self.dh_tintColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themeTintColor;
        }];
        self.dh_titleTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themeTitleTextColor;
        }];
        self.dh_mainTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themeMainTextColor;
        }];
        self.dh_descriptionTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themeDescriptionTextColor;
        }];
        self.dh_placeholderColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themePlaceholderColor;
        }];
        self.dh_codeColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themeCodeColor;
        }];
        self.dh_separatorColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<DHThemeProtocol> *theme) {
            return theme.themeSeparatorColor;
        }];
        self.dh_gridItemTintColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<DHThemeProtocol> * _Nullable theme) {
            return theme.themeGridItemTintColor;
        }];
        
        self.dh_searchBarTextFieldBackgroundImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, __kindof NSObject<DHThemeProtocol> * _Nullable theme) {
            return [UISearchBar qmui_generateTextFieldBackgroundImageWithColor:theme.themeBackgroundColorHighlighted];
        }];
        self.dh_searchBarBackgroundImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, __kindof NSObject<DHThemeProtocol> * _Nullable theme) {
            return [UISearchBar qmui_generateBackgroundImageWithColor:theme.themeBackgroundColor borderColor:nil];
        }];
        
        self.dh_standardBlueEffect = [UIVisualEffect qmui_effectWithThemeProvider:^UIVisualEffect * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<DHThemeProtocol> * _Nullable theme) {
            return [UIBlurEffect effectWithStyle:[identifier isEqualToString:DHThemeIdentifierDark] ? UIBlurEffectStyleDark : UIBlurEffectStyleLight];
        }];
    }
    return self;
}

+ (NSObject<DHThemeProtocol> *)currentTheme {
    
    return QMUIThemeManagerCenter.defaultThemeManager.currentTheme;
}

@end

@implementation UIColor (DHTheme)

+ (instancetype)dh_sharedInstance {
    static dispatch_once_t onceToken;
    static UIColor *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (UIColor *)dh_backgroundColor {
    return DHThemeManager.sharedInstance.dh_backgroundColor;
}

+ (UIColor *)dh_backgroundColorLighten {
    return DHThemeManager.sharedInstance.dh_backgroundColorLighten;
}

+ (UIColor *)dh_backgroundColorHighlighted {
    return DHThemeManager.sharedInstance.dh_backgroundColorHighlighted;
}

+ (UIColor *)dh_tintColor {
    return DHThemeManager.sharedInstance.dh_tintColor;
}

+ (UIColor *)dh_titleTextColor {
    return DHThemeManager.sharedInstance.dh_titleTextColor;
}

+ (UIColor *)dh_mainTextColor {
    return DHThemeManager.sharedInstance.dh_mainTextColor;
}

+ (UIColor *)dh_descriptionTextColor {
    return DHThemeManager.sharedInstance.dh_descriptionTextColor;
}

+ (UIColor *)dh_placeholderColor {
    return DHThemeManager.sharedInstance.dh_placeholderColor;
}

+ (UIColor *)dh_codeColor {
    return DHThemeManager.sharedInstance.dh_codeColor;
}

+ (UIColor *)dh_separatorColor {
    return DHThemeManager.sharedInstance.dh_separatorColor;
}

+ (UIColor *)dh_gridItemTintColor {
    return DHThemeManager.sharedInstance.dh_gridItemTintColor;
}

@end

@implementation UIImage (DHTheme)

+ (UIImage *)dh_searchBarTextFieldBackgroundImage {
    return DHThemeManager.sharedInstance.dh_searchBarTextFieldBackgroundImage;
}

+ (UIImage *)dh_searchBarBackgroundImage {
    return DHThemeManager.sharedInstance.dh_searchBarBackgroundImage;
}

@end

@implementation UIVisualEffect (DHTheme)

+ (UIVisualEffect *)dh_standardBlurEffect {
    return DHThemeManager.sharedInstance.dh_standardBlueEffect;
}

@end
