//
//  DetailedViewController.m
//  ZoomingIcons
//
//  Created by Josh Endter on 7/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "DetailedViewController.h"
#import "SocialItem.h"

@interface DetailedViewController()

@property (weak, nonatomic) IBOutlet UIImageView *socialImage;
@property (weak, nonatomic) IBOutlet UILabel *socialNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *socialSummaryLabel;


@end

@implementation DetailedViewController

- (IBAction)popViewControllerAnimated:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.socialImage.image = self.socialItem.image;
    self.socialNameLabel.text = self.socialItem.name;
    self.socialSummaryLabel.text = self.socialItem.summary;
    self.view.backgroundColor = self.socialItem.color;
}

@end
