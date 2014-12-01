//
//  Stage_1VC.h
//  CODE2040_Challenge
//
//  Created by PrinceSegs on 29/11/2014.
//  Copyright (c) 2014 SOG APPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CFNetwork/CFNetwork.h>



@interface Stage_1VC : UIViewController <UITextFieldDelegate> 


@property (strong, nonatomic) NSString *initialString;
@property (strong, nonatomic) NSString *reversedString;



@property (weak, nonatomic)  NSString *userInput;
@property (strong, nonatomic) NSString *initialToken;
@property (strong, nonatomic) NSDictionary *savedToken;


@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UITextField *myReversedString;
@property (weak, nonatomic) IBOutlet UILabel *tokenLabel;

- (IBAction)reverseStringButton:(UIButton *)sender;

- (id)jsonPostRequest:(NSData *)jsonRequestData;



@end

