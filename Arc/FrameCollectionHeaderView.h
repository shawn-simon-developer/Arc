//
//  FrameCollectionHeaderView.h
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderAnimationsDelegate.h"
@class FrameModel;

@interface FrameCollectionHeaderView : UICollectionReusableView <HeaderAnimationsDelegate>

@property (strong, nonatomic) FrameModel* frameModel;
@property (strong, nonatomic) UIImageView* backgroundImageView;

@end
