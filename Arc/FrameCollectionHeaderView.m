//
//  FrameCollectionHeaderView.m
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameCollectionHeaderView.h"
#import <GPUImageView.h>
#import <GPUImage.h>

@implementation FrameCollectionHeaderView

#pragma - mark
#pragma - mark LifeCycle

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backgroundImageView.image = [UIImage imageNamed:@"background.jpg"];
        [self.backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.backgroundImageView setClipsToBounds:YES];
        [self.backgroundImageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        
        [self addSubview:self.backgroundImageView];
    }
    return self;
}

#pragma - mark
/* LifeCycle */

@end
