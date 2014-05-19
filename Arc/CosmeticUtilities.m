//
//  CosmeticUtilities.m
//  Arc
//
//  Created by Shawn Simon on 2014-05-18.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "CosmeticUtilities.h"

@implementation CosmeticUtilities

+ (UIView *) statusBarBackground
{
    UIView* backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [UIApplication sharedApplication].statusBarFrame.size.height)];
    backgroundView.backgroundColor = [UIColor blackColor];
    
    return backgroundView;
}

+ (CGFloat) generalPadding
{
    return 5.0;
}

+ (CGFloat) spaceAtBottomOfPhotoViewInFrameView
{
    return 50.0;
}

+ (CGFloat) arcLogoWidth
{
    return 20;
}

+ (CGFloat) favouriteButtonLength
{
    return 25;
}


@end
