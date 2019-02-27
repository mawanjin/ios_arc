//
//  AccountRestful.h
//  ios_arc
//
//  Created by lala on 2019/2/27.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPNetWorkHelper.h"
#import "Global_Config.h"
#import "MJExtension.h"
#import "UserInfoVO.h"
#import "UserInfoHttpResponseVO.h"
#import "UserInfoComplexHttpResponseVO.h"

NS_ASSUME_NONNULL_BEGIN

@interface AccountRestful : NSObject
+(AccountRestful*)sharedRestful;

-(void) getUserInfo:(NSString*)uid responseBlock:(void(^)(id result)) mBlock;

-(void) getUserInfo4Common:(NSString*)uid responseBlock:(void(^)(id result)) mBlock;

-(void) getUserInfo4Complex:(NSString*)uid responseBlock:(void(^)(id result)) mBlock;

@end

NS_ASSUME_NONNULL_END
