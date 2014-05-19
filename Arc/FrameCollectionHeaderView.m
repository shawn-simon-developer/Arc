//
//  FrameCollectionHeaderView.m
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameCollectionHeaderView.h"
#import "PhotoUtilities.h"

@implementation FrameCollectionHeaderView

#pragma - mark
#pragma - mark LifeCycle

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backgroundImageView.image = [UIImage imageNamed:@"background-small.jpg"];
        self.backgroundImageView.image = [PhotoUtilities blurAndAlphaMaskImage:self.backgroundImageView.image];
        [self.backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.backgroundImageView setClipsToBounds:YES];
        [self.backgroundImageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        
        [self addSubview:self.backgroundImageView];
    }
    return self;
}

#pragma - mark
/* LifeCycle */

#pragma - mark HeaderViewSetup

#pragma - mark
/* HeaderViewSetup */

@end
