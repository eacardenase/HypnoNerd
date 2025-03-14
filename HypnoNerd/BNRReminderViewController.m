//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Edwin Cardenas on 1/02/25.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic) UIDatePicker *datePicker;
@property (nonatomic) UIButton *reminderButton;

@end

@implementation BNRReminderViewController


- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.title = @"Reminder";
        self.tabBarItem.image = [UIImage systemImageNamed:@"clock"];
    }
    
    return self;
}

- (void)loadView
{
    self.view = [UIView new];
    [self setupViews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRReminderViewController loaded its view.");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (void)setupViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.datePicker = [UIDatePicker new];
    
    self.reminderButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.reminderButton setTitle:@"Remind me!" forState:UIControlStateNormal];
    [self.reminderButton addTarget:self action:@selector(addReminder:) forControlEvents:UIControlEventTouchUpInside];
    
    self.reminderButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.datePicker.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.reminderButton];
    [self.view addSubview:self.datePicker];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.reminderButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.reminderButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        
        [self.datePicker.bottomAnchor constraintEqualToAnchor:self.reminderButton.topAnchor constant:-60],
        [self.datePicker.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    ]];
}

#pragma mark - Actions

- (void)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}


@end
