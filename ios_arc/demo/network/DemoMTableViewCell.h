//
//  DemoMTableViewCell.h
//  ios_arc
//
//  Created by lala on 2019/2/20.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoMTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mImage;
@property (weak, nonatomic) IBOutlet UILabel *mLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnOP;
@property (weak, nonatomic) IBOutlet UILabel *lb_progress;

@end

NS_ASSUME_NONNULL_END
