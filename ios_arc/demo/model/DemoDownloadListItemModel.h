//
//  DemoDownloadListItemModel.h
//  ios_arc
//
//  Created by lala on 2019/2/21.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,DOWNLOAD_STATUS) {
    STATUS_NORMAL=0,
    STATUS_STOP=1,
    STATUS_ERROR=2,
    STATUS_FINISH=3
};

@interface DemoDownloadListItemModel : NSObject

@property(nonatomic) int32_t id;
@property(nonatomic) NSString *name;
@property(nonatomic) NSString *icon;
@property(nonatomic) NSString *url;
@property(nonatomic) int32_t size;
@property(nonatomic) NSString *progress;
@property(nonatomic) DOWNLOAD_STATUS status;

//-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
