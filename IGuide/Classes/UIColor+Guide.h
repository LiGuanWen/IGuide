//
//  UIColor+Guide.h
//  IIGuideViewController
//
//  Created by whatsbug on 2019/12/4.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Guide)

@property(nonatomic, weak, readonly) UIColor *disabledColor;
@property(class, nonatomic, readonly) UIColor *themeColor;

@end

NS_ASSUME_NONNULL_END
