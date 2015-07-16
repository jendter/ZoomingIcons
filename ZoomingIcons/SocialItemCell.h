//
//  SocialItemCell.h
//  ZoomingIcons
//
//  Created by Josh Endter on 7/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SocialItem;

@interface SocialItemCell : UICollectionViewCell

@property (strong, nonatomic) SocialItem *socialItem;

@property (weak, nonatomic) IBOutlet UIView *viewColor;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
