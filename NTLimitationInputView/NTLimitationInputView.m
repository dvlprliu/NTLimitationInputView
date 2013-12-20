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

@import QuartzCore;

@interface NTLimitationInputView () <UITextViewDelegate>



@end


@implementation NTLimitationInputView

@synthesize string = _string;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxLength   = 0 ;
        _marginOfTextView = 0;
        _capacityColor = [UIColor blackColor];
        _overflowColor = [UIColor redColor];
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
        _textView = [[LimitePasteTextView alloc] initWithFrame:[self setTextViewFrameWithMargin:_marginOfTextView]];
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
        _capacityLabel.textColor = _overflowColor;
    } else {
        _capacityLabel.textColor = _capacityColor;
    }
    
}

- (void)becomeFirstResponder
{
    [self.textView becomeFirstResponder];
}

- (void)resignFirstResponder
{
    [self.textView resignFirstResponder];
}


- (void)setString:(NSString *)string
{
    if (![_string isEqualToString:string]) {
        _string = string;
        self.textView.text = _string;
    }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    if (_backgroundImage != backgroundImage) {
        _backgroundImage = backgroundImage;
        
        self.textView.backgroundColor = [UIColor clearColor];
        self.capacityLabel.backgroundColor = [UIColor clearColor];
        
        self.layer.contents = (id)_backgroundImage.CGImage;
        self.layer.masksToBounds = YES;
        self.layer.contentsGravity = @"resizeAspectFill";
    }
}

-(NSString *)string
{
    return self.textView.text;
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger currentLength = textView.text.length;
    [self setCurrentCapacityWithCurrenLength:currentLength];
}

- (void)setMarginOfTextView:(CGFloat)marginOfTextView
{
    if (_marginOfTextView != marginOfTextView) {
        _marginOfTextView = marginOfTextView;
        _textView.frame = [self setTextViewFrameWithMargin:_marginOfTextView];
    }
}

- (CGRect)setTextViewFrameWithMargin:(CGFloat)margin
{
    CGRect textFrame = (CGRect) {
        .origin.x = margin,
        .origin.y = margin,
        .size.width = self.frame.size.width - 2 * margin,
        .size.height = self.frame.size.height - 0.5 * margin - CAPACITY_LABEL_HEIGHT
    };
    
    return textFrame;
}

- (void)setBorderStyle:(NTInputViewBorderStyle)borderStyle
{
    _borderStyle = borderStyle;
    
    switch (borderStyle) {
        case NTInputViewBorderStyleLine:
        {
            [self setLinedBorderStyle];
            break;
        }
        case NTInputViewBorderStyleRoundedRect:
        {
            [self setRoundedBorderStyle];
        }
        case NTInputViewBorderStyleNone:
        {
            [self setNoneBorderStyle];
            break;
        }
            
        default:
            break;
    }
}

- (void)dealloc
{
 
}

#pragma mark - set border methoud

- (void)setRoundedBorderStyle
{
    self.layer.borderColor  = [UIColor blackColor].CGColor;
    self.layer.borderWidth  = 1;
    self.layer.cornerRadius = 7.5;
}

- (void)setLinedBorderStyle
{
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
}

- (void)setNoneBorderStyle
{
    self.layer.borderWidth  = 0;
    self.layer.cornerRadius = 0;
}


@end
