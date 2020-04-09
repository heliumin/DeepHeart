//
//  DHThemeManager.h
//  DeepHeart
//
//  Created by 贺刘敏 on 2020/4/9.
//  Copyright © 2020 hlm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHThemeProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DHThemeManager : NSObject

@property(class, nonatomic, readonly, nullable) NSObject<DHThemeProtocol> *currentTheme;

@end

@interface UIColor (DHTheme)

@property(class, nonatomic, strong, readonly) UIColor *dh_backgroundColor;
@property(class, nonatomic, strong, readonly) UIColor *dh_backgroundColorLighten;
@property(class, nonatomic, strong, readonly) UIColor *dh_backgroundColorHighlighted;
@property(class, nonatomic, strong, readonly) UIColor *dh_tintColor;
@property(class, nonatomic, strong, readonly) UIColor *dh_titleTextColor;
@property(class, nonatomic, strong, readonly) UIColor *dh_mainTextColor;
@property(class, nonatomic, strong, readonly) UIColor *dh_descriptionTextColor;
@property(class, nonatomic, strong, readonly) UIColor *dh_placeholderColor;
@property(class, nonatomic, strong, readonly) UIColor *dh_codeColor;
@property(class, nonatomic, strong, readonly) UIColor *dh_separatorColor;
@property(class, nonatomic, strong, readonly) UIColor *dh_gridItemTintColor;
@end

@interface UIImage (DHTheme)

@property(class, nonatomic, strong, readonly) UIImage *dh_searchBarTextFieldBackgroundImage;
@property(class, nonatomic, strong, readonly) UIImage *dh_searchBarBackgroundImage;
@end

@interface UIVisualEffect (DHTheme)

@property(class, nonatomic, strong, readonly) UIVisualEffect *dh_standardBlurEffect;
@end


NS_ASSUME_NONNULL_END
