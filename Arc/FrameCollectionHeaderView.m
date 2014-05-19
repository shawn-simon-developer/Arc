//
//  FrameCollectionHeaderView.m
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameCollectionHeaderView.h"
#import "FrameModel.h"

// Utilities.
#import "PhotoUtilities.h"
#import "CosmeticUtilities.h"

@interface FrameCollectionHeaderView ()

@property (strong, nonatomic) UILabel* frameTitleLabel;
@property (strong, nonatomic) UILabel* frameLocatonLabel;
@property (strong, nonatomic) UILabel* frameDateRangeLabel;

@end

@implementation FrameCollectionHeaderView

#pragma - mark
#pragma - mark LifeCycle

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self setupBackgroundImage];
        [self setupFrameTitleLabel];
        [self setupFrameLocationLabel];
        [self setupFrameDateRangeLabel];
    }
    return self;
}

#pragma - mark
/* LifeCycle */

#pragma - mark HeaderViewSetup

- (void) setupBackgroundImage
{
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.backgroundImageView.image = [UIImage imageNamed:@"background-small.jpg"];
    self.backgroundImageView.image = [PhotoUtilities blurAndAlphaMaskImage:self.backgroundImageView.image];
    [self.backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.backgroundImageView setClipsToBounds:YES];
    [self.backgroundImageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    
    [self addSubview:self.backgroundImageView];
}

- (void) setupFrameTitleLabel
{
    self.frameTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake([CosmeticUtilities generalPadding], [UIApplication sharedApplication].statusBarFrame.size.height + [CosmeticUtilities generalPadding], self.frame.size.width-[CosmeticUtilities generalPadding]*2, [CosmeticUtilities frameViewHeaderTitleHeight])];
    self.frameTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:36];
    self.frameTitleLabel.minimumScaleFactor = 0.5;
    self.frameTitleLabel.textColor = [UIColor whiteColor];
    self.frameTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.frameTitleLabel.adjustsFontSizeToFitWidth = YES;
    self.frameTitleLabel.numberOfLines = 2;
    self.frameTitleLabel.text = @"Event Name";
    
    [self addSubview:self.frameTitleLabel];
}

- (void) setupFrameLocationLabel
{
    CGFloat leftOverHeight = self.frame.size.height-[CosmeticUtilities generalPadding]*3-[CosmeticUtilities frameViewHeaderTitleHeight]-[UIApplication sharedApplication].statusBarFrame.size.height;
    self.frameLocatonLabel = [[UILabel alloc] initWithFrame:CGRectMake([CosmeticUtilities generalPadding], self.frame.size.height-[CosmeticUtilities generalPadding]-leftOverHeight, self.frame.size.width/2-[CosmeticUtilities generalPadding]*2, leftOverHeight)];
    self.frameLocatonLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:14];
    self.frameLocatonLabel.minimumScaleFactor = 0.5;
    self.frameLocatonLabel.textColor = [UIColor whiteColor];
    self.frameLocatonLabel.textAlignment = NSTextAlignmentLeft;
    self.frameLocatonLabel.adjustsFontSizeToFitWidth = YES;
    self.frameLocatonLabel.numberOfLines = 2;
    self.frameLocatonLabel.text = @"Ontario, Canada";
    [self addSubview:self.frameLocatonLabel];
}

- (void) setupFrameDateRangeLabel
{
    CGFloat leftOverHeight = self.frame.size.height-[CosmeticUtilities generalPadding]*3-[CosmeticUtilities frameViewHeaderTitleHeight]-[UIApplication sharedApplication].statusBarFrame.size.height;
    self.frameDateRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2+[CosmeticUtilities generalPadding], self.frame.size.height-[CosmeticUtilities generalPadding]-leftOverHeight, self.frame.size.width/2-[CosmeticUtilities generalPadding]*2, leftOverHeight)];
    self.frameDateRangeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:14];
    self.frameDateRangeLabel.minimumScaleFactor = 0.5;
    self.frameDateRangeLabel.textColor = [UIColor whiteColor];
    self.frameDateRangeLabel.textAlignment = NSTextAlignmentRight;
    self.frameDateRangeLabel.adjustsFontSizeToFitWidth = YES;
    self.frameDateRangeLabel.numberOfLines = 2;
    self.frameDateRangeLabel.text = @"May 24-30, 2014";
    [self addSubview:self.frameDateRangeLabel];
}

#pragma - mark
/* HeaderViewSetup */

@end
