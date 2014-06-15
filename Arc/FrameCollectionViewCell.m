//
//  FrameCollectionViewCell.m
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameCollectionViewCell.h"
#import "FrameCellPresenter.h"

// Utilities.
#import "CosmeticUtilities.h"
#import "ColorUtilities.h"

@interface FrameCollectionViewCell ()

@property (strong, nonatomic) FrameCellPresenter* frameCellPresenter;

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
        self.frameCellPresenter = [[FrameCellPresenter alloc] init];
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
    self.photoImageView = [self.frameCellPresenter setupPhotoImageViewFromFrame:self.contentView.frame];
    [self.contentView addSubview:self.photoImageView];
}

- (void) setupPhotoLocationLabel
{
    self.photoLocationLabel = [self.frameCellPresenter setupPhotoLocationLabelFromFrame:self.contentView.frame];
    self.photoLocationLabel.text = @"Hamilton, Ontario";
    [self.contentView addSubview:self.photoLocationLabel];
}

- (void) setupArcButton
{
    // Placement dependency. Must order initializations correctly.
    assert(self.photoLocationLabel != nil);
    
    self.arcButton = [self.frameCellPresenter setupArcButtonFromFrame:self.contentView.frame
                                                     andRelativeFrame:self.photoLocationLabel.frame];
    [self.contentView addSubview:self.arcButton];
}

- (void) setupPhotoTimeLabel
{
    // Placement dependency. Must order initializations correctly.
    assert(self.photoLocationLabel != nil);
    
    self.photoTimeLabel = [self.frameCellPresenter setupPhotoTimeLabelFromFrame:self.contentView.frame andRelativeFrame:self.photoLocationLabel.frame];
    self.photoTimeLabel.text = @"6:30 PM";
    [self.contentView addSubview:self.photoTimeLabel];
}

- (void) setupFavouritePhotoButton
{
    self.favouritePhotoButton = [self.frameCellPresenter setupFavouriteButtonFromFrame:self.contentView.frame];
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
