//
//  SocialItemCell.m
//  ZoomingIcons
//
//  Created by Josh Endter on 7/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "SocialItemCell.h"
#import "SocialItem.h"

@implementation SocialItemCell

-(void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.width/2;
    self.layer.masksToBounds = YES;
}


@end
