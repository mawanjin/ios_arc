//
//  DownloadDemoViewController.h
//  ios_arc
//
//  Created by lala on 2019/2/20.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "ViewController.h"
#import "DemoDownloadListItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DownloadDemoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *btnAddTask;
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet UITextField *tf_name;
@property (weak, nonatomic) IBOutlet UITextField *tf_url;


@property(nonatomic,strong) NSArray *listTeams;
@property(nonatomic,strong) NSMutableArray *listItems;

@end

NS_ASSUME_NONNULL_END
