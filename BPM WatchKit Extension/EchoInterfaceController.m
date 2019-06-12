//
//  EchoInterfaceController.m
//  BPM WatchKit Extension
//
//  Created by Christian Andersen on 12/6/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import "EchoInterfaceController.h"
#import "../CommonClasses/BFBeatCounter.h"

@implementation EchoInterfaceController

-(void) awakeWithContext:(id)context
{
    self.bpm = [((BFBeatCounter *) context) getBeatsPerMinute];
    self.wholdNoteLbl.text = [NSString stringWithFormat:@"%.3f ms",_bpm / 60];
    self.halfNoteLbl.text = [NSString stringWithFormat:@"%.3f ms",_bpm / 60 / 2];
    self.quaterNoteLbl.text = [NSString stringWithFormat:@"%.3f ms",_bpm / 60 / 4];
    self.eighthNoteLbl.text = [NSString stringWithFormat:@"%.3f ms",_bpm / 60 / 8];
}
@end
