//
//  IntroductionViewController.h
//  ios_arc
//
//  Created by lala on 2019/2/26.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface IntroductionViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *mPageControl;

@property (strong,nonatomic) UIView *page1;
@property (strong,nonatomic) UIView *page2;
@property (strong,nonatomic) UIView *page3;

@end

NS_ASSUME_NONNULL_END
