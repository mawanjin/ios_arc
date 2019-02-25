//
//  MineViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/25.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- ( void )viewWillAppear:( BOOL )animated{
    self.tabBarController.tabBar.hidden =NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (IBAction)goToProfile:(id)sender {
    UIStoryboard *storboard = self.storyboard;
    MineProfileViewController *vc2 = [storboard instantiateViewControllerWithIdentifier:@"id_mineprofile"];
    [self.navigationController pushViewController:vc2 animated:YES];
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
