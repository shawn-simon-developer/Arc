//
//  FrameCollectionViewFlowLayout.m
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameCollectionViewFlowLayout.h"
#import "CosmeticUtilities.h"

@interface FrameCollectionViewFlowLayout () <UICollectionViewDelegateFlowLayout>

@end

@implementation FrameCollectionViewFlowLayout

#pragma - mark
#pragma - mark UICollectionViewLayout-Overrides

/*
 This will schedule calls to alyoutAttributesForElementsInRect: as the
 collectionView is scrolling.
 */
- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect
{

    UICollectionView *collectionView = [self collectionView];
    UIEdgeInsets insets = [collectionView contentInset];
    CGPoint offset = [collectionView contentOffset];
    CGFloat minY = -insets.top;
    // NSLog(@"%f, %f %f", offset.y, minY, [self headerReferenceSize].height);
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    if (self.isPulledDown != YES) {

        if (offset.y <= [CosmeticUtilities headerPullDownBounds])
        {
            //[self.headerAnimationsDelegate headerOffsetAnimation];
            [self.pullDownUpdateDelegate changeLayoutAfterPullDown];
        }
    
        else if (offset.y < minY) {
        
            CGSize  headerSize = [self headerReferenceSize];
        
            CGFloat deltaY = fabsf(offset.y - minY);
        
            for (UICollectionViewLayoutAttributes *attrs in attributes) {
            
                if ([attrs representedElementKind] == UICollectionElementKindSectionHeader) {
                
                    CGRect headerRect = [attrs frame];
                    headerRect.size.height = MAX(minY, headerSize.height + deltaY);
                    headerRect.origin.y = headerRect.origin.y - deltaY;
                    [attrs setFrame:headerRect];
                    break;
                }
            }
        }
    }
    else
    {
        if (offset.y < minY) {
            
            CGSize  headerSize = [self headerReferenceSize];
            
            CGFloat deltaY = fabsf(offset.y - minY);
            
            for (UICollectionViewLayoutAttributes *attrs in attributes) {
                
                if ([attrs representedElementKind] == UICollectionElementKindSectionHeader) {
                    
                    CGRect headerRect = [attrs frame];
                    headerRect.size.height = MAX(minY, headerSize.height + deltaY);
                    headerRect.origin.y = headerRect.origin.y - deltaY;
                    [attrs setFrame:headerRect];
                    break;
                }
            }
        }

        if (offset.y >= -[CosmeticUtilities headerPullDownBounds])
        {
            //[self.pullDownUpdateDelegate changeLayoutAfterPushUp];
        }
    }
    
    return attributes;
}

#pragma - mark
/* UICollectionViewLayout-Overrides */

#pragma - mark UICollectionViewFlowLayout-Overrides

// Only supports vertical scrolling for header stretching.
- (UICollectionViewScrollDirection) scrollDirection
{
    return UICollectionViewScrollDirectionVertical;
}

#pragma - mark
/* UICollectionViewFlowLayout-Overrides */

@end
