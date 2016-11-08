//
//  ViewController.m
//  AJCatYears
//
//  Created by Student P_08 on 05/10/16.
//  Copyright © 2016 Ajay Parmar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self calculateScreenHeightAndWidth];
    [self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
    [self addAgeFieldToTheScreen];
    buttonClear = [[UIButton alloc]init];
    [self addClearButton];
    [self addAgeButton];
    [self addOutputLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calculateScreenHeightAndWidth{
    screenWidth=[[UIScreen mainScreen]bounds].size.width;
    screenHeight=[[UIScreen mainScreen]bounds].size.height;
    
}

-(void)addAgeFieldToTheScreen{
    ageField = [[UITextField alloc]initWithFrame:CGRectMake(KHorizontalPadding, kHeightOfUIElement, screenWidth-3*(KHorizontalPadding)-kHeightOfUIElement, kHeightOfUIElement)];
    [ageField setBorderStyle:UITextBorderStyleRoundedRect];
    ageField.delegate = self;
    [ageField setPlaceholder:@"Enter Human Age"];
    [ageField setBackgroundColor:[UIColor cyanColor]];
    [ageField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:ageField];
}

-(void)addClearButton{
    buttonClear = [[UIButton alloc]initWithFrame:CGRectMake(screenWidth-60, 40, kHeightOfUIElement, kHeightOfUIElement)];
    buttonClear.layer.cornerRadius=kHeightOfUIElement/2;
    buttonClear.backgroundColor=[UIColor whiteColor];
    [buttonClear setTitle:@"X" forState:UIControlStateNormal];
    [buttonClear addTarget:self action:@selector(handleClear) forControlEvents:UIControlEventTouchUpInside];
    [buttonClear setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:buttonClear];
}

-(void)handleClear{
    ageField.text=@"";
}
-(void)addAgeButton{
    buttonAge = [[UIButton alloc]initWithFrame:CGRectMake(KHorizontalPadding, 100, screenWidth-40, kHeightOfUIElement)];
    buttonAge.backgroundColor=[UIColor whiteColor];
    [buttonAge setTitle:@"Calculate Age of Cat" forState:UIControlStateNormal];
    [buttonAge setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    buttonAge.layer.cornerRadius=buttonAge.bounds.size.height/8;
    [buttonAge addTarget:self action:@selector(buttonHandler) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAge];
}

-(void)buttonHandler{
    if (ageField.text.length>0) {
        int humanAge=ageField.text.intValue;
        if (humanAge>0 && humanAge<=125) {
            outputLabel.text =[ NSString stringWithFormat:@"Cat Years:%d",ageField.text.intValue/7];
        }
        else
        {
            outputLabel.text = [NSString stringWithFormat:@"Invalid Age"];
        }
    }
    else{
        outputLabel.text = [NSString stringWithFormat:@"Enter Age to Calculate Cat Years"];
    }
}

-(void)addOutputLabel{
    outputLabel = [[UILabel alloc]initWithFrame:CGRectMake(KHorizontalPadding, 160, screenWidth-40, kHeightOfUIElement)];
    outputLabel.backgroundColor = [UIColor clearColor];
    [outputLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:outputLabel];
}


@end
