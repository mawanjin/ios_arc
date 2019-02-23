//
//  DemoUploadImageViewController.m
//  ios_arc
//
//  Created by lala on 2019/2/22.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "DemoUploadImageViewController.h"

@interface DemoUploadImageViewController ()

@end

@implementation DemoUploadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)addImage:(id)sender {
    NSLog(@"method addImage() called.");
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"请选择图片来源" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:self.imagePicker animated:YES completion:nil];
        }
        
    }];
    
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
        
        
    }];
    
    UIAlertAction *destruction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [actionSheet addAction:okAction];
    [actionSheet addAction:albumAction];
    [actionSheet addAction:destruction];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info{
    NSLog(@"method didFinishPickingMediaWithInfo() called.");
    [self.imagePicker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.MImage.image = image;
    NSArray<UIImage *> *images = [[NSArray alloc] initWithObjects:image, nil];
    NSArray<NSString*> *ImageNames =[[NSArray alloc] initWithObjects:@"file1", nil];
    
    [PPNetworkHelper uploadImagesWithURL:DEFAULT_SERVER_URL parameters:nil name:@"fileList" images:images fileNames:ImageNames imageScale:1 imageType:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        NSLog(@"upload success.");
        
    } failure:^(NSError *error) {
        NSLog(@"upload error.");
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

@end
