//
//  UserInfoComplex.h
//  ios_arc
//
//  Created by lala on 2019/2/27.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Toy.h"
#import "MJExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoComplex : NSObject
@property(assign,nonatomic) int id;
@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSMutableArray<Toy*> *toys;
@end

NS_ASSUME_NONNULL_END
