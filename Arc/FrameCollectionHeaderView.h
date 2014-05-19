//
//  FrameCollectionHeaderView.h
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FrameModel;

@interface FrameCollectionHeaderView : UICollectionReusableView

@property (strong, nonatomic) FrameModel* frameModel;
@property (strong, nonatomic) UIImageView* backgroundImageView;

@end
