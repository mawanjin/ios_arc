//
//  DBManager.h
//  ios_arc
//
//  Created by lala on 2019/2/23.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileUtil.h"
#import "FMDB.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBManager : NSObject



+(DBManager*)sharedManager;

-(void)createMainTable;
-(void)insertTestData;
-(void)queryTestData;

@end

NS_ASSUME_NONNULL_END
