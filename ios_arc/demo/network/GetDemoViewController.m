//
//  GetDemoViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/20.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "GetDemoViewController.h"

@interface GetDemoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf_url;
@property (weak, nonatomic) IBOutlet UITextView *tv_result;

@end

@implementation GetDemoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)change_url:(id)sender {
    [_tf_url setText:@"http://t.weather.sojson.com/api/weather/city/101030100"];
}
- (IBAction)get4json:(id)sender {
    NSString *url = [_tf_url text];
    
    [PPNetworkHelper GET:url parameters:nil success:^(id responseObject) {
        NSLog(@"=============请求结果：\n%@",responseObject);
        
        NSData * data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jcString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        [self->_tv_result setText:jcString];
        
    } failure:^(NSError *error) {
        //请求失败
        NSString *jsonStr = [NSString stringWithFormat:@"code=%ld,msg=%@",(long)[error code],[error localizedDescription]];
        [self->_tv_result setText:jsonStr];
    }];
}

- (IBAction)get4plain:(id)sender {
    NSLog(@"method get4plain called.");
    
    NSString *url = [_tf_url text];
    
    [PPNetworkHelper setResponseSerializer:PPResponseSerializerHTTP];
    
    [PPNetworkHelper GET:url parameters:nil success:^(id responseObject) {
        
        NSString *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"=============请求结果：\n%@",jsonStr);
        [self->_tv_result setText:jsonStr];
        
    } failure:^(NSError *error) {
        //请求失败
        NSString *jsonStr = [NSString stringWithFormat:@"code=%ld,msg=%@",(long)[error code],[error localizedDescription]];
        [self->_tv_result setText:jsonStr];
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
