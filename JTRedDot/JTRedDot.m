//
//  JTRedDot.m
//  JTRedDot
//
//  Created by 谭振杰 on 2017/8/16.
//  Copyright © 2017年 谭振杰. All rights reserved.
//

#import "JTRedDot.h"

@implementation JTRedDot

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupFrame];
}

#pragma mark - 初始化方法

- (void)setup {
    
    // 初始化默认属性
    _redDotColor = [UIColor colorWithRed:244/255.0 green:82/255.0 blue:102/255.0 alpha:1.0];
    _redDotDiameter = 12;
    
    self.backgroundColor = self.redDotColor;
    self.clipsToBounds = YES;
    
    [self setupFrame];
}

- (void)setupFrame {
    
    CGFloat redDotDiameter = self.redDotDiameter;
    CGRect superViewBounds = self.superview.bounds;
    
    // 计算小红点的坐标
    CGPoint redDotOrigin = [self calculateRedDotOrigin:redDotDiameter superViewBounds:superViewBounds];
    
    self.layer.cornerRadius = redDotDiameter * 0.5;
    self.frame = CGRectMake(redDotOrigin.x, redDotOrigin.y, redDotDiameter, redDotDiameter);
}

#pragma mark - 公共方法

/** 计算小红点的坐标 */
- (CGPoint)calculateRedDotOrigin:(CGFloat)redDotDiameter superViewBounds:(CGRect)superViewBounds {
    
    CGFloat startX = 0;
    CGFloat startY = 0;
    switch (self.redDotDirection) {
        case JTRedDotDirectionRightUp: {
            startX = superViewBounds.size.width;
        }
            break;
        case JTRedDotDirectionLeftUp:
            break;
        case JTRedDotDirectionRightDown: {
            startY = superViewBounds.size.height;
        }
            break;
        case JTRedDotDirectionLeftDown: {
            startX = superViewBounds.size.width;
            startY = superViewBounds.size.height;
        }
            break;
            
        default:
            break;
    }
    CGFloat radius = redDotDiameter * 0.5;
    CGFloat x = startX - radius;
    CGFloat y = startY - radius;
    
    return CGPointMake(x, y);
}

#pragma mark - setter && getter

- (void)setRedDotColor:(UIColor *)redDotColor {
    _redDotColor = redDotColor;
    
    self.backgroundColor = redDotColor;
}

- (void)setRedDotDiameter:(CGFloat)redDotDiameter {
    _redDotDiameter = redDotDiameter;
    
    [self setupFrame];
}

- (void)setRedDotDirection:(JTRedDotDirection)redDotDirection {
    _redDotDirection = redDotDirection;
    
    [self setupFrame];
}

@end
