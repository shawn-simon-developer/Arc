//
//  FrameCellPresenter.h
//  Arc
//
//  Created by Shawn Simon on 2014-06-15.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FrameCellPresenter : NSObject

- (UIImageView *) setupPhotoImageViewFromFrame:(CGRect)contentViewFrame;

- (UILabel *) setupPhotoLocationLabelFromFrame:(CGRect)contentViewFrame;

- (UIButton *) setupArcButtonFromFrame:(CGRect)contentViewFrame andRelativeFrame:(CGRect)relativeFrame;

- (UILabel *) setupPhotoTimeLabelFromFrame:(CGRect)contentViewFrame andRelativeFrame:(CGRect)relativeFrame;

- (UIButton *) setupFavouriteButtonFromFrame:(CGRect)contentViewFrame;

@end
