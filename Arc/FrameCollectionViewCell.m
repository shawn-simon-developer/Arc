//
//  FrameCollectionViewCell.m
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameCollectionViewCell.h"

// Utilities.
#import "CosmeticUtilities.h"
#import "ColorUtilities.h"

@interface FrameCollectionViewCell ()

@property (strong, nonatomic) UIImageView* photoImageView;

@property (strong, nonatomic) UILabel* photoLocationLabel;
@property (strong, nonatomic) UILabel* photoTimeLabel;

@property (strong, nonatomic) UIButton* arcButton;
@property (strong, nonatomic) UIButton* favouritePhotoButton;

@end

@implementation FrameCollectionViewCell

#pragma - mark
#pragma - mark LifeCycle

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // Testing ----------
        self.photoModel = [[PhotoModel alloc] init];
        // ------------------
        self.backgroundColor = [UIColor whiteColor];
        [self setupPhotoImageView];
        [self setupPhotoLocationLabel];
        [self setupArcButton];
        [self setupFavouritePhotoButton];
        [self setupPhotoTimeLabel];
    }
    return self;
}

#pragma - mark
/* LifeCycle */

#pragma - mark CellViewSetup

- (void) setupPhotoImageView
{
    self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake([CosmeticUtilities generalPadding], [CosmeticUtilities generalPadding], self.contentView.frame.size.width-[CosmeticUtilities generalPadding]*2, self.contentView.frame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities generalPadding])];
    self.photoImageView.backgroundColor = [ColorUtilities flatDarkGrayColor];
    [self.contentView addSubview:self.photoImageView];
}

- (void) setupPhotoLocationLabel
{
    self.photoLocationLabel = [[UILabel alloc] initWithFrame:CGRectMake([CosmeticUtilities generalPadding], self.contentView.frame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]+[CosmeticUtilities generalPadding], self.contentView.frame.size.width/2-[CosmeticUtilities generalPadding]*2-[CosmeticUtilities arcLogoWidth]/2, [CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities generalPadding]*2)];
    self.photoLocationLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:18];
    self.photoLocationLabel.adjustsFontSizeToFitWidth = YES;
    self.photoLocationLabel.numberOfLines = 2;
    self.photoLocationLabel.textAlignment = NSTextAlignmentLeft;
    self.photoLocationLabel.text = @"Ontario, Canada";
    [self.contentView addSubview:self.photoLocationLabel];
}

- (void) setupArcButton
{
    // Placement dependency. Must order initializations correctly.
    assert(self.photoLocationLabel != nil);
    
    self.arcButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.arcButton.frame = CGRectMake([CosmeticUtilities generalPadding]*2+self.photoLocationLabel.frame.size.width, self.contentView.frame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]+[CosmeticUtilities generalPadding], [CosmeticUtilities arcLogoWidth], [CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities generalPadding]*2);
    [self.arcButton setBackgroundImage:[UIImage imageNamed:@"Arc.png"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.arcButton];
}

- (void) setupPhotoTimeLabel
{
    // Placement dependency. Must order initializations correctly.
    assert(self.photoLocationLabel != nil);
    
    self.photoTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.photoLocationLabel.frame.size.width+[CosmeticUtilities arcLogoWidth]+[CosmeticUtilities generalPadding]*3, self.contentView.frame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView] + [CosmeticUtilities generalPadding], self.photoLocationLabel.frame.size.width-[CosmeticUtilities favouriteButtonLength]-([CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities favouriteButtonLength])/2, [CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities generalPadding]*2)];
    self.photoTimeLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:18];
    self.photoTimeLabel.adjustsFontSizeToFitWidth = YES;
    self.photoTimeLabel.numberOfLines = 1;
    self.photoTimeLabel.textAlignment = NSTextAlignmentRight;
    self.photoTimeLabel.text = @"6:30 PM";
    [self.contentView addSubview:self.photoTimeLabel];
}

- (void) setupFavouritePhotoButton
{
    self.favouritePhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.favouritePhotoButton.frame = CGRectMake(self.contentView.frame.size.width-[CosmeticUtilities favouriteButtonLength]-[CosmeticUtilities generalPadding]*2, self.contentView.frame.size.height-[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]+([CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]-[CosmeticUtilities favouriteButtonLength])/2, [CosmeticUtilities favouriteButtonLength], [CosmeticUtilities favouriteButtonLength]);
    
    if (self.photoModel.isFavourited == YES)
    {
        [self.favouritePhotoButton setBackgroundImage:[UIImage imageNamed:@"favourited.png"] forState:UIControlStateNormal];
    }
    else
    {
        [self.favouritePhotoButton setBackgroundImage:[UIImage imageNamed:@"notFavourited.png"] forState:UIControlStateNormal];
    }
    
    [self.favouritePhotoButton addTarget:self action:@selector(photoFavouriteButtonPressed:)forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.favouritePhotoButton];
}

#pragma - mark
/* CellViewSetup */

#pragma - mark Actions

- (void) photoFavouriteButtonPressed:(id) sender
{
    if (self.photoModel.isFavourited == NO)
    {
        self.photoModel.isFavourited = YES;
        [self photoWasFavouritedAnimation];
    }
    else
    {
        self.photoModel.isFavourited = NO;
        [self photoWasUnFavourtiedAnimation];
    }

}

#pragma - mark
/* Actions */

#pragma - mark Animations

- (void) photoWasFavouritedAnimation
{
    [UIView animateWithDuration: 0.3
                          delay: 0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.favouritePhotoButton.transform = CGAffineTransformMakeScale(1.2,1.2);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration: 0.2
                                               delay: 0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations: ^{
                                              [self.favouritePhotoButton setBackgroundImage:[UIImage imageNamed:@"favourited.png"] forState:UIControlStateNormal];
                                              self.favouritePhotoButton.transform = CGAffineTransformMakeScale(1,1);
                                          }
                                          completion:^(BOOL finished) {
                                              // Do nothing.
                                          }];
                     }];
}

- (void) photoWasUnFavourtiedAnimation
{
    [UIView animateWithDuration: 0.3
                          delay: 0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.favouritePhotoButton.transform = CGAffineTransformMakeScale(1.2,1.2);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration: 0.2
                                               delay: 0
                                             options: UIViewAnimationOptionCurveEaseOut
                                          animations: ^{
                                              [self.favouritePhotoButton setBackgroundImage:[UIImage imageNamed:@"notFavourited.png"] forState:UIControlStateNormal];
                                              self.favouritePhotoButton.transform = CGAffineTransformMakeScale(1,1);
                                          }
                                          completion:^(BOOL finished) {
                                              // Do nothing.
                                          }];
                     }];
}

#pragma - mark
/* Animations */

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
