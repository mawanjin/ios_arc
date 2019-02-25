//
//  ImageListItemModel.h
//  ios_arc
//
//  Created by lala on 2019/2/25.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageListItemModel : NSObject
@property(copy,nonatomic) NSString *name;
@property(copy,nonatomic) NSString *url;

-(id)initWithNameUrl:(NSString*)name Url:(NSString*)url;

@end

NS_ASSUME_NONNULL_END
