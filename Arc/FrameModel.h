//
//  FrameModel.h
//  Arc
//
//  Created by Shawn Simon on 2014-05-19.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FrameModel : NSObject

@property (strong, nonatomic) NSString* frameTitle;
@property (strong, nonatomic) NSString* frameLocation;
@property (strong, nonatomic) NSString* frameDateRange;
@property (strong, nonatomic) NSString* frameDescription;

@property (strong, nonatomic) NSMutableArray* framePhotos;
@property (strong, nonatomic) NSMutableArray* frameFriends;
@property (strong, nonatomic) NSMutableArray* frameTags;


@end
