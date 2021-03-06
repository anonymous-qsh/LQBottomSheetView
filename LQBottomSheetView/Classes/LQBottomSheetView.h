//
//  LQBottomSheetView.h
//  Pods
//
//  Created by LittleQ on 2019/4/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface LQBottomSheetView : UIView

@property (nonatomic, strong, readwrite) UIView *maskView;
@property(nonatomic, strong, readwrite) UIView *contentView;

- (instancetype) initWithView: (UIView *)contentView isSheetCollapsed: (BOOL) isCollapsed;

@end

NS_ASSUME_NONNULL_END
