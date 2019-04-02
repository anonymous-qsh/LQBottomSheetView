//
//  LQBottomSheetView.m
//  Pods
//
//  Created by LittleQ on 2019/4/2.
//

#import "LQBottomSheetView.h"

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
    self.backgroundColor = UIColor.whiteColor;
    self.layer.cornerRadius = 16;
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.1;

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
                                                                                    constant:25];

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

@end
