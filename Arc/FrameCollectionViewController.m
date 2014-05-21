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
#import "FrameDetailView.h"

#import "CosmeticUtilities.h"
#import "ColorUtilities.h"

@interface FrameCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, PullDownUpdateDelegate, DetailViewControllerDelegate>

@property (strong, nonatomic) FrameCollectionView* frameCollectionView;
@property (strong, nonatomic) FrameCollectionViewFlowLayout* frameCollectionViewFlowLayout;
@property (strong, nonatomic) FrameCollectionHeaderView* frameCollectionHeaderView;
@property (strong, nonatomic) UIView* statusBarBackground;
@property (nonatomic) BOOL headerPulled;
@property (strong, nonatomic) FrameDetailView* frameDetailView;

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

#pragma - mark RotationHandling

- (BOOL)shouldAutorotate
{
    return NO;
}

#pragma - mark
/* RotationHandling */

#pragma - mark UICollectionView-Overrides

- (void) overrideCollectionViewWithLayout
{
    // UICollectionView Override.
    self.frameCollectionViewFlowLayout = [[FrameCollectionViewFlowLayout alloc] init];
    self.frameCollectionViewFlowLayout.pullDownUpdateDelegate = self;
    self.headerPulled = NO;
    self.frameCollectionView = [[FrameCollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:self.frameCollectionViewFlowLayout];
    [self.frameCollectionViewFlowLayout setHeaderReferenceSize:CGSizeMake(self.frameCollectionView.frame.size.width, [CosmeticUtilities frameViewStandardHeaderHeight])];


    
    self.frameCollectionView.delegate = self;
    self.frameCollectionView.dataSource = self;
    
    [self.frameCollectionView setAlwaysBounceVertical:YES];
    self.frameCollectionView.backgroundColor = [ColorUtilities flatDarkGrayColor];
    
    self.collectionView = self.frameCollectionView;
    
    
    // Prepare pull down detail view.
    self.frameDetailView = [[FrameDetailView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-[CosmeticUtilities frameViewPulledDownHeaderHeight]+[UIApplication sharedApplication].statusBarFrame.size.height*2)];
    self.frameDetailView.detailViewControllerDelegate = self;
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
        self.frameCollectionViewFlowLayout.headerAnimationsDelegate = self.frameCollectionHeaderView;
        
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (self.headerPulled == YES)
    {
        return CGSizeMake(self.view.frame.size.width, [CosmeticUtilities frameViewPulledDownHeaderHeight]);
    }
    else
    {
        return CGSizeMake(self.view.frame.size.width, [CosmeticUtilities frameViewStandardHeaderHeight]);
    }
}


#pragma - mark
/* UICollectionViewDelegateFlowLayout */

#pragma UICollectionViewDelegate

#pragma - mark
/* UICollectionViewDelegate */

#pragma - mark PullDownUpdateDelegate

- (void) changeLayoutAfterPullDown
{
    //[self.frameCollectionViewFlowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 100)];
    //[self.frameCollectionView reloadData];

    self.headerPulled = YES;
    self.frameCollectionHeaderView = nil;
    self.frameCollectionViewFlowLayout.isPulledDown = YES;
    
    [self.frameCollectionViewFlowLayout setHeaderReferenceSize:CGSizeMake(self.frameCollectionView.frame.size.width, [CosmeticUtilities frameViewPulledDownHeaderHeight])];
    [self addDetailFrameView];
    [self.collectionView reloadData];
}

- (void) revertLayout
{
    self.headerPulled = NO;
    self.frameCollectionHeaderView = nil;
    self.frameCollectionViewFlowLayout.isPulledDown = NO;

    [self.frameCollectionViewFlowLayout setHeaderReferenceSize:CGSizeMake(self.frameCollectionView.frame.size.width, [CosmeticUtilities frameViewStandardHeaderHeight])];
    [self.collectionView reloadData];

}

#pragma - mark
/* PullDownUpdateDelegate */

#pragma - mark FrameUpdateDelegate-Helpers

- (void) addDetailFrameView
{
    [self animationFrameDetailOnScreen];
}

- (void) animationFrameDetailOnScreen
{
    [self.view addSubview:self.frameDetailView];

    [UIView animateWithDuration: 0.4
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations: ^{
                         self.frameDetailView.frame = CGRectMake(0, [CosmeticUtilities frameViewPulledDownHeaderHeight], self.view.frame.size.width, self.view.frame.size.height-[CosmeticUtilities frameViewPulledDownHeaderHeight]+[UIApplication sharedApplication].statusBarFrame.size.height*2);
                     }completion: ^(BOOL completion){
                         self.frameCollectionView.scrollEnabled = NO;
                     }];
}

- (void) animationFrameDetailOffScreen
{
    [UIView animateWithDuration: 0.2
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations: ^{
                         self.frameDetailView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-[CosmeticUtilities frameViewPulledDownHeaderHeight]+[UIApplication sharedApplication].statusBarFrame.size.height*2);
                     }completion: ^(BOOL completion){
                         self.frameCollectionView.scrollEnabled = YES;
                         [self.frameDetailView removeFromSuperview];
                     }];
}

#pragma - mark
/* FrameUpdateDelegate-Helpers */

#pragma - mark Actions

- (void) revertHeader:(id)sender
{
    [self revertLayout];
    [self.frameDetailView removeFromSuperview];
}

#pragma - mark
/* Actions */

#pragma - mark DetailViewControllerDelegate

- (void) revertToOrigionalLayout
{
    [self revertLayout];
    [self animationFrameDetailOffScreen];
}

#pragma - mark
/* DetailViewControllerDelegate */

@end
