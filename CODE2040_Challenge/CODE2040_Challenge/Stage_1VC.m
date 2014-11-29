//
//  Stage_1VC.m
//  CODE2040_Challenge
//
//  Created by PrinceSegs on 29/11/2014.
//  Copyright (c) 2014 SOG APPS. All rights reserved.
//

#import "Stage_1VC.h"



@implementation Stage_1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.userInput = @"Work plz";
    //NSLog(@"segun sege = %@", self.userInput);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)reverseString:(UIButton *)sender {
    
    self.userInput = self.myTextField.text;
    
    self.myReversedString.text = self.userInput;
    
    NSString *nameString = self.userInput;
    
    if ([nameString length] == 0) {
        
        nameString = @"World";
        
    }
    
    
    
    
    // Reversed String Code
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [nameString length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[nameString substringWithRange:subStrRange]];
    }
    NSLog(@"%@", reversedString);

    
    NSString *greeting = [[NSString alloc]
                          initWithFormat:@"%@", reversedString];
    
    self.myReversedString.text = greeting;
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.myTextField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}


 @end
