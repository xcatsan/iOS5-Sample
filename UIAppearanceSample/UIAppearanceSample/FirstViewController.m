//
//  FirstViewController.m
//  UIAppearanceSample
//
//  Created by 橋口 湖 on 11/10/26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)_changeColorForIndex:(NSInteger)index
{
    UIColor* color = nil;
/    UIColor* blueColor = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:1.0];
    UIImage* backImage = nil;

    if (index == 0) {
        color = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1.0];
        backImage = [UIImage imageNamed:@"back1.png"];
    } else {
        color = [UIColor colorWithRed:0.5 green:0 blue:0 alpha:1.0];
        backImage = [UIImage imageNamed:@"back2.png"];
    }
    [[UINavigationBar appearance] setTintColor:color];
//    [[UIBarButtonItem appearance] setTintColor:blueColor];
//    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil]
//     setTintColor:color];

//    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:blueColor];
//    [[UIBarButtonItem appearance] setTintColor:blueColor];
    


    [[UISearchBar appearance] setTintColor:color];    
//    [[UILabel appearance] setTextColor:color];
//    [[UILabel appearanceWhenContainedIn:[UITextField class], nil] setTextColor:[UIColor redColor]];

//    [[UIButton appearance] setTitleColor:color forState:UIControlStateNormal];
    [[UIButton appearance] setBackgroundImage:backImage forState:UIControlStateNormal];

    [[UISegmentedControl appearance] setTintColor:color];
    [[UIProgressView appearance] setProgressTintColor:color];
    [[UISlider appearance] setMinimumTrackTintColor:color];
    [[UISwitch appearance] setOnTintColor:color];
    [[UIActivityIndicatorView appearance] setColor:color];
    [[UIToolbar appearance] setTintColor:color];
    [[UITabBar appearance] setTintColor:color];
//    [[UIView appearance] setBackgroundColor:[UIColor whiteColor]];

    for (UIView* view in ((UIButton*)[UIButton buttonWithType:UIButtonTypeRoundedRect]).subviews) {
        NSLog(@"%@::%@", [view class], [view superclass]);
    }
    
    [self.view layoutSubviews];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _changeColorForIndex:0];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)changed:(id)sender {
    UISegmentedControl* sc = (UISegmentedControl*)sender;
    [self _changeColorForIndex:sc.selectedSegmentIndex];
}
@end
