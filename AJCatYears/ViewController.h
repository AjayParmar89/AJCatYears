//
//  ViewController.h
//  AJCatYears
//
//  Created by Student P_08 on 05/10/16.
//  Copyright © 2016 Ajay Parmar. All rights reserved.
//
#define kHeightOfUIElement 40.0
#define KHorizontalPadding 20.0

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    UITextField *ageField;
    UIButton *buttonClear;
    UIButton *buttonAge;
    UILabel *outputLabel;
    CGFloat screenWidth;
    CGFloat screenHeight;
}


@end

