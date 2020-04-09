//
//  DHUIHelper.h
//  DeepHeart
//
//  Created by 贺刘敏 on 2020/4/9.
//  Copyright © 2020 hlm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHUIHelper : NSObject

+ (void)forceInterfaceOrientationPortrait;

@end

@interface DHUIHelper (QMUIMoreOperationAppearance)

+ (void)customMoreOperationAppearance;

@end


@interface DHUIHelper (QMUIAlertControllerAppearance)

+ (void)customAlertControllerAppearance;

@end

@interface DHUIHelper (QMUIDialogViewControllerAppearance)

+ (void)customDialogViewControllerAppearance;

@end


@interface DHUIHelper (QMUIEmotionView)

+ (void)customEmotionViewAppearance;
@end


@interface DHUIHelper (QMUIImagePicker)

+ (void)customImagePickerAppearance;

@end


@interface DHUIHelper (UITabBarItem)

+ (UITabBarItem *)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)tag;

@end


@interface DHUIHelper (Button)

+ (QMUIButton *)generateDarkFilledButton;
+ (QMUIButton *)generateLightBorderedButton;

@end


@interface DHUIHelper (Emotion)

+ (NSArray<QMUIEmotion *> *)qmuiEmotions;

/// 用于主题更新后，更新表情 icon 的颜色
+ (void)updateEmotionImages;
@end


@interface DHUIHelper (SavePhoto)

+ (void)showAlertWhenSavedPhotoFailureByPermissionDenied;

@end


@interface DHUIHelper (Calculate)

+ (NSString *)humanReadableFileSize:(long long)size;
    
@end


@interface DHUIHelper (Theme)

+ (UIImage *)navigationBarBackgroundImageWithThemeColor:(UIColor *)color;
@end


@interface NSString (Code)

- (void)enumerateCodeStringUsingBlock:(void (^)(NSString *codeString, NSRange codeRange))block;

@end

NS_ASSUME_NONNULL_END
