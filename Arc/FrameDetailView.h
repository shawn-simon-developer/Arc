//
//  FrameDetailView.h
//  Arc
//
//  Created by Shawn Simon on 2014-05-21.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewControllerDelegate.h"

@interface FrameDetailView : UIView

@property (strong, nonatomic) id<DetailViewControllerDelegate> detailViewControllerDelegate;

@end
