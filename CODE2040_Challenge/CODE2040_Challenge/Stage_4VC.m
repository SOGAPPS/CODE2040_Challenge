//
//  Stage_4VC.m
//  CODE2040_Challenge
//
//  Created by PrinceSegs on 01/12/2014.
//  Copyright (c) 2014 SOG APPS. All rights reserved.
//

#import "Stage_4VC.h"

@interface Stage_4VC ()

@end

@implementation Stage_4VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self time];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)time{
    
    // Get time
    
    
    NSError* errorJson = nil;
    NSDictionary* jsonDict = @{@"token" : @"hKYs6KjVwf"};
    NSData* postData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&errorJson];
    
    
    NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];
    
    
    //URL
    
    NSURL *url = [NSURL URLWithString:@"http://challenge.code2040.org/api/time"];
    
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
    NSString *value2 = [value valueForKey:@"datestamp"];
    NSString *value3 = [value valueForKey:@"interval"];
    //NSArray *value3Array = @[value3];
    
    NSString *timeNow = @"2008-12-29T00:27:42GMT-08:00";
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *myDate = [dateFormatter dateFromString:value2];
    
    //NSString *timeInt = [NSString stringWithFormat: @"%ld", (long)value3];

    NSLog(@"DATE FORMAT:%@", myDate);
    
    NSDateFormatter *anotherDateFormatter = [[NSDateFormatter alloc] init];
    [anotherDateFormatter setDateStyle:NSDateFormatterLongStyle];
    [anotherDateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSLog(@"%@", [anotherDateFormatter stringFromDate:myDate]);
    
    

    NSLog(@"datestamp: %@",value2);
    NSLog(@"interval: %@",value3);
    //NSLog(@"filteredArray: %@",array);
    
    
    
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
