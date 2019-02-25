//
//  ImageDemoViewController.h
//  ios_arc
//
//  Created by lala on 2019/2/25.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageListItemModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageListTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageDemoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property NSMutableArray<ImageListItemModel*> *items;

@end

NS_ASSUME_NONNULL_END
