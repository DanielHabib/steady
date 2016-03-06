//
//  QuestionTableViewCell.m
//  steady
//
//  Created by Daniel.Habib on 2/29/16.
//  Copyright © 2016 HawtLava. All rights reserved.
//

#import "QuestionTableViewCell.h"

@implementation QuestionTableViewCell {
    UIFont * _labelFont;
}

//- (void)awakeFromNib {
//    // Initialization code
//
//
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _labelFont = [UIFont fontWithName:@"Times" size:30];
    if (self) {
        // Initialization code
        _questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width * 2.5, self.frame.size.height)];
        _questionLabel.backgroundColor = [UIColor yellowColor];
        _questionLabel.font = _labelFont;
        _questionLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_questionLabel];
        
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(800, 0, self.frame.size.width/2, self.frame.size.height)];
        _scoreLabel.backgroundColor = [UIColor brownColor];
        _scoreLabel.font = _labelFont;
        _scoreLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_scoreLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)purgeLabelsUntilIthinkOfSomethingBetter{
    [_scoreLabel removeFromSuperview];
    [_questionLabel removeFromSuperview];
}

/*
 - (void)setSelected:(BOOL)selected animated:(BOOL)animated
 {
 [super setSelected:selected animated:animated];
 
 // Configure the view for the selected state
 }*/


@end
