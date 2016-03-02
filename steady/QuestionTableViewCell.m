//
//  QuestionTableViewCell.m
//  steady
//
//  Created by Daniel.Habib on 2/29/16.
//  Copyright © 2016 HawtLava. All rights reserved.
//

#import "QuestionTableViewCell.h"

@implementation QuestionTableViewCell

- (void)awakeFromNib {
    // Initialization code

    _questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width - self.frame.size.width/5, self.frame.size.height/4)];
    _questionLabel.backgroundColor = [UIColor yellowColor];
    _questionLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_questionLabel];

    _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(_questionLabel.frame.size.width, self.frame.size.height/2, self.frame.size.width/5, self.frame.size.height/4)];
    _scoreLabel.backgroundColor = [UIColor brownColor];
    _scoreLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_scoreLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
