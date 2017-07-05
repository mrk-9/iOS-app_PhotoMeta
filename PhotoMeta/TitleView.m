//
//  TitleView.m
//  PhotoMeta
//
//  Created by star-perfect on 9/22/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import "TitleView.h"
#import "Rating1VC.h"
#import "AppDelegate.h"
#import "BaseroutAPI.h"

@interface TitleView ()
{
    AppDelegate *delegate;
}
@property (weak, nonatomic) IBOutlet UITextField *title_txtField;
@property (weak, nonatomic) IBOutlet UIButton *previous_btn;
@property (weak, nonatomic) IBOutlet UIButton *next_btn;

@end

@implementation TitleView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    delegate = [[UIApplication sharedApplication]delegate];
    _next_btn.hidden = YES;
    [self showDoneKeyboard];
    _title_txtField.layer.borderColor=[[UIColor colorWithRed:195.0f/255.0f green:195.0f/255.0f blue:195.0f/255.0f alpha:1.0] CGColor];
    
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
    if([_title_txtField.text length] <= 0)
        [[BaseroutAPI sharedInstance] MessageBox:@"Invalid input" Message:@"Please enter this photo a title"];
    else
    {
        //save title into delegate for uploading to server
        delegate.transferTitle = _title_txtField.text;
        NSLog(@"Title:%@",delegate.transferTitle);
    
        Rating1VC *rating1VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"rating1View"];
        [self.navigationController pushViewController:rating1VC animated:YES];
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
    
    _next_btn.hidden = NO;
    
    _title_txtField.inputAccessoryView = keyboardDoneButtonView;
    
}

//when press keyboard done button
- (IBAction)doneClicked:(id)sender
{
    [self.view endEditing:YES];
    
}
@end
