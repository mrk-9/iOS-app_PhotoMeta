//
//  ViewController.m
//  PhotoMeta
//
//  Created by sky-mac on 9/13/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import "ViewController.h"
#import "TextField + CustomPlaceholder.h"
#import "SignUpVC.h"
#import "UploadVC.h"
#import "Apimanager.h"
#import "BaseroutAPI.h"
#import "AppDelegate.h"
#import <SVProgressHUD.h>

@interface ViewController ()
{
    Apimanager *apimanager;
    AppDelegate *delegate;
}
@property (weak, nonatomic) IBOutlet UIButton *logInBtn;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *email_txtV;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *passWord_txtV;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    delegate = [[UIApplication sharedApplication] delegate];
    [self.navigationController.navigationBar setHidden:YES];
    [self radinShapeLogInBtn:self.logInBtn];
    [self showDoneKeyboard];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)logIn:(id)sender
{
    if([_email_txtV.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter valid email"];
    }else
    if([_passWord_txtV.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter password"];
    }else
    {
        apimanager = [[Apimanager alloc] init];
        [SVProgressHUD showWithStatus:@"Please wait..."];
        NSString *api_name;
        NSDictionary *params;
        NSString *password = _passWord_txtV.text;
        NSString *email = _email_txtV.text;
        
        params = [NSDictionary dictionaryWithObjectsAndKeys:email, @"email",password, @"password", nil];
        api_name = @"/login";
        
        [apimanager callAPI:api_name withParams:params success:^(NSData *data) {
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                NSError *errorJson = nil;
                NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&errorJson];
                BOOL status = [[dataDict objectForKey:@"status"] boolValue];
                
                if (status)   //success
                {
                    NSLog(@"%@", dataDict);
                    
                    //save username into delegate for uploading to server
                    delegate.transferUserName = _email_txtV.text;
                    NSLog(@"email:%@",delegate.transferUserName);
                    
                    UploadVC *uploadVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"uploadView"];
                    [self.navigationController pushViewController:uploadVC animated:YES];
                    
                } else
                {             //failed
                    NSLog(@"%@", dataDict);
                    [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"Incorrect email and password"];
                }
                
            });
        }
                      error:^(NSError *error){
                          
                          [SVProgressHUD dismiss];
                          [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"Server /Users/thomas/Documents/PhotoMeta/PhotoMeta/PhotoMeta/PhotoMeta/Base.lproj/Main.storyboardconnection failed!"];
                          
                      }];
    }
}

- (IBAction)signUp:(id)sender
{
    SignUpVC *signupVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"signUpView"];
    [self.navigationController pushViewController:signupVC animated:YES];
}

- (IBAction)forgotPass:(id)sender
{
    
}

- (void) radinShapeLogInBtn:(UIButton *) button
{
    button.layer.borderWidth =0;
    button.layer.cornerRadius = 23.0;
    button.layer.masksToBounds = YES;
}

-(void) findNameOfFont
{
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@",family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName:family])
        {
            NSLog(@" %@", name);
        }
    }

}

-(void) showDoneKeyboard
{
    //Show the Done on the keyboard begin
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    
    _email_txtV.inputAccessoryView = keyboardDoneButtonView;
    _passWord_txtV.inputAccessoryView = keyboardDoneButtonView;
    
}

//when press keyboard done button
- (IBAction)doneClicked:(id)sender
{
    [self.view endEditing:YES];
    
}


@end
