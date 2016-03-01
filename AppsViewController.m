//
//  AppsViewController.m
//  steady
//
//  Created by Daniel.Habib on 2/28/16.
//  Copyright © 2016 HawtLava. All rights reserved.
//

#import "AppsViewController.h"
#import "QuestionsViewController.h"

@interface AppsViewController (){
    UIButton * _button;
}

@end

@implementation AppsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeAppsButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)initializeAppsButton{
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 4 - 100, self.view.frame.size.height / 4 - 100, 200, 200)];
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self
               action:@selector(segueToApps)
     forControlEvents:UIControlEventPrimaryActionTriggered];
    
    [button setTitle:@"Questions" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.userInteractionEnabled = YES;
    [button setNeedsFocusUpdate];
    [button updateFocusIfNeeded];
    _button = button;
    
}

- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    context.nextFocusedView.layer.shadowOffset = CGSizeMake(0, 10);
    context.nextFocusedView.layer.shadowOpacity = 0.6;
    context.nextFocusedView.layer.shadowRadius = 15;
    context.nextFocusedView.layer.shadowColor = [UIColor blackColor].CGColor;
    context.previouslyFocusedView.layer.shadowOpacity = 0;
}

-(void)segueToApps{
    QuestionsViewController * controller = [[QuestionsViewController alloc] init];
    NSLog(@"Segue Activated");
    [self presentViewController:controller animated:NO completion:nil];
}


@end
