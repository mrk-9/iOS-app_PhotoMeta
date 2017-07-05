//
//  Rating1VC.m
//  PhotoMeta
//
//  Created by star-perfect on 9/22/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import "Rating1VC.h"
#import "Rating2VC.h"
#import "AppDelegate.h"

@interface Rating1VC ()
{
    int flag;
    AppDelegate *delegate;
}
@property (weak, nonatomic) IBOutlet UIButton *previous_btn;
@property (weak, nonatomic) IBOutlet UIButton *next_btn;
@property (weak, nonatomic) IBOutlet UIImageView *point1_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_img;
@property (weak, nonatomic) IBOutlet UIImageView *point3_img;
@property (weak, nonatomic) IBOutlet UIImageView *point1_1_img;
@property (weak, nonatomic) IBOutlet UIImageView *point1_2_img;
@property (weak, nonatomic) IBOutlet UIImageView *point1_3_img;
@property (weak, nonatomic) IBOutlet UIImageView *point1_4_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_1_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_2_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_3_img;
@property (weak, nonatomic) IBOutlet UIImageView *point2_4_img;

@end

@implementation Rating1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    _next_btn.hidden = YES;
    delegate = [[UIApplication sharedApplication] delegate];
    flag = 0;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)previousPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)nextPressed:(id)sender
{
    //save feel string into delegate for uploading to server
    switch (flag) {
        case 1:
        {
            delegate.transferRating1 = @"It makes me sad";
            NSLog(@"Rating1%@",delegate.transferRating1);
            
        }break;
        case 2:
        {
            delegate.transferRating1 = @"I am ok with this";
            NSLog(@"Rating1%@",delegate.transferRating1);
            
        }break;
        case 3:
        {
            delegate.transferRating1 = @"It makes me happy";
            NSLog(@"Rating1%@",delegate.transferRating1);
            
        }
        default:
            break;
    }
    Rating2VC *rating2VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"rating2View"];
    [self.navigationController pushViewController:rating2VC animated:YES];
}

- (IBAction)leftbtnPressed:(id)sender
{
    _point1_img.hidden = NO;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = NO;
    flag = 1;
}

- (IBAction)midbtnPressed:(id)sender
{
    _point1_img.hidden = YES;
    _point2_img.hidden = NO;
    _point3_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = NO;
    flag = 2;
}

- (IBAction)rightbtnPressed:(id)sender
{
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = NO;
    _point1_1_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = NO;
    flag = 3;
}
- (IBAction)_1btnPressed:(id)sender
{
    _point1_1_img.hidden = NO;
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = YES;
}
- (IBAction)_2btnPressed:(id)sender
{
    _point1_2_img.hidden = NO;
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = YES;
}
- (IBAction)_3btnPressed:(id)sender
{
    _point1_3_img.hidden = NO;
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = YES;
}
- (IBAction)_4btnPressed:(id)sender
{
    _point1_4_img.hidden = NO;
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = YES;
}

- (IBAction)mid_1btnPressed:(id)sender
{
    _point2_1_img.hidden = NO;
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = YES;
}

- (IBAction)mid_2btnPressed:(id)sender
{
    _point2_2_img.hidden = NO;
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = YES;
}

- (IBAction)mid_3btnPressed:(id)sender
{
    _point2_3_img.hidden = NO;
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _point2_4_img.hidden = YES;
    _next_btn.hidden = YES;
}

- (IBAction)mid_4btnPressed:(id)sender
{
    _point2_4_img.hidden = NO;
    _point1_img.hidden = YES;
    _point2_img.hidden = YES;
    _point3_img.hidden = YES;
    _point1_2_img.hidden = YES;
    _point1_3_img.hidden = YES;
    _point1_4_img.hidden = YES;
    _point2_1_img.hidden = YES;
    _point2_2_img.hidden = YES;
    _point2_3_img.hidden = YES;
    _point1_1_img.hidden = YES;
    _next_btn.hidden = YES;
}

@end
