//
//  DemoViewController.m
//  LimitationTextViewDemo
//
//  Created by FFF on 13-12-19.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "DemoViewController.h"
#import "NTLimitationInputView.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NTLimitationInputView *inputView = [[NTLimitationInputView alloc] initWithFrame:(CGRect){
        .origin.x = 20,
        .origin.y = 20,
        .size.width  = 320 - 40,
        .size.height = 300
    }];
    inputView.maxLength = 100;

    [self.view addSubview:inputView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
