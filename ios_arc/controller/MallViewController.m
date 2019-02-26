//
//  MallViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/26.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "MallViewController.h"

@interface MallViewController ()

@end

@implementation MallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)goToXib:(id)sender {
    XibTestViewController *xibController = [[XibTestViewController alloc] init];
    [self.navigationController pushViewController:xibController animated:YES];
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
