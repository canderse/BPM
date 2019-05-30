//
//  InterfaceController.h
//  BPM WatchKit Extension
//
//  Created by Christian Andersen on 29/5/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "../CommonClasses/BFBeatCounter.h"
@interface InterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceButton *tapButton;
- (IBAction)tapped;
-(void) checkActivity;
@property BFBeatCounter * beatCounter;
@property NSTimer * resetTimer;

@end
