//
//  LimitationTextView.m
//  LimitationTextViewDemo
//
//  Created by FFF on 13-12-19.
//  Copyright (c) 2013年 dvlprliu. All rights reserved.
//

#import "NTLimitationInputView.h"
#import "LimitePasteTextView.h"

#define CAPACITY_LABEL_HEIGHT       30

@interface NTLimitationInputView () <UITextViewDelegate>

@property (nonatomic, strong) UILabel *capacityLabel;

@end


@implementation NTLimitationInputView

@synthesize string = _string;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxLength   = 0 ;
        _edageOffset = 0;
        [self initilazeTextView];
        [self initilazeCapacityLabel];
    }
    return self;
}

- (void)awakeFromNib
{

    [self initilazeTextView];
    [self initilazeCapacityLabel];
}

- (void)initilazeTextView
{
    if (!_textView) {
        
        __weak typeof(self) bself = self;
        LPCommonBlock didPasteBlock = ^(NSInteger length){
            [bself setCurrentCapacityWithCurrenLength:length];
        };
        _textView = [[LimitePasteTextView alloc] initWithFrame:(CGRect){
            .origin.x = _edageOffset,
            .origin.y = _edageOffset,
            .size.width  = self.frame.size.width - 2 * _edageOffset,
            .size.height = self.frame.size.height - 2 * _edageOffset - CAPACITY_LABEL_HEIGHT
        }];
        _textView.delegate = self;
        _textView.editable = YES;
        _textView.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:15];
        _textView.backgroundColor = [UIColor clearColor];
        _textView.didPasteBlock = didPasteBlock;
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
    _textView.pasteStringLengthLimitation = maxLength;
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
- (void)setString:(NSString *)string
{
    if (![_string isEqualToString:string]) {
        _string = string;
        self.textView.text = _string;
    }
}

-(NSString *)string
{
    return self.textView.text;
}

- (void)becomeFirstResponder
{
    [self.textView becomeFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger currentLength = textView.text.length;
    [self setCurrentCapacityWithCurrenLength:currentLength];
}

- (void)dealloc
{
 
}


@end
