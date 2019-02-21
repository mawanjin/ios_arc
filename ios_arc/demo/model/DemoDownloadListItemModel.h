//
//  DemoDownloadListItemModel.h
//  ios_arc
//
//  Created by lala on 2019/2/21.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoDownloadListItemModel : NSObject

@property(nonatomic) int32_t id;
@property(nonatomic) NSString *name;
@property(nonatomic) NSString *icon;
@property(nonatomic) NSString *url;
@property(nonatomic) int32_t size;
@property(nonatomic) int32_t status;

@end

NS_ASSUME_NONNULL_END
