//
//  UploadVC.m
//  PhotoMeta
//
//  Created by star-perfect on 9/20/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import "UploadVC.h"
#import "TitleView.h"
#import "AppDelegate.h"

@interface UploadVC () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    AppDelegate *delegate;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *gallery_btn;
@property (weak, nonatomic) IBOutlet UIButton *takePhoto;
@property (weak, nonatomic) IBOutlet UIButton *cancel_btn;
@property (weak, nonatomic) IBOutlet UIButton *next_btn;
@property (weak, nonatomic) IBOutlet UIImageView *photo_ImgView;

@end

@implementation UploadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    delegate = [[UIApplication sharedApplication] delegate];
    [self radinShape:self.gallery_btn];
    [self radinShape:self.takePhoto];
    
    _imageView.layer.borderWidth =0;
    _imageView.layer.cornerRadius = 10.0;
    _imageView.layer.masksToBounds = YES;
    _cancel_btn.layer.borderWidth =0;
    _cancel_btn.layer.cornerRadius = 15.0;
    _cancel_btn.layer.masksToBounds = YES;
    _cancel_btn.hidden = YES;
    _next_btn.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)backPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)takePhoto:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:nil];
}
- (IBAction)photoGallery:(id)sender
{
    _gallery_btn.hidden = YES;
    _takePhoto.hidden = YES;
    _imageView.hidden = NO;
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    
    //remove cancel button of imagePickerController
    UINavigationBar *bar = imagePickerController.navigationBar;
    [bar setHidden:YES];
    [self presentViewController:imagePickerController animated:YES completion:nil];
   
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    self.imageView.image = image;
    
    //save photo into delegate for uploading to server
    //NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    delegate.transferImage = self.imageView.image;
    
    if(delegate.transferImage ==nil)
    {
        NSLog(@"%@",@"failed");
    }
    else
    {
        NSLog(@"%@",@"Successfully");
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    _cancel_btn.hidden = NO;
    _next_btn.hidden = NO;
}

- (void) radinShape:(UIButton *) button
{
    button.layer.borderWidth =0;
    button.layer.cornerRadius = 25.0;
    button.layer.masksToBounds = YES;
}

- (IBAction)nextPressed:(id)sender
{
    TitleView *titleVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"titleView"];
    [self.navigationController pushViewController:titleVC animated:YES];
}
- (IBAction)removeBtn:(id)sender
{
    _imageView.image = nil;
    _gallery_btn.hidden = NO;
    _takePhoto.hidden = NO;
    _cancel_btn.hidden = YES;
    _next_btn.hidden = YES;
}


@end
