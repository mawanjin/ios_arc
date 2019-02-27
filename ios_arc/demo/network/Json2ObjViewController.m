//
//  Json2ObjViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/27.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "Json2ObjViewController.h"

@interface Json2ObjViewController ()

@end

@implementation Json2ObjViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btnSimpleClicked:(id)sender {
    [[AccountRestful sharedRestful] getUserInfo:@"1" responseBlock:^(id  _Nonnull result) {
        if(result!=nil){
            UserInfoVO *info =result;
            NSLog(@"response result=%@,",info.name);
        }
    }];
}
- (IBAction)btnResponse4Common:(id)sender {
    [[AccountRestful sharedRestful] getUserInfo4Common:@"1" responseBlock:^(id  _Nonnull result) {
        if(result!=nil){
            UserInfoHttpResponseVO *rs =result;
        
            NSLog(@"response result=%@,name=%@",rs.message,rs.data.name);
        }
    }];
}
- (IBAction)btnComplexClicked:(id)sender {
    [[AccountRestful sharedRestful] getUserInfo4Complex:@"1" responseBlock:^(id  _Nonnull result) {
        if(result!=nil){
            UserInfoComplexHttpResponseVO *rs =result;
            
            NSLog(@"response result=%@,name=%@,toys.size=%lu",rs.message,rs.data.name,(unsigned long)rs.data.toys.count);
            
            for (Toy *toy in rs.data.toys) {
                NSLog(@"toy is %@",toy.name);
            }
            
        }
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
