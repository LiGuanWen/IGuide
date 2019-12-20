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
    
    // 任何对象只要遵守协议都可以通过 +showsWithDataSource: 弹出动画教程
    [IGuideViewController showsWithDataSource:self];
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
    item.annotationText = index == 0 ? @"其他一些知识点" : @"跳过按钮可移动的哦";
    item.annotationTitle = index == 0 ? @"其他" : @"移动试试";
    item.backgroundImageName = @"bird";
    item.iconImageName = @"bird";
    return item;
}

- (UIVisualEffectView *)visualEffectViewInGuideViewController:(NSString *)identifier {
    // 改变背景的模糊程度
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    //visualEffectView.alpha = 0.0;
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

//MARK: - IGuideViewControllerDelegate
- (void)guideViewControllerDidSelectSkipTutorial:(NSString *)identifier {
    NSLog(@"下次提醒");
}

- (void)guideViewControllerDidSelectNeverRemind:(NSString *)identifier {
    NSLog(@"不再提醒");
}

@end
