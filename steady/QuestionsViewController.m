//
//  QuestionsViewController.m
//  steady
//
//  Created by Daniel.Habib on 2/28/16.
//  Copyright © 2016 HawtLava. All rights reserved.
//

#import "QuestionsViewController.h"
#import "HawtTableView.h"

NSString *const QUESTIONS = @"questions";
NSString *const SCORE = @"score";

@interface QuestionsViewController (){
    NSArray * _questionsArray;
    NSArray * _scoreArray;
}

@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    _questionsArray = @[
                   @"Lorem Ipsum",
                   @"Lorem Ipsum",
                   @"Lorem Ipsum"];
    _scoreArray = @[
                   @"0",
                   @"1",
                   @"2",
                   @"3",
                   @"4",
                   @"5",
                   @"6",
                   @"7",
                   @"8",
                   @"9",
                   @"10"];

    [super viewDidLoad];
    [self initializeTableView];
    [self initializePickerView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initializeTableView{
    HawtTableView * tableView = [[HawtTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 600) style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.name = QUESTIONS;
    tableView.backgroundColor = [UIColor greenColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}
-(void)initializePickerView{
    HawtTableView * tableView = [[HawtTableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.name = SCORE;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    footer.backgroundColor = [UIColor greenColor];
    UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    header.backgroundColor = [UIColor greenColor];
    UILabel * headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 100)];
    headerLabel.text = @"Score!";
    headerLabel.font = [UIFont fontWithName:@"Times" size:40];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [header addSubview:headerLabel];
    tableView.tableHeaderView = header;
    UILabel * submitLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 100)];
    submitLabel.text = @"Submit!";
    submitLabel.font = [UIFont fontWithName:@"Times" size:40];
    submitLabel.textAlignment = NSTextAlignmentCenter;
    [footer addSubview:submitLabel];
    tableView.tableFooterView = footer;
}

#pragma mark Table View
-(UITableViewCell *)tableView:(HawtTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];

    if ([tableView.name isEqualToString:QUESTIONS]){
        cell.textLabel.text = [_questionsArray objectAtIndex:indexPath.row];
    }else if ([tableView.name isEqualToString:SCORE]){
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.text = [_scoreArray objectAtIndex:indexPath.row];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.userInteractionEnabled = YES;
    return cell;
}
-(void)tableView:(HawtTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView.name isEqualToString:QUESTIONS]){
        NSLog(@"Question Selected %@", [_questionsArray objectAtIndex:indexPath.row]);
    } else if ([tableView.name isEqualToString:SCORE]) {
        NSLog(@"Score Selected %ld", (long)indexPath.row);
    }
    NSLog(@"SELECTED");
}
- (NSInteger)tableView:(HawtTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView.name isEqualToString:QUESTIONS]){
        return [_questionsArray count];
    }
    return [_scoreArray count];

}
- (NSInteger)numberOfSectionsInTableView:(HawtTableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(HawtTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

@end
