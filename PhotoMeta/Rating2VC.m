//
//  Rating2VC.m
//  PhotoMeta
//
//  Created by star-perfect on 9/22/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import "Rating2VC.h"
#import "AppDelegate.h"
#import "Apimanager.h"
#import "BaseroutAPI.h"
#import "UploadVC.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>

@interface Rating2VC ()
{
    AppDelegate *delegate;
    Apimanager *apimanager;
    int flag;
}
@property (weak, nonatomic) IBOutlet UIButton *previous_btn;
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *midImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightImg;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UIView *permissionView;
@property (weak, nonatomic) IBOutlet UIImageView *point1_1_img;
@property (weak, nonatomic) IBOutlet UIImageView *point1_2_img;
@property (weak, nonatomic) IBOutlet UIImageView *point1_3_img;
@property (weak, nonatomic) IBOutlet UIImageView *point1_4_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_1_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_2_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_3_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_4_img;

@end

@implementation Rating2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    delegate = [[UIApplication sharedApplication] delegate];
    flag = 0;
    _alertView.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _submitBtn.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    [self radianShape];
    _permissionView.layer.borderWidth =0;
    _permissionView.layer.cornerRadius = 8.0;
    _permissionView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)leftbtnPressed:(id)sender
{
    _leftImg.hidden = NO;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _submitBtn.hidden = NO;
    flag = 1;
}
- (IBAction)midbtnPressed:(id)sender
{
    _leftImg.hidden = YES;
    _midImg.hidden = NO;
    _rightImg.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _submitBtn.hidden = NO;
    flag = 2;
}
- (IBAction)rightbtnPressed:(id)sender
{
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = NO;
    _point1_1_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _submitBtn.hidden = NO;
    flag = 3;
}
- (IBAction)_1btnPressed:(id)sender
{
    _point1_1_img.hidden = NO;
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _submitBtn.hidden = YES;
}
- (IBAction)_2btnPressed:(id)sender
{
    _point1_2_img.hidden = NO;
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
     _submitBtn.hidden = YES;
}
- (IBAction)_3btnPressed:(id)sender
{
    _point1_3_img.hidden = NO;
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
     _submitBtn.hidden = YES;
}
- (IBAction)_4btnPressed:(id)sender
{
    _point1_4_img.hidden = NO;
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
     _submitBtn.hidden = YES;
}
- (IBAction)mid1btnPressed:(id)sender
{
    _point2_1_img.hidden = NO;
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
     _submitBtn.hidden = YES;
}
- (IBAction)mid2btnPressed:(id)sender
{
    _point2_2_img.hidden = NO;
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
     _submitBtn.hidden = YES;
}
- (IBAction)mid3btnPressed:(id)sender
{
    _point2_3_img.hidden = NO;
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point2_4_img.hidden = YES;
     _submitBtn.hidden = YES;

}
- (IBAction)mid4btnPressed:(id)sender
{
    _point2_4_img.hidden = NO;
    _leftImg.hidden = YES;
    _midImg.hidden = YES;
    _rightImg.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point1_1_img.hidden = YES;
     _submitBtn.hidden = YES;
}

- (IBAction)previousbtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)submitPressed:(id)sender
{
    //save feel string into delegate for uploading to server
    switch (flag) {
        case 1:
        {
            delegate.transferRating2 = @"LESS";
            NSLog(@"%@",delegate.transferRating2);
        }break;
        case 2:
        {
            delegate.transferRating2 = @"SAME";
            NSLog(@"%@",delegate.transferRating2);
        }break;
        case 3:
        {
            delegate.transferRating2 = @"MORE";
            NSLog(@"%@",delegate.transferRating2);
        }break;
        default:
            break;
    }
    
    _alertView.hidden = NO;

}

-(void)radianShape
{
    _submitBtn.layer.borderWidth =0;
    _submitBtn.layer.cornerRadius = 23.0;
    _submitBtn.layer.masksToBounds = YES;
}
- (IBAction)alertOKPressed:(id)sender
{
    
      //Upload Photo using AFNetworking 3.0
  
//    [SVProgressHUD showWithStatus:@"Uploading photo..."];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    
//    NSData *imageData = UIImageJPEGRepresentation(delegate.transferImage, 0.5);
//    
//    NSString * postImageURL = [NSString stringWithFormat:@"http://artdapps.com/photo-meta/upload"];
//    NSDictionary *parameters = @{@"userImage": imageData};
//    
//    [manager POST:postImageURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
//        [formData appendPartWithFileData:imageData name:@"photo" fileName:@"image.jpg" mimeType:@"image/jpeg"];
//    } progress:nil success:^(NSURLSessionDataTask *opearation, id responseObject)
//     {
//         [SVProgressHUD dismiss];
//         NSLog(@"%@", responseObject);
//         
//         NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//         if([[jsonResult objectForKey:@"status"] isEqualToString:@"true"])
//             NSLog(@"Server_Results%@",jsonResult);
//         else
//         {
//             NSLog(@"Server_Faild%@", jsonResult);
//         }
//     }
//    failure:^(NSURLSessionDataTask *operation, NSError *error)
//    {
//        [SVProgressHUD dismiss];
//        NSLog(@"%@", error);
//    }];
    
    
    NSData *imageData =UIImageJPEGRepresentation(delegate.transferImage, 90);
    NSString *urlString= @"http://artdapps.com/photo-meta/upload";
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]init];
    
    //Set the parameters
    NSArray *keys = [[NSArray alloc] initWithObjects:@"username",@"title",@"rating1",@"rating2", nil];
    NSArray *values = [[NSArray alloc] initWithObjects:delegate.transferUserName,delegate.transferTitle,delegate.transferRating1,delegate.transferRating2, nil];
    
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@" ,boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSMutableData *body= [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n" , boundary]dataUsingEncoding:NSUTF8StringEncoding]];
    
    //set body for parameters
    for(int i = 0; i < [keys count]; i++)
    {
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[keys objectAtIndex:i]] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@",[values objectAtIndex:i]] dataUsingEncoding:NSASCIIStringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSASCIIStringEncoding]];
    }
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\";filename=\"%@.jpg\"\r\n", delegate.transferTitle] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding :NSUTF8StringEncoding]] ;
    
    [request setHTTPBody:body];
    [SVProgressHUD showWithStatus:@"uploading photo.."];
    NSData *returnData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString =[[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"Server_response%@",returnString);
    
    _alertView.hidden = YES;
    [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"Submit successfully"];
    Rating2VC *rating2VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"uploadView"];
    [self.navigationController pushViewController:rating2VC animated:YES];
    [SVProgressHUD dismiss];
}

- (IBAction)alertCancelPressed:(id)sender
{
    _alertView.hidden = YES;
}


@end
