//
//  IntroductionViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/26.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "IntroductionViewController.h"

@interface IntroductionViewController ()

@end

@implementation IntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.mScrollView.delegate = self;
    CGFloat screenWidth = self.view.frame.size.width;
    self.mScrollView.contentSize = CGSizeMake(screenWidth*3,0);
    self.mScrollView.frame = self.view.frame;
    
    UIStoryboard *mainStoryboard = self.storyboard;
    
    UIViewController *page1ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"intro1"];
    self.page1 = page1ViewController.view;
    self.page1.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    
    UIViewController *page2ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"intro2"];
    self.page2 = page2ViewController.view;
    self.page2.frame = CGRectMake(self.view.frame.size.width, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    
    UIViewController *page3ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"intro3"];
    self.page3 = page3ViewController.view;
    self.page3.frame = CGRectMake(self.view.frame.size.width*2, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    
    UIButton *btnEnter = [[UIButton alloc] init];
    [btnEnter setTitle:@"进入新世界" forState:UIControlStateNormal];
    [btnEnter setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [btnEnter setTitleColor:UIColor.grayColor forState:UIControlStateHighlighted];
    [self.page3 addSubview:btnEnter];
    
    [btnEnter addTarget:self action:@selector(btnEnterClick) forControlEvents:UIControlEventTouchUpInside];
    
    btnEnter.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.page3 addConstraint:[NSLayoutConstraint constraintWithItem:btnEnter attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.page3 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-60]];

//    [self.page3 addConstraint:[NSLayoutConstraint constraintWithItem:btnEnter attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.page3 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.page3 addConstraint:[NSLayoutConstraint constraintWithItem:btnEnter attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.page3 attribute:NSLayoutAttributeRight multiplier:1.0 constant:20]];
    
    
    [self.page3 addConstraint:[NSLayoutConstraint constraintWithItem:btnEnter attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.page3 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];

    [self.mScrollView addSubview:self.page1];
    [self.mScrollView addSubview:self.page2];
    [self.mScrollView addSubview:self.page3];
    [self.mScrollView setBounces:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    self.mPageControl.currentPage = offset.x / self.view.frame.size.width;
}

-(void)btnEnterClick{
    NSLog(@"method btnEnterClick() called.");
    TabBarViewController *tabMainController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarViewController"];
    
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.6];
    [animation setType:kCATransitionMoveIn];
    [animation setSubtype:kCATransitionFade];
    [[[[UIApplication sharedApplication] keyWindow] layer] addAnimation:animation forKey:nil];
    
    
    [self presentViewController:tabMainController animated:NO
                     completion:NULL];
    
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
