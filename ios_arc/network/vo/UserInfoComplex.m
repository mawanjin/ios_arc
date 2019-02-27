//
//  UserInfoComplex.m
//  ios_arc
//
//  Created by lala on 2019/2/27.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "UserInfoComplex.h"

@implementation UserInfoComplex

-(id)init{
    if(self=[super init]){
        [UserInfoComplex mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"toys":@"Toy"
                     };
        }];
    }
    return self;
}

@end
