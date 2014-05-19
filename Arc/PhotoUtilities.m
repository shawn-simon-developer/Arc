//
//  PhotoUtilities.m
//  Arc
//
//  Created by Shawn Simon on 2014-05-18.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "PhotoUtilities.h"
#import <GPUImage.h>
#import <GPUImageGaussianBlurFilter.h>
#import <GPUImageExposureFilter.h>
#import <GPUImageBrightnessFilter.h>

@implementation PhotoUtilities

+ (UIImage *) blurAndAlphaMaskImage:(UIImage *)image
{
    GPUImageGaussianBlurFilter* blurFilter = [GPUImageGaussianBlurFilter new];
    blurFilter.blurRadiusInPixels = 12;
    image = [blurFilter imageByFilteringImage:image];
    
    GPUImageExposureFilter* exposureFilter = [GPUImageExposureFilter new];
    exposureFilter.exposure = -0.7;
    image = [exposureFilter imageByFilteringImage:image];

    return image;
}

@end
