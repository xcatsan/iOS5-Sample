//
//  ViewController.m
//  MultiNavigatorItemButtons
//
//  Created by Hiroshi Hashiguchi on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize navigationBar;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.topItem.leftItemsSupplementBackButton = YES;
	// Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]
                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                              target:self
                              action:@selector(touched:)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                target:self
                                action:@selector(touched:)];

    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]
                              initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                              target:self
                              action:@selector(touched:)];
    
    UIBarButtonItem *item4 = [[UIBarButtonItem alloc]
                              initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                              target:self
                              action:@selector(touched:)];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.navigationBar.topItem.rightBarButtonItems =
        [NSArray arrayWithObjects:item1, item2, item3, item4, nil];

    self.navigationBar.topItem.leftBarButtonItems =
    [NSArray arrayWithObjects:item1, item2, item3, item4, nil];

    self.navigationBar.topItem.title = @"LONG LONG NAME";
}

- (void)touched:(id)sender
{
    NSLog(@"%s|%@", __PRETTY_FUNCTION__, sender);
}

- (void)viewDidUnload
{
    [self setNavigationBar:nil];
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
    return YES;
}

@end
