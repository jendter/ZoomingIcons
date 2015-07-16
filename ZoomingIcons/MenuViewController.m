//
//  MenuViewController.m
//  ZoomingIcons
//
//  Created by Josh Endter on 7/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "MenuViewController.h"
#import "SocialItem.h"
#import "SocialItemCell.h"
#import "DetailedViewController.h"

@import AVFoundation;

@interface MenuViewController()

@property (strong, nonatomic) NSArray *socialItems;

@end

@implementation MenuViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSocialItems];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
}

#pragma mark - Collection View Actions

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    SocialItem *socialItem;
    if (indexPath.section == 0) {
        NSInteger socialItemPath = indexPath.item;
        socialItem = self.socialItems[socialItemPath];
    } else {
        NSInteger socialItemPath = indexPath.item + 2;
        socialItem = self.socialItems[socialItemPath];
    }
    
    vc.socialItem = socialItem;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - Collection View Data

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
    SocialItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"iconCell" forIndexPath:indexPath];
    
    // Get the socialItem
    SocialItem *socialItem;
    
    if (indexPath.section == 0) {
        NSInteger socialItemPath = indexPath.item;
        socialItem = self.socialItems[socialItemPath];
    } else {
        NSInteger socialItemPath = indexPath.item + 2;
        socialItem = self.socialItems[socialItemPath];
    }
    
    
    cell.socialItem = socialItem;
    cell.imageView.image = socialItem.image;
    cell.viewColor.backgroundColor = socialItem.color;
    
    
    return cell;
}

#pragma mark - Collection View Layout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize = CGSizeMake(100, 100);
    return cellSize;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
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

-(void)createSocialItems {
    SocialItem *socialItem1 = [[SocialItem alloc] init];
    socialItem1.image = [UIImage imageNamed:@"icon-twitter"];
    socialItem1.color = [UIColor colorWithRed:0.255 green:0.557 blue:0.910 alpha:1];
    socialItem1.name = @"Twitter";
    socialItem1.summary = @"Twitter is an online social networking service that enables users to send and read short 140-character messages called \"tweets\".";
    
    SocialItem *socialItem2 = [[SocialItem alloc] init];
    socialItem2.image = [UIImage imageNamed:@"icon-facebook"];
    socialItem2.color = [UIColor colorWithRed:0.239 green:0.353 blue:0.588 alpha:1];
    socialItem2.name = @"Facebook";
    socialItem2.summary = @"Facebook (formerly thefacebook) is an online social networking service headquartered in Menlo Park, California. Its name comes from a colloquialism for the directory given to students at some American universities.";
    
    SocialItem *socialItem3 = [[SocialItem alloc] init];
    socialItem3.image = [UIImage imageNamed:@"icon-youtube"];
    socialItem3.color = [UIColor colorWithRed:0.729 green:0.188 blue:0.180 alpha:1];
    socialItem3.name = @"YouTube";
    socialItem3.summary = @"YouTube is a video-sharing website headquartered in San Bruno, California. The service was created by three former PayPal employees in February 2005 and has been owned by Google since late 2006. The site allows users to upload, view, and share videos.";
    
    SocialItem *socialItem4 = [[SocialItem alloc] init];
    socialItem4.image = [UIImage imageNamed:@"icon-vimeo"];
    socialItem4.color = [UIColor colorWithRed:0.329 green:0.737 blue:0.988 alpha:1];
    socialItem4.name = @"Vimeo";
    socialItem4.summary = @"Vimeo is a U.S.-based video-sharing website on which users can upload, share and view videos. Vimeo was founded in November 2004 by Jake Lodwick and Zach Klein.";
    
    SocialItem *socialItem5 = [[SocialItem alloc] init];
    socialItem5.image = [UIImage imageNamed:@"icon-instagram"];
    socialItem5.color = [UIColor colorWithRed:0.325 green:0.498 blue:0.635 alpha:1];
    socialItem5.name = @"Instagram";
    socialItem5.summary = @"Instagram is an online mobile photo-sharing, video-sharing and social networking service that enables its users to take pictures and videos, and share them on a variety of social networking platforms, such as Facebook, Twitter, Tumblr and Flickr.";
    
    
    self.socialItems = @[socialItem1, socialItem2, socialItem3, socialItem4, socialItem5];
}

@end
