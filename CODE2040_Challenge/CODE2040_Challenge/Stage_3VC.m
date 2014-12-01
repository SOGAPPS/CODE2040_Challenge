//
//  Stage_3VC.m
//  CODE2040_Challenge
//
//  Created by PrinceSegs on 01/12/2014.
//  Copyright (c) 2014 SOG APPS. All rights reserved.
//

#import "Stage_3VC.h"

@interface Stage_3VC ()

@end

@implementation Stage_3VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self prefix];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prefix{
    
    // Get prefix
    
    
    NSError* errorJson = nil;
    NSDictionary* jsonDict = @{@"token" : @"hKYs6KjVwf"};
    NSData* postData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&errorJson];
    
    
    NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];
    
    
    //URL
    
    NSURL *url = [NSURL URLWithString:@"http://challenge.code2040.org/api/prefix"];
    
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
    
    NSLog(@"Get String: %@", requestReply);
    
    // initialString
    NSData *data = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSString *value = [json objectForKey:@"result"];
    NSString *value2 = [value valueForKey:@"prefix"];
    NSString *value3 = [value valueForKey:@"array"];
    NSArray *value3Array = @[value3];
    NSArray *value2Array = @[value2];
    
    
    NSArray *arr = [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"299-1-1", nil],[NSArray arrayWithObjects:@"399-1-1", nil],[NSArray arrayWithObjects:@"499-1-1", nil], nil];
    
    NSString *search = @"299";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ALL SELF contains[cd] %@", value2];
    NSArray* array = [value3Array filteredArrayUsingPredicate: predicate];
    //NSLog(@"result: %@", array);
    
  
    NSLog(@"prefix: %@",value2);
    NSLog(@"Array: %@",value3Array);
    NSLog(@"filteredArray: %@",array);
    
    
    
    //[self validatePrefix:array];
    
}

-(void)validatePrefix: (NSArray *)newArray{
    // Get Prefix
    
    
    NSError* errorJson = nil;
    NSDictionary* jsonDict = @{@"token" : @"hKYs6KjVwf" , @"array" : newArray};
    NSData* postData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&errorJson];
    
    
    NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];
    
    
    //URL
    
    NSURL *url = [NSURL URLWithString:@"http://challenge.code2040.org/api/validateprefix"];
    
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
    
    NSLog(@"Validate Prefix: %@", requestReply);
    
}

@end
