//
//  DownloadProgressEvent.h
//  ios_arc
//
//  Created by lala on 2019/2/22.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QTEventBus.h"

NS_ASSUME_NONNULL_BEGIN

@interface DownloadProgressEvent : NSObject<QTEvent>
@property(assign,nonatomic) int id;
@property(copy,nonatomic) NSString *progress;
@end

NS_ASSUME_NONNULL_END
