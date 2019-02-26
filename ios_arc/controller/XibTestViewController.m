//
//  XibTestViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/26.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "XibTestViewController.h"

@interface XibTestViewController ()

@end

@implementation XibTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
- (IBAction)onBtnClicked:(id)sender {
    NSLog(@"method onBtnClicked called.");
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
