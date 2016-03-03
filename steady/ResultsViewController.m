//
//  ResultsViewController.m
//  steady
//
//  Created by Daniel.Habib on 3/2/16.
//  Copyright © 2016 HawtLava. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    context.nextFocusedView.layer.shadowOffset = CGSizeMake(0, 10);
    context.nextFocusedView.layer.shadowOpacity = 0.6;
    context.nextFocusedView.layer.shadowRadius = 15;
    context.nextFocusedView.layer.shadowColor = [UIColor blackColor].CGColor;
    context.previouslyFocusedView.layer.shadowOpacity = 0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
