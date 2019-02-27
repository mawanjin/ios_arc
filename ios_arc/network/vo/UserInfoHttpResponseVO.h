//
//  UserInfoHttpResponseVO.h
//  ios_arc
//
//  Created by lala on 2019/2/27.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "HttpResponseVO.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoHttpResponseVO : HttpResponseVO
@property (strong,nonatomic) UserInfoVO *data;
@end

NS_ASSUME_NONNULL_END
