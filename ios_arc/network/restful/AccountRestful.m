//
//  AccountRestful.m
//  ios_arc
//
//  Created by lala on 2019/2/27.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "AccountRestful.h"


@implementation AccountRestful

static AccountRestful *sharedRestful = nil;
+(AccountRestful*)sharedRestful{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedRestful = [[self alloc] init];
    });
    return sharedRestful;
}

-(void) getUserInfo:(NSString*)uid responseBlock:(void(^)(id result)) mBlock {
    [PPNetworkHelper setResponseSerializer:PPResponseSerializerHTTP];
    [PPNetworkHelper GET:[NSString stringWithFormat:@"%@/%@",DEFAULT_SERVER_URL,@"/userInfo"] parameters:nil success:^(id responseObject) {
        
        @try {
            NSString *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"=============请求结果：\n%@",jsonStr);
            UserInfoVO *info = [UserInfoVO mj_objectWithKeyValues:jsonStr];
            NSLog(@"info.name=%@",info.name);
            mBlock(info);
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        
    } failure:^(NSError *error) {
        //请求失败
        NSString *jsonStr = [NSString stringWithFormat:@"code=%ld,msg=%@",(long)[error code],[error localizedDescription]];
        
    }];
}

-(void) getUserInfo4Common:(NSString*)uid responseBlock:(void(^)(id result)) mBlock{
    [PPNetworkHelper setResponseSerializer:PPResponseSerializerHTTP];
    [PPNetworkHelper GET:[NSString stringWithFormat:@"%@/%@",DEFAULT_SERVER_URL,@"/userInfo4common"] parameters:nil success:^(id responseObject) {
        
        @try {
            NSString *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"=============请求结果：\n%@",jsonStr);
            UserInfoHttpResponseVO  *rs = [UserInfoHttpResponseVO mj_objectWithKeyValues:jsonStr];
            
            NSLog(@"rs.code=%i,message=%@",rs.code,rs.message);
            mBlock(rs);
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        
    } failure:^(NSError *error) {
        //请求失败
        NSString *jsonStr = [NSString stringWithFormat:@"code=%ld,msg=%@",(long)[error code],[error localizedDescription]];
        
    }];
}

-(void) getUserInfo4Complex:(NSString*)uid responseBlock:(void(^)(id result)) mBlock{
    
    [PPNetworkHelper setResponseSerializer:PPResponseSerializerHTTP];
    [PPNetworkHelper GET:[NSString stringWithFormat:@"%@/%@",DEFAULT_SERVER_URL,@"/userInfo4complex"] parameters:nil success:^(id responseObject) {
        
        @try {
            NSString *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"=============请求结果：\n%@",jsonStr);
            UserInfoComplexHttpResponseVO  *rs = [UserInfoComplexHttpResponseVO mj_objectWithKeyValues:jsonStr];
            NSLog(@"rs.code=%i,message=%@",rs.code,rs.message);
            mBlock(rs);
        } @catch (NSException *exception) {
            UserInfoComplexHttpResponseVO *rs = [UserInfoComplexHttpResponseVO new];
            rs.code = NETWORK_ERROR_SERVER_UNKOWN;
            mBlock(rs);
        }
        
    } failure:^(NSError *error) {
        //请求失败
        NSString *jsonStr = [NSString stringWithFormat:@"code=%ld,msg=%@",(long)[error code],[error localizedDescription]];
        NSLog(@"%@",jsonStr);
        UserInfoComplexHttpResponseVO *rs = [UserInfoComplexHttpResponseVO new];
        rs.code = NETWORK_ERROR_SERVER_UNKOWN;
        mBlock(rs);
    }];
}


@end
