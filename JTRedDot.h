//
//  JTRedDot.h
//  JTRedDot
//
//  Created by 谭振杰 on 2017/8/16.
//  Copyright © 2017年 谭振杰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JTRedDotDirectionRightUp,
    JTRedDotDirectionLeftUp,
    JTRedDotDirectionRightDown,
    JTRedDotDirectionLeftDown,
} JTRedDotDirection;

@interface JTRedDot : UIView

/** 颜色 */
@property (nonatomic, strong) UIColor *redDotColor;
/** 直径 */
@property (nonatomic, assign) CGFloat redDotDiameter;
/** 方向 */
@property (nonatomic, assign) JTRedDotDirection redDotDirection;

@end
