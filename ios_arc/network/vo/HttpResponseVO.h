//
//  HttpResponseVO.h
//  ios_arc
//
//  Created by lala on 2019/2/27.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoVO.h"
NS_ASSUME_NONNULL_BEGIN

@interface HttpResponseVO : NSObject
@property (assign,nonatomic) int code;
@property (copy,nonatomic) NSString *message;
@end

NS_ASSUME_NONNULL_END
