//
//  LimitationTextView.h
//  LimitationTextViewDemo
//
//  Created by FFF on 13-12-19.
//  Copyright (c) 2013年 dvlprliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LimitePasteTextView;

@interface NTLimitationInputView : UIView
{
    NSString *_string;
}

@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, assign) CGFloat   edageOffset;
@property (nonatomic, strong) LimitePasteTextView *textView;
@property (nonatomic, strong) NSString *string;

- (void)becomeFirstResponder;

@end
