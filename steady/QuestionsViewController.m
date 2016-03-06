//
//  QuestionsViewController.m
//  steady
//
//  Created by Daniel.Habib on 2/28/16.
//  Copyright © 2016 HawtLava. All rights reserved.
//

#import "QuestionsViewController.h"
#import "HawtTableView.h"
#import "ResultsViewController.h"
#import "QuestionTableViewCell.h"

NSString *const QUESTIONS = @"questions";
NSString *const SCORE = @"score";

@interface QuestionsViewController (){
    NSArray * _questionsArray;
    NSArray * _scoreArray;
    
    HawtTableView * _questionsTableView;
    HawtTableView * _scoreTableView;
}

@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    
    _questionsArray = @[
                   @"Did I do my best to appreciate my money",
                   @"Did I do my best at meditating today",
                   @"Did I do my best to advance my programming skills",
                   @"Did I do my best to physically challenge myself",
                   @"Did I do my best to stay focused at work",
                   @"Did I do my best to challenge myself mentally",
                   @"Did I do my best to be nice to people"];
    
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
                   @"10",
                   @"N/A"];

    [super viewDidLoad];
    [self initializeQuestionsTableView];
    [self initializeScoreTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeQuestionsTableView{
    HawtTableView * tableView = [[HawtTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.name = QUESTIONS;
    tableView.backgroundColor = [UIColor greenColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    _questionsTableView = tableView;
    [self.view addSubview:tableView];
    
    UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    footer.backgroundColor = [UIColor greenColor];
    
    UIButton * submitButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 100)];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [footer addSubview:submitButton];
    
    tableView.tableFooterView = footer;
    
    [submitButton addTarget:self
                     action:@selector(submitQuestions)
           forControlEvents:UIControlEventPrimaryActionTriggered];
    
}

-(void)initializeScoreTableView{
    HawtTableView * tableView = [[HawtTableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.name = SCORE;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView]; 
    
    UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    header.backgroundColor = [UIColor greenColor];
    
    UILabel * headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 100)];
    headerLabel.text = @"Score!";
    headerLabel.font = [UIFont fontWithName:@"Times" size:40];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [header addSubview:headerLabel];
    
    tableView.tableHeaderView = header;

    _scoreTableView = tableView;
    tableView.alpha = 0;
}

-(void)submitQuestions{
    NSLog(@"Submit Questions Hit!");
    NSMutableDictionary * results = [[NSMutableDictionary alloc] init];;

    NSArray *cells = [_questionsTableView visibleCells];
    
    for (QuestionTableViewCell * cell in cells) {
        NSLog(@"%@", cell.questionLabel.text);
        NSLog(@"%@", cell.scoreLabel.text);
        [results setValue:cell.scoreLabel.text forKey:cell.questionLabel.text];
    }
    
    for (id key in results) {
        NSLog(@"key: %@, value: %@ \n", key, [results objectForKey:key]);
    }
    
    //    [self bv_jsonStringWithPrettyPrint:results];

//    ResultsViewController * controller = [[ResultsViewController alloc] init];
//    [self presentViewController:controller animated:NO completion:nil];
}


#pragma mark Table View
-(UITableViewCell *)tableView:(HawtTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QuestionTableViewCell *cell = [[QuestionTableViewCell alloc]initWithStyle:UITableViewStylePlain reuseIdentifier:@"Cell"];

    if ([tableView.name isEqualToString:QUESTIONS]){
        cell.questionLabel.text = [_questionsArray objectAtIndex:indexPath.row];
        cell.scoreLabel.text = @"SCORE";
    }else if ([tableView.name isEqualToString:SCORE]){
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        [cell purgeLabelsUntilIthinkOfSomethingBetter];
        cell.textLabel.text = [_scoreArray objectAtIndex:indexPath.row];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.userInteractionEnabled = YES;
    return cell;
}

-(void)tableView:(HawtTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView.name isEqualToString:QUESTIONS]){
        NSLog(@"Question Selected %@", [_questionsArray objectAtIndex:indexPath.row]);
        _scoreTableView.alpha = 1;
    } else if ([tableView.name isEqualToString:SCORE]) {
        NSLog(@"Score Selected %ld", (long)indexPath.row);
        NSIndexPath * selectedQuestionIndex = [_questionsTableView indexPathForSelectedRow];
        NSIndexPath * selectedScoreIndex = [_scoreTableView indexPathForSelectedRow];
        
        QuestionTableViewCell * cell = [_questionsTableView cellForRowAtIndexPath:selectedQuestionIndex];
        cell.scoreLabel.text = [_scoreTableView cellForRowAtIndexPath:selectedScoreIndex].textLabel.text;
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

-(void)toggleAlpha:(UIView *)view {
    if (view.alpha > 0.0) {
        view.alpha = 0.0;
    } else {
        view.alpha = 1.0;
    }
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
