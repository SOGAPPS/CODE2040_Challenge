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
    
    // Registeration 
    
    _savedToken = @{@"result":@"hKYs6KjVwf"};
    
    if ([_savedToken  isEqual: _initialToken] ) {
        
    
    NSError* errorJson = nil;
    NSDictionary* jsonDict = @{@"email" : @"michaeladesegun@gmail.com" , @"github" : @"http://github.com/SOGAPPS/CODE2040_Challenge"};
    NSData* postData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&errorJson];
    
    /*
    //We begin by creating our POST's body as an NSString, and converting it to NSData.
    
    //NSString *post = @"{\"email\":\"michaeladesegun@gmail.com\",\"github\":\"https://github.com/SOGAPPS/CODE2040_Challenge\"}";
    
    
    //NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    

    //Next up, we read the postData's length, so we can pass it along in the request.
     */
    
    NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];
    
    
    //URL
    
    NSURL *url = [NSURL URLWithString:@"http://challenge.code2040.org/api/register/"];
    
    //Now we have what we'd like to post. We can create an NSMutableURLRequest, and include our postData.
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    

    
    //And finally, we can send our request, and read the reply:
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    
    
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    
    NSLog(@"requestReply: %@", requestReply);
    self.tokenLabel.text = [NSString stringWithFormat:@"Token: %@", requestReply];
        
        _initialToken = requestReply;

    }
    
    
    /*
   // Request Reply in NSDictionary

    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:requestHandler
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray* latestLoans = [json objectForKey:@"loans"];
    
    NSLog(@"loans: %@", latestLoans);
    */
    /*
    //NSData *jsonData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *json2 = [NSJSONSerialization JSONObjectWithData:requestHandler options:0 error:&error];
    NSDictionary *response = [json2 objectAtIndex:0];
    NSString *email = [response objectForKey:@"email"];
    NSString *github = [response objectForKey:@"github"];
*/
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
