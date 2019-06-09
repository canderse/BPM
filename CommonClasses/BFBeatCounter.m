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
        self.maxSampleSize = 4;
        _samples = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void) triggerBeat
{
    @synchronized (self) {
        [_samples insertObject:[NSDate date]  atIndex:0];
        if([_samples count] > self.maxSampleSize + 1) [_samples removeObject:[_samples lastObject]];
    }
}

-(void) setMaxSampleSize:(NSInteger)sampleSize
{
    _maxSampleSize = sampleSize;
    [self reset];
}

-(NSInteger) maxSampleSize
{
    return _maxSampleSize;
}

-(NSDate *) lastEvent
{
    return [_samples lastObject];
}

-(void) reset
{
    [_samples removeAllObjects];
}
-(float) getBeatsPerMinute
{
   
     if([_samples count] > 1)
    {
        NSTimeInterval totalTime = 0;
       
        NSDate * sample = [_samples firstObject];
        for(int i = 1; i < [_samples count];i++)
        {
            NSDate * sample2 = [_samples objectAtIndex:i];
            totalTime += [sample timeIntervalSinceDate:sample2];
            sample = sample2;
        }
        NSTimeInterval seconds = totalTime/([_samples count] - 1);
        float beats = 60 / seconds;
        return beats;
    }
    return 0;
}
@end
