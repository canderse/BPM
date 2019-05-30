//
//  BFBeatCounter.h
//  BPM
//
//  Created by Christian Andersen on 30/5/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFBeatCounter : NSObject
{
    NSMutableArray * samples;
    
}


-(void) triggerBeat;

-(NSInteger) getBeatsPerMinute;

@end

NS_ASSUME_NONNULL_END
