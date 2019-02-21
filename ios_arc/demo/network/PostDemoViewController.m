//
//  PostDemoViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/20.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "PostDemoViewController.h"

@interface PostDemoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf_url;
@property (weak, nonatomic) IBOutlet UITextView *tv_result;

@end

@implementation PostDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)postByKeyMap:(id)sender {
    
    NSString *url = [_tf_url text];
    
    [PPNetworkHelper setResponseSerializer:PPResponseSerializerHTTP];
    [PPNetworkHelper POST:url parameters:@{@"name":@"小明",@"age":@16} success:^(id responseObject) {
        NSString *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"=============请求结果：\n%@",jsonStr);
        [self->_tv_result setText:jsonStr];
        
    } failure:^(NSError *error) {
        NSString *str = [NSString stringWithFormat:@"code=%ld,msg=%@",(long)[error code],[error localizedDescription]];
        [self->_tv_result setText:str];
    }];
}

- (IBAction)postByJsonBody:(id)sender {
    NSLog(@"method postByJsonBody called.");
    NSString *url = [_tf_url text];
    [PPNetworkHelper setRequestSerializer:PPRequestSerializerJSON];
    [PPNetworkHelper setResponseSerializer:PPResponseSerializerHTTP];
    
    NSDictionary *json_param = @{@"name":@"laya",@"age":@12};
    @try {
        [PPNetworkHelper POST:url parameters:json_param success:^(id responseObject) {
            NSString *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"=============请求结果：\n%@",jsonStr);
            [self->_tv_result setText:jsonStr];
            
        } failure:^(NSError *error) {
            NSString *str = [NSString stringWithFormat:@"code=%ld,msg=%@",(long)[error code],[error localizedDescription]];
            [self->_tv_result setText:str];
        }];
    } @catch (NSException *exception) {
        [self->_tv_result setText:@"url 是不是错了"];
    }
    
}


-(NSString *)toJSONString:(NSDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *str = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    str = [NSString stringWithFormat:@"%@",str];
    return str;
}
- (IBAction)changeurl:(id)sender {
    [self->_tf_url setText:@"http://127.0.0.1:8080/mgreat_rest/rest/test/postj"];
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
