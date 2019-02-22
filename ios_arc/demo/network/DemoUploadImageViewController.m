//
//  DemoUploadImageViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/22.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "DemoUploadImageViewController.h"

@interface DemoUploadImageViewController ()

@end

@implementation DemoUploadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)addImage:(id)sender {
    NSLog(@"method addImage() called.");
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"提示" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
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
