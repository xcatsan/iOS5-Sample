//
//  ViewController.m
//  TweetSample
//
//  Created by 橋口 湖 on 11/10/15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <Twitter/TWTweetComposeViewController.h>

@implementation ViewController
@synthesize textView;
@synthesize imageLabel;
@synthesize images;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.textView becomeFirstResponder];
    self.images = [NSMutableArray array];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [self setImageLabel:nil];
    self.images = nil;
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

- (IBAction)addImage:(id)sender {
    UIImagePickerController* controller = [[UIImagePickerController alloc] init];
    [self presentModalViewController:controller animated:YES];
    controller.delegate = self;
    controller.allowsEditing = YES;
    [controller release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self.images addObject:image];
    self.imageLabel.text = [NSString stringWithFormat:@"%d", [self.images count]];
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [textView release];
    [imageLabel release];
    [super dealloc];
}
- (IBAction)send:(id)sender {
    
    NSLog(@"canSendTweet: %@", [TWTweetComposeViewController canSendTweet] ? @"YES" : @"NO");
    
    TWTweetComposeViewController *viewController = [[TWTweetComposeViewController alloc] init];
    [viewController setInitialText:self.textView.text];
    for (UIImage* image in self.images) {
        BOOL r = [viewController addImage:image];
        NSLog(@"addImage result: %@", r ? @"YES":@"NO");
    }
    
    [viewController addURL:[NSURL URLWithString:@"http://www.apple.com/"]];
    [viewController addURL:[NSURL URLWithString:@"http://www.google.com/"]];

    viewController.completionHandler = ^(TWTweetComposeViewControllerResult res) {
        if (res == TWTweetComposeViewControllerResultCancelled) {
            NSLog(@"cancel");
        }
        else if (res == TWTweetComposeViewControllerResultDone) {
            NSLog(@"done");
            [self dismissModalViewControllerAnimated:YES];
            self.images = [NSMutableArray array];
            self.textView.text = @"";
            self.imageLabel.text = @"0";
        }
    };
    
    [self presentModalViewController:viewController animated:YES];
}

@end
