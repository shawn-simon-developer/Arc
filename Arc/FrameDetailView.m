//
//  FrameDetailView.m
//  Arc
//
//  Created by Shawn Simon on 2014-05-21.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameDetailView.h"

@interface FrameDetailView ()

@property (strong, nonatomic) UISwipeGestureRecognizer *swipeUp;

@end

@implementation FrameDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupSwipeToRevertGesture];
    }
    return self;
}

- (void) setupSwipeToRevertGesture
{
    self.swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(revertLayout:)];
    self.swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:self.swipeUp];
}

- (void) revertLayout:(id) sender
{
    [self.detailViewControllerDelegate revertToOrigionalLayout];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
