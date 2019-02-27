//
//  UserInfoComplexHttpResponseVO.h
//  ios_arc
//
//  Created by lala on 2019/2/27.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "HttpResponseVO.h"
#import "UserInfoComplex.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserInfoComplexHttpResponseVO : HttpResponseVO
@property(strong,nonatomic) UserInfoComplex *data;
@end

NS_ASSUME_NONNULL_END
