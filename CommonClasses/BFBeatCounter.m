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
        samples = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void) triggerBeat
{
    @synchronized (self) {
        [samples insertObject:[NSDate date]  atIndex:0];
        if([samples count] > self.maxSampleSize + 1) [samples removeObject:[samples lastObject]];
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
    return [samples lastObject];
}

-(void) reset
{
    [samples removeAllObjects];`
}
-(NSInteger) getBeatsPerMinute
{
   
     if([samples count] > 1)
    {
        NSTimeInterval totalTime = 0;
       
        NSDate * sample = [samples firstObject];
        for(int i = 1; i < [samples count];i++)
        {
            NSDate * sample2 = [samples objectAtIndex:i];
            totalTime += [sample timeIntervalSinceDate:sample2];
            sample = sample2;
        }
        NSTimeInterval seconds = totalTime/([samples count] - 1);
        NSInteger beats = 60 / seconds;
        return beats;
    }
    return 0;
}
@end
