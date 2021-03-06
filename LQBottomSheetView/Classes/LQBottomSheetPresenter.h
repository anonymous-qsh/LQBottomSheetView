//
//  LQBottomSheetPresenter.h
//  Pods
//
//  Created by LittleQ on 2019/4/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LQBottomSheetView.h"

NS_ASSUME_NONNULL_BEGIN

// expandedHeight - 

@protocol LQBottomSheetPresenterDelegate <NSObject>

- (double)bounceHeight;
- (double)expandedHeight;
- (double)collapsedHeight;

- (void)animationFinished;
- (void)maskViewClicked;

- (void) bottomSheetWillDisplay;
- (void) didBottomSheetDismiss;

@end

@interface LQBottomSheetPresenter : NSObject

@property (nonatomic                   ) UIView                         * superView;
@property (nonatomic                   ) BOOL                           isBottomSheetHidden;
@property (nonatomic                   ) id<LQBottomSheetPresenterDelegate> delegate;
// expose this to show.
@property (nonatomic, readwrite, strong) LQBottomSheetView              *bottomSheetView;

- (instancetype)initWithView: (UIView *)superView andDelegate: (id<LQBottomSheetPresenterDelegate>)delegate;

- (void) setupBottomSheetViewWithView:(UIView *)contentView;

- (void) dismiss;

- (void) display;

- (void) show;

@end

NS_ASSUME_NONNULL_END
