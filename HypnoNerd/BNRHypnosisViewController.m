//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Edwin Cardenas on 1/02/25.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation BNRHypnosisViewController


- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.title = @"Hypnosis";
        self.tabBarItem.image = [UIImage systemImageNamed:@"hurricane"];
    }
    
    return self;
}


- (void)loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    self.view = backgroundView;
    
    [self setupViews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (void)setupViews
{
    self.textField = [UITextField new];
    self.textField.placeholder = @"Hypnotize me";
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.85];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.textField];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.textField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:40],
        [self.textField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:60],
        [self.textField.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-60],
    ]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    
    textField.text = @"";
    
    [self.textField resignFirstResponder];
    
    return YES;
}


@end
