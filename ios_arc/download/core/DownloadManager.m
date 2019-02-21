//
//  DownloadManager.m
//  ios_arc
//
//  Created by lala on 2019/2/21.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "DownloadManager.h"

@implementation DownloadManager

static DownloadManager *sharedManager = nil;

+(DownloadManager*)sharedManager{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

-(void)start:(NSInteger *)op_type op_model:(DemoDownloadListItemModel *)model :(void(^)(bool rs))opResult{
    //todo goto download
    //return result
    
    if(opResult){
        opResult(NO);
    }
    
}

@end
