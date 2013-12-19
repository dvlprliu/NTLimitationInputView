//
//  LimitationTextView.m
//  LimitationTextViewDemo
//
//  Created by FFF on 13-12-19.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTLimitationInputView.h"

@import QuartzCore;

#define CAPACITY_LABEL_HEIGHT       30

@interface NTLimitationInputView () <UITextViewDelegate>

@property (nonatomic, strong) UILabel *capacityLabel;

@end


@implementation NTLimitationInputView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxLength = 0 ;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 0.5;
        [self initilazeTextView];
        [self initilazeCapacityLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 0.5;
    [self initilazeTextView];
    [self initilazeCapacityLabel];
}

- (void)initilazeTextView
{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:(CGRect){
            .origin.x = 5,
            .origin.y = 5,
            .size.width  = self.frame.size.width - 10,
            .size.height = self.frame.size.height - 10 - CAPACITY_LABEL_HEIGHT
        }];
        _textView.delegate = self;
        _textView.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:15];
        _textView.backgroundColor = [UIColor clearColor];
        [self addSubview:_textView];

    }
}
- (void)initilazeCapacityLabel
{
    if (!_capacityLabel) {
        
        _capacityLabel = [[UILabel alloc] initWithFrame:(CGRect){
            .origin.x = 5,
            .origin.y = self.frame.size.height - CAPACITY_LABEL_HEIGHT,
            .size.width  = self.frame.size.width - 10,
            .size.height = CAPACITY_LABEL_HEIGHT
        }];
        _capacityLabel.backgroundColor = [UIColor clearColor];
        _capacityLabel.textAlignment = NSTextAlignmentRight;
        _capacityLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:14];
        _capacityLabel.textColor = [UIColor blackColor];
        _capacityLabel.text = [NSString stringWithFormat:@"%ld",(long)_maxLength];
        [self addSubview:_capacityLabel];
    }
}

- (void)setMaxLength:(NSInteger)maxLength
{
    _maxLength = maxLength;
   
    _capacityLabel.text = [NSString stringWithFormat:@"%ld",(long)_maxLength];
}

- (void)setCurrentCapacityWithCurrenLength:(NSInteger)currentLength
{
    NSInteger currentCapacity = _maxLength - currentLength;
    
    _capacityLabel.text = [NSString stringWithFormat:@"%ld",(long)currentCapacity];
    if (currentCapacity < 0) {
        _capacityLabel.textColor = [UIColor redColor];
    } else {
        _capacityLabel.textColor = [UIColor blackColor];
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger currentLength = textView.text.length;
    [self setCurrentCapacityWithCurrenLength:currentLength];
}

- (void)dealloc
{
 
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
