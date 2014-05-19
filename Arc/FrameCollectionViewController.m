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

#import "CosmeticUtilities.h"
#import "ColorUtilities.h"

@interface FrameCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) FrameCollectionView* frameCollectionView;
@property (strong, nonatomic) FrameCollectionHeaderView* frameCollectionHeaderView;
@property (strong, nonatomic) UIView* statusBarBackground;

@end

@implementation FrameCollectionViewController

#pragma - mark
#pragma - mark LifeCycle

- (void) loadView
{
    [self overrideCollectionViewWithLayout];    
    [self classRegisters];
    [self setupStatusBarBackground];
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

- (UIStatusBarStyle) preferredStatusBarStyle
{
    
    return UIStatusBarStyleLightContent;
}

- (void) setupStatusBarBackground
{
    self.statusBarBackground = [CosmeticUtilities statusBarBackground];
    [self.view addSubview:self.statusBarBackground];
}

#pragma - mark
/* LifeCycle */

#pragma - mark UICollectionView-Overrides

- (void) overrideCollectionViewWithLayout
{
    // UICollectionView Override.
    FrameCollectionViewFlowLayout* frameCollectionViewFlowLayout = [[FrameCollectionViewFlowLayout alloc] init];
    self.frameCollectionView = [[FrameCollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:frameCollectionViewFlowLayout];
    [frameCollectionViewFlowLayout setHeaderReferenceSize:CGSizeMake(self.frameCollectionView.frame.size.width, 100)];
    
    
    self.frameCollectionView.delegate = self;
    self.frameCollectionView.dataSource = self;
    
    [self.frameCollectionView setAlwaysBounceVertical:YES];
    self.frameCollectionView.backgroundColor = [ColorUtilities flatDarkGrayColor];
    
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
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.width+[CosmeticUtilities spaceAtBottomOfPhotoViewInFrameView]/2);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return [CosmeticUtilities generalPadding]; 
}

#pragma - mark
/* UICollectionViewDelegateFlowLayout */

#pragma UICollectionViewDelegate

#pragma - mark
/* UICollectionViewDelegate */

@end
