//
//  ImageDemoViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/25.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "ImageDemoViewController.h"

@interface ImageDemoViewController ()

@end

@implementation ImageDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.items = [[NSMutableArray alloc] init];
    
    ImageListItemModel *item1 = [[ImageListItemModel alloc] initWithNameUrl:@"img1" Url:@"https://gss0.bdstatic.com/5bVWsj_p_tVS5dKfpU_Y_D3/res/r/image/2017-09-27/297f5edb1e984613083a2d3cc0c5bb36.png"];
    [self.items addObject:item1];
    
    ImageListItemModel *item2 = [[ImageListItemModel alloc] initWithNameUrl:@"img2" Url:@"https://gss0.bdstatic.com/5bVWsj_p_tVS5dKfpU_Y_D3/res/r/image/2017-09-26/352f1d243122cf52462a2e6cdcb5ed6d.png"];
    [self.items addObject:item2];
    
    ImageListItemModel *item3 = [[ImageListItemModel alloc] initWithNameUrl:@"img3" Url:@"http://ctimg2018.5fun.com/upload/images/5d/90/5d90a425bf686677c71cd3c71f313fa2.png"];
    [self.items addObject:item3];
    
    ImageListItemModel *item4 = [[ImageListItemModel alloc] initWithNameUrl:@"img4" Url:@"http://ctimg2018.5fun.com//upload//images//d6//7e//d67e9159557d3a027289c684c04db9df.png"];
    [self.items addObject:item4];
    
    
    
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
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentify = @"CellIdentifier";
    
    ImageListItemModel *item = [self.items objectAtIndex:[indexPath row]];
    
    ImageListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    
    [cell.mImageView sd_setImageWithURL:[NSURL URLWithString:item.url] placeholderImage:[UIImage imageNamed:@"img_placeholder.png"]];
    
    return cell;
}

@end
