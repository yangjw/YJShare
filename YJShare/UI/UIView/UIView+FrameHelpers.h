//
//  UIView+FrameHelpers.h
//  YJShare
//
//  Created by ylang on 14-7-25.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameHelpers)
// x & y
@property (nonatomic, assign, setter=_setX:) CGFloat x;
@property (nonatomic, assign, setter=_setY:) CGFloat y;
- (id)setX:(CGFloat)x;
- (id)setY:(CGFloat)y;
- (id)setX:(CGFloat)x andY:(CGFloat)y;
- (id)setXAndYFromPoint:(CGPoint)point;
- (id)adjustX:(CGFloat)xd;
- (id)adjustY:(CGFloat)yd;
- (id)adjustX:(CGFloat)xd andY:(CGFloat)yd;
- (id)centerXWith:(UIView *)v;
- (id)centerYWith:(UIView *)v;
- (id)centerWith:(UIView *)v;
- (id)centerInRect:(CGRect)r;
- (id)centerXInRect:(CGRect)r;
- (id)centerYInRect:(CGRect)r;
- (id)insideTopEdgeBy:(CGFloat)spacing;
- (id)insideRightEdgeBy:(CGFloat)spacing;
- (id)insideBottomEdgeBy:(CGFloat)spacing;
- (id)insideLeftEdgeBy:(CGFloat)spacing;
- (id)insideTopEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)insideRightEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)insideBottomEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)insideLeftEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)outsideTopEdgeBy:(CGFloat)spacing;
- (id)outsideRightEdgeBy:(CGFloat)spacing;
- (id)outsideBottomEdgeBy:(CGFloat)spacing;
- (id)outsideLeftEdgeBy:(CGFloat)spacing;
- (id)outsideTopEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)outsideRightEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)outsideBottomEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)outsideLeftEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (CGFloat)maxX;
- (CGFloat)maxY;

// width & height
@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) CGFloat height;
- (id)setW:(CGFloat)w;
- (id)setH:(CGFloat)h;
- (id)setW:(CGFloat)w andH:(CGFloat)h;
- (id)adjustW:(CGFloat)wd;
- (id)adjustH:(CGFloat)hd;
- (id)adjustW:(CGFloat)wd andH:(CGFloat)hd;
- (id)setSizeFromSize:(CGSize)size;
- (id)setSizeFromView:(UIView *)v;
- (id)scaleProportionallyByPercent:(CGFloat)factor;
- (id)scaleProportionallyToWidth:(CGFloat)w;
- (id)scaleProportionallyToHeight:(CGFloat)h;
- (CGFloat)aspectRatio;

// rounding coords of view frame
- (id)alignToPixel;

- (BOOL)isInside:(UIView *)view;
- (id)debug;
- (id)removeSubviews;
- (NSMutableArray *)accessibilityLabels;

@end
