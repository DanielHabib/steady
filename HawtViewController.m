//
//  HawtViewController.m
//  steady
//
//  Created by Daniel.Habib on 3/2/16.
//  Copyright © 2016 HawtLava. All rights reserved.
//

#import "HawtViewController.h"

@interface HawtViewController ()

@end

@implementation HawtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    if (![context isKindOfClass:[UITableViewCell class]] ){
        context.nextFocusedView.layer.shadowOffset = CGSizeMake(0, 10);
        context.nextFocusedView.layer.shadowOpacity = 0.6;
        context.nextFocusedView.layer.shadowRadius = 15;
        context.nextFocusedView.layer.shadowColor = [UIColor blackColor].CGColor;
        context.previouslyFocusedView.layer.shadowOpacity = 0;
    }
}

-(NSString*) bv_jsonStringWithPrettyPrint:(BOOL) prettyPrint {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions)    (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

@end
