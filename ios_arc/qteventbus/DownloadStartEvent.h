//
//  DownloadStartEvent.h
//  ios_arc
//
//  Created by lala on 2019/2/22.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QTEventBus.h"

NS_ASSUME_NONNULL_BEGIN

@interface DownloadStartEvent : NSObject<QTEvent>
@property(assign,nonatomic) int id;
@property(assign,nonatomic) int status;
@end

NS_ASSUME_NONNULL_END
