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
    
    //[self Registeration];
    [self getString];
    //[self validateString];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)Registeration{
    // Registeration
    
    _savedToken = @{@"result":@"hKYs6KjVwf"};
    
    if (![_savedToken  isEqual: _initialToken] ) {
        
        
        NSError* errorJson = nil;
        NSDictionary* jsonDict = @{@"email" : @"michaeladesegun@gmail.com" , @"github" : @"http://github.com/SOGAPPS/CODE2040_Challenge"};
        NSData* postData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&errorJson];
        
        
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
        
        
        //NSLog(@"requestReply: %@", requestReply);
        
        // Token Receieved
        NSData *data = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSString *value = [json objectForKey:@"result"];
        NSLog(@"Token: %@",value);
        
        self.tokenLabel.text = [NSString stringWithFormat:@"Token: %@", value];
        
        _initialToken = value;
    }
    
}

-(void)getString{
    // Get String
        
        
        NSError* errorJson = nil;
        NSDictionary* jsonDict = @{@"token" : @"hKYs6KjVwf"};
        NSData* postData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&errorJson];
        
        
        NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];
        
        
        //URL
        
        NSURL *url = [NSURL URLWithString:@"http://challenge.code2040.org/api/getstring"];
        
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
        
        //NSLog(@"Get String: %@", requestReply);
    
    // initialString
    NSData *data = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSString *value = [json objectForKey:@"result"];
    NSLog(@"Initial String: %@",value);
    
    _initialString = value;
    
    [self reverseString:value];
    
}


-(void)reverseString: (NSString *)initialValue{
    
    NSString *nameString2 = initialValue;
    NSLog(@"Initia String = %@", nameString2);
    
    
    // Reversed String Code
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [nameString2 length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[nameString2 substringWithRange:subStrRange]];
    }
    
    self.myReversedString.text = reversedString;
    self.reversedString = reversedString;
    
    NSLog(@"Reversed String = %@", reversedString);
    
    [self validateString:reversedString];
    
}

-(void)validateString: (NSString *)reversedString{
    // Get String
    
    
    NSError* errorJson = nil;
    NSDictionary* jsonDict = @{@"token" : @"hKYs6KjVwf" , @"string" : reversedString};
    NSData* postData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&errorJson];
    
    
    NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];
    
    
    //URL
    
    NSURL *url = [NSURL URLWithString:@"http://challenge.code2040.org/api/validatestring"];
    
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
    
    NSLog(@"Validate String: %@", requestReply);
    
}



- (IBAction)reverseStringButton:(UIButton *)sender {
    
    self.userInput = self.myTextField.text;
    
    self.myReversedString.text = self.userInput;
    
    NSString *nameString = self.userInput;
    
    if ([nameString length] == 0) {
        
        nameString = @"Hello";
        
    }
}





- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.myTextField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}



 @end
