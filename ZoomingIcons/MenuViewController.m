//
//  MenuViewController.m
//  ZoomingIcons
//
//  Created by Josh Endter on 7/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "MenuViewController.h"

@implementation MenuViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else {
        return 3;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"iconCell" forIndexPath:indexPath];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize = CGSizeMake(100, 100);
    return cellSize;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    if (section == 0) {
    
    NSInteger numOfCells = [self collectionView:collectionView numberOfItemsInSection:section];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    CGSize cellSize = [self collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    CGFloat collectionViewWidth = self.collectionView.bounds.size.width;
    
    CGFloat cellSpacing = 10;
    
    CGFloat cellWidthTotal = (cellSize.width*(float)numOfCells);
    CGFloat cellSpacingTotal = (float)(numOfCells-1) * cellSpacing;
    CGFloat TotalCellContentWidth = cellWidthTotal + cellSpacingTotal;
    CGFloat leftRightSpacing = (collectionViewWidth - TotalCellContentWidth) / 2;
    
    return UIEdgeInsetsMake(0, leftRightSpacing, 20, leftRightSpacing);

}

@end
