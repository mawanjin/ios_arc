//
//  DownloadDemoViewController.h
//  ios_arc
//
//  Created by lala on 2019/2/20.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DownloadDemoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSArray *listTeams;

@end

NS_ASSUME_NONNULL_END
