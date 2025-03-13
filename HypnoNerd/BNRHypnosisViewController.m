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

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.backgroundColor = [UIColor clearColor]; // transparent
        messageLabel.textColor = [UIColor darkGrayColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        int width = (int)self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random() % width;
        
        int height = (int)self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
        messageLabel.alpha = 0;
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationCurveEaseIn
                         animations:^{
            messageLabel.alpha = 1;
        } completion:NULL];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}

# pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""]) {
        return NO;
    }
    
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [self.textField resignFirstResponder];
    
    return YES;
}


@end
