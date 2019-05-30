//
//  BFBeatCounter.m
//  BPM
//
//  Created by Christian Andersen on 30/5/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import "BFBeatCounter.h"

@implementation BFBeatCounter

-(instancetype) init
{
    if(self = [super init])
    {
        samples = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void) triggerBeat
{
    @synchronized (self) {
        [samples insertObject:[NSDate date]  atIndex:0];
        if([samples count] > 4 ) [samples removeObject:[samples lastObject]];
    }
}

-(NSDate *) lastEvent
{
    return [samples lastObject];
}


-(NSInteger) getBeatsPerMinute
{
    if([samples count] > 3)
    {
        NSTimeInterval totalTime = 0;
        NSDate * sample = [samples firstObject];
        for(int i = 1; i < 4;i++)
        {
            NSDate * sample2 = [samples objectAtIndex:i];
            totalTime += [sample timeIntervalSinceDate:sample2];
            sample = sample2;
        }
        NSTimeInterval seconds = totalTime/4;
        NSInteger beats = 60 / seconds;
        return beats;
    }
    return 0;
}
@end
