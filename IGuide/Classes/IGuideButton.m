//
//  IGuideButton.m
//  IIGuideViewController
//
//  Created by whatsbug on 2019/12/18.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import "IGuideButton.h"

@implementation IGuideButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

///MARK: - Privacy
- (void)commonInit {
    self.safeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    [self addGestureRecognizer:panGestureRecognizer];
}

///MARK: - UIPanGestureRecognizer Callback
- (void)panGestureRecognized:(UIPanGestureRecognizer *)recognizer {
    if ([self.delegate respondsToSelector:@selector(panGestureRecognized:)]) {
        [self.delegate panGestureRecognized:recognizer];
    }
    
    CGPoint translation = [recognizer translationInView:self.superview];
    CGPoint newCenter = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    
    recognizer.view.center = newCenter;
    [recognizer setTranslation:CGPointZero inView:self.superview];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGFloat superviewWidth = CGRectGetWidth(self.superview.bounds);
        CGFloat superviewHeight = CGRectGetHeight(self.superview.bounds);
        CGFloat selfWidth = CGRectGetWidth(self.bounds);
        CGFloat selfHeight = CGRectGetHeight(self.bounds);
        CGFloat centerX = self.center.x < superviewWidth * 0.5 ? selfWidth * 0.5 + self.safeInsets.left : (superviewWidth - selfWidth * 0.5 - self.safeInsets.right);
        CGFloat centerY = fminf(fmaxf(self.center.y, selfWidth * 0.5 + self.safeInsets.top), superviewHeight - selfHeight * 0.5 - self.safeInsets.bottom);
        
        [UIView animateWithDuration:0.25 animations:^{
            self.center = CGPointMake(centerX, centerY);
        }];
    }
}

@end
