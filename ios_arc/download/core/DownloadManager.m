//
//  DownloadManager.m
//  ios_arc
//
//  Created by lala on 2019/2/21.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "DownloadManager.h"
#import "PPNetworkHelper.h"
#import "FileUtil.h"

@implementation DownloadManager

static DownloadManager *sharedManager = nil;
static NSString *downloadPath;

+(DownloadManager*)sharedManager{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedManager = [[self alloc] init];
        downloadPath = [[FileUtil cachesDirectoryPath] stringByAppendingString:@"/Download"];
        BOOL isDir = NO;
        BOOL existed = [[NSFileManager defaultManager] fileExistsAtPath:downloadPath isDirectory:&isDir];
        if(!(isDir == YES && existed == YES)){
            [[NSFileManager defaultManager] createDirectoryAtPath:downloadPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    });
    return sharedManager;
}

-(void)start:(int)op_type op_model:(DemoDownloadListItemModel *)model :(void(^)(bool rs))opResult{
    //todo goto download
    NSLog(@"method start called.opType=%i",op_type);
    
    NSURLSessionTask *task = [PPNetworkHelper downloadWithURL:model.url fileDir:downloadPath progress:^(NSProgress *progress) {
        //下载进度,如果要配合UI进度条显示,必须在主线程更新UI
        NSLog(@"下载进度:%.2f%%",100.0 * progress.completedUnitCount/progress.totalUnitCount);
        DownloadProgressEvent *event = [[DownloadProgressEvent alloc] init];
        
        [event setId:model.id];
        NSString *pstr = [NSString stringWithFormat:@"下载进度:%.2f%%",100.0 * progress.completedUnitCount/progress.totalUnitCount];
        event.progress = pstr;
        
        [[QTEventBus shared] dispatch:event];
        
    } success:^(NSString *filePath) {
        //下载成功
        DownloadStartEvent *event = [[DownloadStartEvent alloc] init];
        [event setId:model.id];
        [event setStatus:DOWNLOAD_STATUS_FINISH];
        [[QTEventBus shared] dispatch:event];
        
    } failure:^(NSError *error) {
        //下载失败
    }];
    
    
    
    if(opResult){
        opResult(NO);
    }
    
}

@end
