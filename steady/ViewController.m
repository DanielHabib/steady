//
//  ViewController.m
//  steady
//
//  Created by Daniel.Habib on 2/25/16.
//  Copyright © 2016 HawtLava. All rights reserved.
//

#import "ViewController.h"
#import "AppsViewController.h"


@interface ViewController () {
    UIButton * _button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initializeUserButton{
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, self.view.frame.size.height / 2 - 100, 200, 200)];
    button.backgroundColor = [UIColor blueColor];
    
    [button addTarget:self
               action:@selector(segueToApps)
     forControlEvents:UIControlEventPrimaryActionTriggered];

    [button setTitle:@"DAN" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.userInteractionEnabled = YES;
    [button setNeedsFocusUpdate];
    [button updateFocusIfNeeded];
    _button = button;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
//    tap.allowedPressTypes = [NSNumber numberWithInt: UIPressType.Select.rawValue)];
    [self.view addGestureRecognizer:tap];
    
}
-(void)tapped:(UITapGestureRecognizer*) gesture {
    NSLog(@"TAPPED");
}

-(void)segueToApps{
    AppsViewController * controller = [[AppsViewController alloc] init];
    NSLog(@"Segue Activated");
    [self presentViewController:controller animated:NO completion:nil];
}

//-(UIView *)preferredFocusedView{
//    NSLog(@"PReffered Focused View is the Button");
//    return _button;
//}
@end
