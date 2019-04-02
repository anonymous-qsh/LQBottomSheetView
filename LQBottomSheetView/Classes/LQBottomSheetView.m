//
//  LQBottomSheetView.m
//  Pods
//
//  Created by LittleQ on 2019/4/2.
//

#import "LQBottomSheetView.h"
#import <LQUIColor/UIColor+LQUtils.h>

@interface LQBottomSheetView ()

@property(nonatomic, strong) UIView *contentView;

@end

@implementation LQBottomSheetView

- (instancetype)initWithView:(UIView *)contentView isSheetCollapsed:(BOOL)isCollapsed {
    if (self = [super init]) {
        self.contentView = contentView;
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    self.backgroundColor = [UIColor clearColor];
    _maskView = [[UIView alloc] initWithFrame: CGRectMake(0, -[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _maskView.backgroundColor = [UIColor colorWithHexString:@"7F7F7F" andAlpha:0.6];

    [self addSubview:_maskView];
//    self.layer.cornerRadius = 16;
//    self.layer.masksToBounds = NO;
//    self.layer.shadowOffset = CGSizeMake(0, 0);
//    self.layer.shadowRadius = 2;
//    self.layer.shadowOpacity = 0.2;

    [self initContentView];
}

- (void)initContentView {
    self.contentView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:self.contentView];

    NSLayoutConstraint *collectionViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                                    attribute:NSLayoutAttributeLeft
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self
                                                                                    attribute:NSLayoutAttributeLeft
                                                                                   multiplier:1.0
                                                                                     constant:0];

    NSLayoutConstraint *collectionViewRightConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                                     attribute:NSLayoutAttributeRight
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self attribute:NSLayoutAttributeRight
                                                                                    multiplier:1.0f
                                                                                      constant:0];

    NSLayoutConstraint *collectionViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                                   attribute:NSLayoutAttributeTop
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self
                                                                                   attribute:NSLayoutAttributeTop
                                                                                  multiplier:1.0f
                                                                                    constant:0];

    NSLayoutConstraint *collectionViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                                      attribute:NSLayoutAttributeBottom
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:self
                                                                                      attribute:NSLayoutAttributeBottom
                                                                                     multiplier:1.0
                                                                                       constant:0];

    [self addConstraint:collectionViewLeftConstraint];
    [self addConstraint:collectionViewRightConstraint];
    [self addConstraint:collectionViewTopConstraint];
    [self addConstraint:collectionViewBottomConstraint];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    
    if (view == nil) {
        CGPoint newPoint = [self.maskView convertPoint:point toView:self];
        newPoint.y = -newPoint.y - self.maskView.bounds.size.height;
        if (CGRectContainsPoint(self.maskView.bounds, newPoint)) {
            view = self.maskView;
        }
    }
    return view;
}

@end
