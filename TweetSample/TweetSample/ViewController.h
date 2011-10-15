//
//  ViewController.h
//  TweetSample
//
//  Created by 橋口 湖 on 11/10/15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)send:(id)sender;
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (retain, nonatomic) IBOutlet UILabel *imageLabel;
@property (nonatomic, retain) NSMutableArray* images;
- (IBAction)addImage:(id)sender;

@end
