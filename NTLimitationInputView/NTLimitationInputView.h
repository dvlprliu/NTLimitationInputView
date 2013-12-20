//
//  LimitationTextView.h
//  LimitationTextViewDemo
//
//  Created by FFF on 13-12-19.
//  Copyright (c) 2013年 dvlprliu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NTInputViewType) {
    NTInputViewTypeSingleLine = 0,
    NTInputViewTypeMultiLine
};

typedef NS_ENUM(NSUInteger, NTInputViewBorderStyle) {
    NTInputViewBorderStyleNone = 0,
    NTInputViewBorderStyleLine,
    NTInputViewBorderStyleRoundedRect
};

@class LimitePasteTextView;

@interface NTLimitationInputView : UIView
{
    NSString *_string;
}


@property (nonatomic, assign) NTInputViewBorderStyle borderStyle;
@property (nonatomic, assign) NTInputViewType inputViewType;

@property (nonatomic, strong) UIImage *backgroundImage;

@property (nonatomic, strong) LimitePasteTextView *textView;
@property (nonatomic, strong) UILabel *capacityLabel;

@property (nonatomic, strong) UIColor  *capacityColor;
@property (nonatomic, strong) UIColor  *overflowColor;

@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, assign) CGFloat   marginOfTextView;

@property (nonatomic, strong) NSString *string;

- (void)becomeFirstResponder;
- (void)resignFirstResponder;

@end
