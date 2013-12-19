//
//  LimitationTextView.h
//  LimitationTextViewDemo
//
//  Created by FFF on 13-12-19.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTLimitationInputView : UIView

@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, strong) UITextView *textView;

@end
