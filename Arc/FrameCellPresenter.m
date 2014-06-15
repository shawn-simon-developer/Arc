//
//  FrameCellPresenter.m
//  Arc
//
//  Created by Shawn Simon on 2014-06-15.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameCellPresenter.h"

// Utilities.
#import "CosmeticUtilities.h"
#import "ColorUtilities.h"

@implementation FrameCellPresenter

- (UIImageView *) setupPhotoImageViewFromFrame:(CGRect)contentViewFrame
{
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake([CosmeticUtilities generalPadding], [CosmeticUtilities generalPadding], contentViewFrame.size.width-[CosmeticUtilities generalPadding]*2, contentViewFrame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities generalPadding])];
    imageView.backgroundColor = [ColorUtilities flatDarkGrayColor];
    
    return imageView;
}

- (UILabel *) setupPhotoLocationLabelFromFrame:(CGRect)contentViewFrame
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake([CosmeticUtilities generalPadding], contentViewFrame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]+[CosmeticUtilities generalPadding], contentViewFrame.size.width/2-[CosmeticUtilities generalPadding]*2-[CosmeticUtilities arcLogoWidth]/2, [CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities generalPadding]*2)];
    label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:18];
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 2;
    label.textAlignment = NSTextAlignmentLeft;
    
    return label;
}

- (UIButton *) setupArcButtonFromFrame:(CGRect)contentViewFrame andRelativeFrame:(CGRect)relativeFrame
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake([CosmeticUtilities generalPadding]*2+relativeFrame.size.width, contentViewFrame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]+[CosmeticUtilities generalPadding], [CosmeticUtilities arcLogoWidth], [CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities generalPadding]*2);
    [button setBackgroundImage:[UIImage imageNamed:@"Arc.png"] forState:UIControlStateNormal];
    
    return button;
}

- (UILabel *) setupPhotoTimeLabelFromFrame:(CGRect)contentViewFrame andRelativeFrame:(CGRect)relativeFrame
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(relativeFrame.size.width+[CosmeticUtilities arcLogoWidth]+[CosmeticUtilities generalPadding]*3, contentViewFrame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView] + [CosmeticUtilities generalPadding], relativeFrame.size.width-[CosmeticUtilities favouriteButtonLength]-([CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities favouriteButtonLength])/2, [CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities generalPadding]*2)];
    label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:18];
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentRight;
    
    return label;
}

- (UIButton *) setupFavouriteButtonFromFrame:(CGRect)contentViewFrame
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(contentViewFrame.size.width-[CosmeticUtilities favouriteButtonLength]-[CosmeticUtilities generalPadding]*2, contentViewFrame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]+([CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities favouriteButtonLength])/2, [CosmeticUtilities favouriteButtonLength], [CosmeticUtilities favouriteButtonLength]);
    [button setBackgroundImage:[UIImage imageNamed:@"notFavourited.png"] forState:UIControlStateNormal];
        
    return button;
}


@end
