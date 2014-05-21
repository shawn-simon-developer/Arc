//
//  FrameCollectionViewFlowLayout.h
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderAnimationsDelegate.h"
#import "PullDownUpdateDelegate.h"

@interface FrameCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (strong, nonatomic) id<HeaderAnimationsDelegate> headerAnimationsDelegate;
@property (strong, nonatomic) id<PullDownUpdateDelegate> pullDownUpdateDelegate;
@property (nonatomic) BOOL isPulledDown;

@end
