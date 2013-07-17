//
//  MPViewController.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPViewController.h"

@interface MPViewController ()

@end

@implementation MPViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated {
}

- (IBAction)goExtras:(id)sender {
    
    //NSLog(@"click with manager: %@", gameManager);
    //[gameManager doStateChange:[MPExtrasGameState class]];
    
    MPViewController *extras = [self.storyboard instantiateViewControllerWithIdentifier:@"MPExtrasGameState"];
    //self.view = [[GameGameState alloc] init];
    [self presentViewController:extras animated:YES completion:NULL];
}

- (IBAction)goMenu:(id)sender {
    MPViewController *menu = [self.storyboard instantiateViewControllerWithIdentifier:@"MPMainMenuGameState"];
    [self presentViewController:menu animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    NSUInteger numTaps = [touch tapCount];
    // todo: implement touch code
    if (numTaps > 1) {
        NSLog(@"tapped %d time", numTaps);
    }
}

@end
