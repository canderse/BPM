//
//  InterfaceController.m
//  BPM WatchKit Extension
//
//  Created by Christian Andersen on 29/5/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController ()

@end


@implementation InterfaceController




- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    self.beatCounter = [[BFBeatCounter alloc] init];
    self.resetTimer = [NSTimer scheduledTimerWithTimeInterval:120.0 target:self selector:@selector(checkActivity) userInfo: nil repeats:YES];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [self checkActivity];
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void) checkActivity
{
    NSDate * lastEvent = [self.beatCounter lastEvent];
    if(lastEvent)
    {
        if([[NSDate date] timeIntervalSinceDate:lastEvent] > 100.f)
        {
            [self.tapButton setTitle:@"Tap"];
        }
    }
}

- (IBAction)tapped {
    [self.beatCounter triggerBeat];
    NSInteger bpm = [self.beatCounter getBeatsPerMinute];
    if(bpm)
    {
        [self.tapButton setTitle:[NSString stringWithFormat:@"%ld",bpm] ];
    }
}
@end



