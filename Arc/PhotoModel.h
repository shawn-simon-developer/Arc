//
//  PhotoModel.h
//  Arc
//
//  Created by Shawn Simon on 2014-05-19.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject

@property (strong, nonatomic) NSString* photoLocation;
@property (strong, nonatomic) NSString* photoTime;
@property (nonatomic) BOOL isFavourited;

@end
