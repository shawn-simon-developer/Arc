//
//  PullDownUpdateDelegate.h
//  Arc
//
//  Created by Shawn Simon on 2014-05-19.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PullDownUpdateDelegate <NSObject>

- (void) changeLayoutAfterPullDown;
- (void) revertLayout;

@end
