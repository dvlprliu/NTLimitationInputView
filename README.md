NTLimitationInputView
=====================

An input view that limit the length of input, just like weibo input view did.

---

Install
=====================
Draging or copying NTLimitationInputView.h and NTLimitationInputView.m into you project.

---

Usage
=====================

import NTLimitationInputView.h   


	  NTLimitationInputView *inputView = [[NTLimitationInputView alloc] initWithFrame:(CGRect){
        .origin.x = 20,
        .origin.y = 20,
        .size.width  = 320 - 40,
        .size.height = 300
    }];
    inputView.maxLength = 100;
    [self.view addSubview:inputView];
    
---

Require
=====================

* ARC