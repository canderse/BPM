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
        self.sampleSize = 4;
    }
    return self;
}
-(void) triggerBeat
{
    @synchronized (self) {
        [samples insertObject:[NSDate date]  atIndex:0];
        if([samples count] > self.sampleSize + 5 ) [samples removeObject:[samples lastObject]];
    }
}

-(void) setSampleSize:(NSInteger)sampleSize
{
    _sampleSize = sampleSize;
    samples = [[NSMutableArray alloc] init];
}

-(NSInteger) sampleSize
{
    return _sampleSize;
}

-(NSDate *) lastEvent
{
    return [samples lastObject];
}


-(NSInteger) getBeatsPerMinute
{
    if([samples count] > self.sampleSize)
    {
        NSTimeInterval totalTime = 0;
        NSDate * sample = [samples firstObject];
        for(int i = 1; i < self.sampleSize + 1;i++)
        {
            NSDate * sample2 = [samples objectAtIndex:i];
            totalTime += [sample timeIntervalSinceDate:sample2];
            sample = sample2;
        }
        NSTimeInterval seconds = totalTime/self.sampleSize;
        NSInteger beats = 60 / seconds;
        return beats;
    }
    return 0;
}
@end
