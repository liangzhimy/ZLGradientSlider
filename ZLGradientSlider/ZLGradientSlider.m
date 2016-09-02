//
//  ZLGradientSlider.m
//  ZLGradientSlider
//
//  Created by zhaoliang on 16/9/2.
//  Copyright © 2016年 liangzhimy. All rights reserved.
//

#import "ZLGradientSlider.h"

@implementation ZLGradientSlider
- (void)setGradientBackgroundWithColor:(NSArray *)colors {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    CGRect frame = self.frame;
    frame.size.height = 1.f;
    gradientLayer.frame = frame;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0.f, 0.f);
    gradientLayer.endPoint = CGPointMake(0.f, 1.0f);
    
    UIImage *bgImage = [[ZLGradientSlider imageFromLayer:gradientLayer] resizableImageWithCapInsets:UIEdgeInsetsZero];
    [self setMinimumTrackImage:bgImage forState:UIControlStateNormal];
//    [self setMaximumTrackImage:bgImage forState:UIControlStateNormal];
}

+ (UIImage *)imageFromLayer:(CALayer *)layer {
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, layer.opaque, 0);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
