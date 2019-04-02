//
//  LQBottomSheetPresenter.h
//  Pods
//
//  Created by LittleQ on 2019/4/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LQBottomSheetPresenterDelegate <NSObject>

- (double)bounceHeight;
- (double)expandedHeight;
- (double)collapsedHeight;
- (void)animationFinished;

@end

@interface LQBottomSheetPresenter : NSObject

@property (nonatomic) UIView * superView;
@property (nonatomic) BOOL isBottomSheetHidden;
@property (nonatomic) id<LQBottomSheetPresenterDelegate> delegate;

- (instancetype)initWithView: (UIView *)superView andDelegate: (id<LQBottomSheetPresenterDelegate>)delegate;

- (void) setupBottomSheetViewWithView:(UIView *)contentView;

@end

NS_ASSUME_NONNULL_END
