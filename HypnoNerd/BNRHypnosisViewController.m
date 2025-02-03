//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Edwin Cardenas on 1/02/25.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}


@end
