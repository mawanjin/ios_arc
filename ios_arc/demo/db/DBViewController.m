//
//  DBViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/23.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "DBViewController.h"

@interface DBViewController ()

@end

@implementation DBViewController

NSMutableArray *items;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"数据库";
    self.navigationController.navigationBar.clipsToBounds = YES;
    items = [[DBManager sharedManager] queryTestData];
}
- (IBAction)addData:(id)sender {
    [[DBManager sharedManager] insertTestData];
    items = [[DBManager sharedManager] queryTestData];
    [self.mTableVIew reloadData];
}
- (IBAction)queryData:(id)sender {
    [[DBManager sharedManager] queryTestData];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[DBManager sharedManager] queryTestDataCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSInteger index = [indexPath row];
    NSString *name = [items objectAtIndex:index];
    cell.textLabel.text = name;
    
    return cell;
}

@end
