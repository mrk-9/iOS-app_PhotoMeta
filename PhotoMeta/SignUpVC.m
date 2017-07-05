//
//  SignUpVC.m
//  PhotoMeta
//
//  Created by sky-mac on 9/15/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import "SignUpVC.h"
#import "TextField + CustomPlaceholder.h"
#import "BaseroutAPI.h"
#import "Apimanager.h"
#import "AppDelegate.h"
#import <SVProgressHUD.h>

#define kOFFSET_FOR_KEYBOARD 80.0

@interface SignUpVC ()
{
    Apimanager *apimanager;
    AppDelegate *delegate;
    
}
@property (weak, nonatomic) IBOutlet UIButton *signUpbtn;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *userName_txtF;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *email_txtF;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *password_txtF;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *conPass_txtF;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *age_txtF;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *gender_txtF;
@property (weak, nonatomic) IBOutlet TextField___CustomPlaceholder *postcode;
@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    delegate = [[UIApplication sharedApplication] delegate];
    [self.navigationController.navigationBar setHidden:YES];
    [self radinShape:self.signUpbtn];
    [self showDoneKeyboard];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //scroll operation(UITextFiled by keyboard)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //scroll operation(UITextFiled by keyboard)
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)backbtnpress:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}					

-(void) radinShape:(UIButton *) button
{
    button.layer.borderWidth =0;
    button.layer.cornerRadius = 23.0;
    button.layer.masksToBounds = YES;
}

- (IBAction)signUpBtnPress:(id)sender
{
    if ([_userName_txtF.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter valid username"];
    }else
    if ([_email_txtF.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter valid email"];
    }else
    if ([_age_txtF.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter valid age"];
    }else
    if ([_gender_txtF.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter valid gender"];
    }else
    if ([_password_txtF.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter Password"];
    }else
    if ([_conPass_txtF.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter Confirm Password"];
    }else
    if (![_password_txtF.text isEqualToString: _conPass_txtF.text])
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Reenter Confirm Password"];
    }else
    if ([_postcode.text length] <= 0)
    {
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter valid postcode"];
    }else
    {
        apimanager = [[Apimanager alloc] init];
        [SVProgressHUD showWithStatus:@"Please wait..."];
        NSString *api_name;
        NSDictionary *params;
        NSString *email = _email_txtF.text;
        NSString *password = _password_txtF.text;
        NSString *username = _userName_txtF.text;
        NSString *age = _age_txtF.text;
        NSString *gender = _gender_txtF.text;
        NSString *postcode = _postcode.text;
        
        params = [NSDictionary dictionaryWithObjectsAndKeys:username, @"username", email, @"email", password, @"password",@"age",age,@"gender",gender,@"postcode",postcode,nil];
        api_name = @"/signup";
      
        [apimanager callAPI:api_name withParams:params success:^(NSData *data) {
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                NSError *errorJson = nil;
                NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&errorJson];
                BOOL status = [[dataDict objectForKey:@"status"] boolValue];
                
                if (status)   //success
                {
                    NSLog(@"%@", dataDict);
                    [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"Signup successfully"];
                    [self.navigationController popViewControllerAnimated:true];
                    
                } else
                {             //failed
                    NSLog(@"%@", dataDict);
                    if([[dataDict objectForKey:@"error"] isEqualToString:@"existing user name"])
                    {
                        [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"Username already exist"];
                    }else
                    if ([[dataDict objectForKey:@"error"] isEqualToString:@"existing email address"])
                    {
                        [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"Email already exist"];
                    }else
                    if ([[dataDict objectForKey:@"error"] isEqualToString:@"existing account"])
                    {
                        [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"User already exist"];
                    }
                    if ([[dataDict objectForKey:@"error"] isEqualToString:@"failed insert user info"])
                    {
                        [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"Invalid user information"];
                    }
                }
                
            });
        }
                      error:^(NSError *error){
                          
                          [SVProgressHUD dismiss];
                          [[BaseroutAPI sharedInstance] MessageBox:@"Notice" Message:@"Server connection failed!"];
                          
                      }];

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
    
    _userName_txtF.inputAccessoryView = keyboardDoneButtonView;
    _email_txtF.inputAccessoryView = keyboardDoneButtonView;
    _password_txtF.inputAccessoryView = keyboardDoneButtonView;
    _conPass_txtF.inputAccessoryView = keyboardDoneButtonView;
    _age_txtF.inputAccessoryView = keyboardDoneButtonView;
    _gender_txtF.inputAccessoryView = keyboardDoneButtonView;
    _postcode.inputAccessoryView = keyboardDoneButtonView;
}

//when press keyboard done button
- (IBAction)doneClicked:(id)sender
{
    [self.view endEditing:YES];
    
}
//check email format
-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
//scroll operation(UITextFiled by keyboard)
-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

//scroll operation(UITextFiled by keyboard)
-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

//scroll operation(UITextFiled by keyboard)
-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:_conPass_txtF])
    {
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//scroll operation(UITextFiled by keyboard)
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}
@end
