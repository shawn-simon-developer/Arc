//
//  FrameCollectionViewController.m
//  Arc
//
//  Created by Shawn Simon on 2014-04-29.
//  Copyright (c) 2014 Shawn Simon. All rights reserved.
//

#import "FrameCollectionViewController.h"
#import "FrameCollectionView.h"
#import "FrameCollectionViewCell.h"
#import "FrameCollectionViewFlowLayout.h"
#import "FrameCollectionHeaderView.h"

@interface FrameCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) FrameCollectionView* frameCollectionView;
@property (strong, nonatomic) FrameCollectionHeaderView* frameCollectionHeaderView;

@end

@implementation FrameCollectionViewController

#pragma - mark
#pragma - mark LifeCycle

- (void) loadView
{
    [self overrideCollectionViewWithLayout];    
    [self classRegisters];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

#pragma - mark
/* LifeCycle */

#pragma - mark UICollectionView-Overrides

- (void) overrideCollectionViewWithLayout
{
    // UICollectionView Override.
    FrameCollectionViewFlowLayout* frameCollectionViewFlowLayout = [[FrameCollectionViewFlowLayout alloc] init];
    self.frameCollectionView = [[FrameCollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:frameCollectionViewFlowLayout];
    [frameCollectionViewFlowLayout setHeaderReferenceSize:CGSizeMake(self.frameCollectionView.frame.size.width, 160)];
    
    
    self.frameCollectionView.delegate = self;
    self.frameCollectionView.dataSource = self;
    
    [self.frameCollectionView setAlwaysBounceVertical:YES];
    
    self.collectionView = self.frameCollectionView;
}

- (void) classRegisters
{
    // Class registration (reusable views).
    [self.collectionView registerClass:[FrameCollectionViewCell class] forCellWithReuseIdentifier:@"frameCell"];
    
    [self.collectionView registerClass:[FrameCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"frameHeader"];
}

#pragma - mark
/* UICollectionView-Overrides */

#pragma - mark UICollectionViewDataSource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FrameCollectionViewCell* frameCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"frameCell" forIndexPath:indexPath];
    frameCollectionViewCell.backgroundColor = [UIColor whiteColor];

    
    return frameCollectionViewCell;
}

// Header setup.
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    // Check if header is created.
    if (self.frameCollectionHeaderView == nil)
    {
        self.frameCollectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"frameHeader" forIndexPath:indexPath];
    }
    return self.frameCollectionHeaderView;

}

#pragma - mark
/* UICollectionViewDataSource */

#pragma - mark UICollectionViewDelegateFlowLayout

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.width);
}

#pragma - mark
/* UICollectionViewDelegateFlowLayout */

#pragma UICollectionViewDelegate

#pragma - mark
/* UICollectionViewDelegate */

@end
