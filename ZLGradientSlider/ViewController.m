//
//  ViewController.m
//  ZLGradientSlider
//
//  Created by zhaoliang on 16/9/2.
//  Copyright © 2016年 liangzhimy. All rights reserved.
//

#import "ViewController.h"
#import "ZLGradientSlider.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZLGradientSlider *gradientSlider;

@end

@implementation ViewController
/* 
 http://stackoverflow.com/questions/3748473/custom-uislider
 UIImage *minImage = [[UIImage imageNamed:@"slider_minimum.png"]
 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
 UIImage *maxImage = [[UIImage imageNamed:@"slider_maximum.png"]
 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
 UIImage *thumbImage = [UIImage imageNamed:@"thumb.png"];
 
 [[UISlider appearance] setMaximumTrackImage:maxImage
 forState:UIControlStateNormal];
 [[UISlider appearance] setMinimumTrackImage:minImage
 forState:UIControlStateNormal];
 [[UISlider appearance] setThumbImage:thumbImage
 forState:UIControlStateNormal];

 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self __test];
    UIColor *redColor = [UIColor redColor];
    UIColor *greenColor = [UIColor greenColor];
    [self.gradientSlider setGradientBackgroundWithColor:@[(id)redColor.CGColor, (id)greenColor.CGColor]];
    
//    
//    UIColor *redColor = [UIColor redColor];
//    UIColor *greenColor = [UIColor greenColor];
//    [self.gradientSlider setGradientBackgroundWithColor:@[redColor, greenColor]];
//    [self setGradientToSlider:self.gradientSlider WithColors:@[redColor, greenColor]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)__test {
    UIColor *redColor = [UIColor redColor];
    UIColor *greenColor = [UIColor greenColor];

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    CGRect frame = CGRectMake(0, 0, 200, 30);
    frame.size.height = 30.f;
    gradientLayer.frame = frame;
    gradientLayer.colors = @[(id)redColor.CGColor, (id)greenColor.CGColor];
    gradientLayer.startPoint = CGPointMake(0.f, 0.0f);
    gradientLayer.endPoint = CGPointMake(0.f, 1.0f);
    
    UIImage *bgImage = [[ViewController imageFromLayer:gradientLayer] resizableImageWithCapInsets:UIEdgeInsetsZero];
    
    NSLog(@"hi"); 
}

+ (UIImage *)imageFromLayer:(CALayer *)layer {
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, layer.opaque, 0);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setGradientToSlider:(UISlider*)slider WithColors:(NSArray*)colorArray
{
    UIView *view=(UIView*)[slider.subviews objectAtIndex:0];
    UIImageView *max_trackImageView=(UIImageView*)[view.subviews objectAtIndex:0];
    
    //setting gradient to max track image view.
    
    CAGradientLayer* max_trackGradient = [CAGradientLayer layer];
    
    CGRect rect=max_trackImageView.frame;
    rect.origin.x=view.frame.origin.x;
    
    max_trackGradient.frame=rect;
    max_trackGradient.colors = colorArray;
    
    [max_trackGradient setStartPoint:CGPointMake(0.0, 0.5)];
    [max_trackGradient setEndPoint:CGPointMake(1.0, 0.5)];
    
    [view.layer setCornerRadius:5.0];
    [max_trackImageView.layer insertSublayer:max_trackGradient atIndex:0];
    
    
    //Setting gradient to min track ImageView.
    
    CAGradientLayer* min_trackGradient = [CAGradientLayer layer];
    UIImageView *min_trackImageView=(UIImageView*)[slider.subviews objectAtIndex:1];
    
    rect=min_trackImageView.frame;
    rect.size.width=max_trackImageView.frame.size.width;
    rect.origin.y=0;
    rect.origin.x=0;
    
    min_trackGradient.frame=rect;
    min_trackGradient.colors = colorArray;
    
    [min_trackGradient setStartPoint:CGPointMake(0.0, 0.5)];
    [min_trackGradient setEndPoint:CGPointMake(1.0, 0.5)];
    
    [min_trackImageView.layer setCornerRadius:5.0];
    [min_trackImageView.layer insertSublayer:min_trackGradient atIndex:0];
}


@end
