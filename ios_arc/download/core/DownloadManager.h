//
//  DownloadManager.h
//  ios_arc
//
//  Created by lala on 2019/2/21.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoDownloadListItemModel.h"
#import "DOwnloadStartEvent.h"
#import "DownloadStatus.h"
#import "DownloadProgressEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface DownloadManager : NSObject

+(DownloadManager*)sharedManager;

-(void)start:(int)op_type op_model:(DemoDownloadListItemModel *)model :(void(^)(bool rs))opResult;

@end

NS_ASSUME_NONNULL_END
