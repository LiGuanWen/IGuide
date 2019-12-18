//
//  I2OtherViewController.m
//  IGuide_Example
//
//  Created by whatsbug on 2019/12/18.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import "I2OtherViewController.h"
#import "UIColor+I2Add.h"
#import "IGuide.h"

@interface I2OtherViewController ()<IGuideViewControllerDataSource, IGuideViewControllerDelegate>

@end

@implementation I2OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [IGuideViewController showsWithDataSource:self];
    
    // 任何遵守协议的对象都可以通过 +showsWithDataSource: 弹出动画教程
}

//MARK: - IGuideViewControllerDataSource
- (NSUInteger)numberOfGuidesInGuideViewController:(NSString *)identifier {
    return 1 + 1;
}

- (IGuideItem *)guideViewController:(NSString *)identifier itemForGuideAtIndex:(NSUInteger)index {
    IGuideItem *item = IGuideItem.new;
    
    item.highlightFrameOfAnnotated = self.aSwitch.frame;
    item.cornerRadiusOfAnnotated = CGRectGetHeight(item.highlightFrameOfAnnotated) * 0.5;
    item.spacingBetweenAnnotationAndAnnotated = 128.0; // 间隔
    item.shadowColor = UIColor.randomColor;
    item.annotationText = index == 0 ? @"其他一些知识点" : @"我支持横屏";
    item.annotationTitle = index == 0 ? @"其他" : @"旋转试试";
    item.backgroundImageName = @"bird";
    item.iconImageName = @"bird";
    return item;
}

- (UIVisualEffectView *)visualEffectViewInGuideViewController:(NSString *)identifier {
    // 改变背景的模糊程度
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    visualEffectView.alpha = 0.0;
    return visualEffectView;
}

- (UIView<IGuideAnnotationViewProtocol> *)guideViewController:(NSString *)identifier annotationViewForGuideAtIndex:(NSUInteger)index {
    IGuideJerryAnnotationView *annotationView = IGuideJerryAnnotationView.new;
    annotationView.backgroundView_protocol.backgroundColor = UIColor.clearColor;
    annotationView.backgroundView_protocol.contentMode = UIViewContentModeScaleAspectFit;
    return annotationView;
}

- (UIView *)guideViewController:(NSString *)identifier indicatorViewForGuideAtIndex:(NSUInteger)index {
    // 设置指示器的大小
    IGuideIndicatorLineView *indicator = IGuideIndicatorLineView.new;
    indicator.frame = CGRectMake(0, 0, 30, 110);
    indicator.backgroundColor = UIColor.brownColor;
    return indicator;
}

- (UIButton *)skipButtonInGuideViewController:(NSString *)identifier {
    // 自定义"跳过"按钮
    UIButton *button = UIButton.new;
    button.frame = CGRectMake(0, 0, 128.0, 44.0);
    button.layer.cornerRadius = 10.0;
    button.layer.backgroundColor = UIColor.randomColor.CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowOffset = CGSizeZero;
    button.layer.shadowRadius = 8.0;
    button.layer.shadowColor = UIColor.randomColor.CGColor;
    [button setTitle:@"我要跳过" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    return button;
}

//MARK: - IGuideViewControllerDelegate
- (void)guideViewControllerDidSelectSkipTutorial:(NSString *)identifier {
    NSLog(@"下次提醒");
}

- (void)guideViewControllerDidSelectNeverRemind:(NSString *)identifier {
    NSLog(@"不再提醒");
}

@end
