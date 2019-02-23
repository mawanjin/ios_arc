//
//  DemoUploadImageViewController.h
//  ios_arc
//
//  Created by lala on 2019/2/22.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "ViewController.h"
#import "PPNetWorkHelper.h"
#import "Global_Config.h"

NS_ASSUME_NONNULL_BEGIN

@interface DemoUploadImageViewController : ViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,strong) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *MImage;
@end

NS_ASSUME_NONNULL_END
