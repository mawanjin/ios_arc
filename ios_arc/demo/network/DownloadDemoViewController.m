//
//  DownloadDemoViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/20.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "DownloadDemoViewController.h"
#import "DemoMTableViewCell.h"
#import "DownloadManager.h"
#import "QTEventBus.h"

@interface DownloadDemoViewController ()

@end

@implementation DownloadDemoViewController

- (void)initListItem{
    DemoDownloadListItemModel *model = [[DemoDownloadListItemModel alloc] init];
    model.id = 1;
    model.icon = @"Algeria.png";
    model.name = @"file1";
    model.url = @"https://www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super";
    [self.listItems addObject:model];
    DemoDownloadListItemModel *model2 = [[DemoDownloadListItemModel alloc] init];
    model2.id = 2;
    model2.icon = @"Argentina.png";
    model2.name = @"file2";
    model2.url = @"https://www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super";
    [self.listItems addObject:model2];
    DemoDownloadListItemModel *model3 = [[DemoDownloadListItemModel alloc] init];
    model3.id = 3;
    model3.icon = @"Australia.png";
    model3.name = @"file3";
    model3.url = @"https://www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super";
    [self.listItems addObject:model3];
    DemoDownloadListItemModel *model4 = [[DemoDownloadListItemModel alloc] init];
    model4.id = 4;
    model4.icon = @"Honduras.png";
    model4.name = @"file4";
    model4.url = @"https://www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super";
    [self.listItems addObject:model4];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"下载哟";
    
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"team" ofType:@"plist"];
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:path];
    self.listItems = [[NSMutableArray alloc] init];
    //init items
    [self initListItem];
    
    
    [QTSub(self, DownloadStartEvent) next:^(DownloadStartEvent *event) {
        
        for(DemoDownloadListItemModel *i in self.listItems){
            if(i.id == event.id){
                i.status = event.status;
                [self.mTableView reloadData];
            }
        }
        
    }];
    
    [QTSub(self, DownloadProgressEvent) next:^(DownloadProgressEvent *event) {
        int count = 0;
        for(DemoDownloadListItemModel *i in self.listItems){
            if(i.id == event.id){
                i.progress = event.progress;
            }else
                count++;
        }
        //局部刷新
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:count inSection:0];
        
        [self.mTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
//        [self.mTableView reloadData];
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    DemoMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSUInteger row = [indexPath row];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //fill data
    DemoDownloadListItemModel *item = [self.listItems objectAtIndex:row];
    cell.mLabel.text = item.name;
    cell.mImage.image = [UIImage imageNamed:item.icon];
    if(item.progress){
        cell.lb_progress.text = item.progress;
    }
    
    if(item.status == DOWNLOAD_STATUS_FINISH){
        [cell.btnOP setTitle:@"已完成" forState:UIControlStateNormal];
    }
    
    //event
    cell.btnOpBlock = ^{
        
        switch (item.status) {
            case STATUS_NORMAL:
                [[DownloadManager sharedManager] start:0 op_model:item :^(bool rs) {
                    if(rs){
                        NSLog(@"good");
                    }else{
                        NSLog(@"good2");
                    }
                }];
                break;
            default:
                break;
        }
        
        
    };
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listItems.count;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        completionHandler(YES);
        //todo delete logic
        [self.mTableView reloadData];
    }];
    
    deleteRowAction.backgroundColor = [UIColor redColor];
    
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction]];
    return config;
}

- (IBAction)addTaskToList:(id)sender {
    NSLog(@"method addTaskToList() called.");
    DemoDownloadListItemModel *model = [[DemoDownloadListItemModel alloc] init];
    model.name = self.tf_name.text;
    model.url = self.tf_url.text;
    model.icon = @"Serbia.png";
    [self.listItems insertObject:model atIndex:0];
    [self.mTableView reloadData];
}


@end
