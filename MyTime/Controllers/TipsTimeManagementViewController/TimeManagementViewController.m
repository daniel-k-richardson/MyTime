//
//  TimeManagementViewController.m
//  MyTime
//
//  Created by DanDaMan on 23/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import "TimeManagementViewController.h"

@interface TimeManagementViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation TimeManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = @"http://timeman.com/time-management-tips/time-management-tips-for-students";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
