//
//  ZoomingIconTransition.m
//  ZoomingIcons
//
//  Created by Josh Endter on 7/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "ZoomingIconTransition.h"

@implementation ZoomingIconTransition

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *contextView=[transitionContext containerView];
    
    contextView.backgroundColor = [UIColor whiteColor];
    
    [contextView insertSubview:toVC.view belowSubview:fromVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.alpha=0;
        toVC.view.alpha=1;
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return self;
}

@end
