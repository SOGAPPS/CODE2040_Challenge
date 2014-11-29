//
//  Stage_1VC.h
//  CODE2040_Challenge
//
//  Created by PrinceSegs on 29/11/2014.
//  Copyright (c) 2014 SOG APPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Stage_1VC : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic)  NSString *userInput;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UITextField *myReversedString;

- (IBAction)reverseString:(UIButton *)sender;

@end

