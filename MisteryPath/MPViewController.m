//
//  MPViewController.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPViewController.h"
#import "MPMainMenuGameState.h"

@interface MPViewController ()

@end

@implementation MPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Say hello");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"Say hello again");
}

- (void)changeState:(Class)state {
    NSString *asset = [ NSString stringWithFormat:@"%@",state ];
    MPViewController *nextState = [self.storyboard instantiateViewControllerWithIdentifier:asset];
    self.view = [[state alloc] init];
    [self presentViewController:nextState animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
