//
//  ViewController.h
//  BPM
//
//  Created by Christian Andersen on 29/5/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../CommonClasses/BFBeatCounter.h"
@interface ViewController : UIViewController


@property BFBeatCounter * beatCounter;
@property (weak, nonatomic) IBOutlet UIButton *tapButton;
- (IBAction)tapped:(UIButton *)sender;



@end

