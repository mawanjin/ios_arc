//
//  DemoDownloadListItemModel.m
//  ios_arc
//
//  Created by lala on 2019/2/21.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "DemoDownloadListItemModel.h"

@implementation DemoDownloadListItemModel

-(instancetype)init{
    if(self=[super init]){
        _status = STATUS_NORMAL;
    }
    return self;
}

@end
