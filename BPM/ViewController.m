//
//  ViewController.m
//  BPM
//
//  Created by Christian Andersen on 29/5/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.beatCounter = [[BFBeatCounter alloc] init];
    // Do any additional setup after loading the view.
}


- (IBAction)tapped:(UIButton *)sender {
    [self.beatCounter triggerBeat];
    NSInteger bpm = [self.beatCounter getBeatsPerMinute];
    if(bpm)
    {
        [self.tapButton setTitle:[NSString stringWithFormat:@"%ld",bpm] forState:UIControlStateNormal];
    }
    
}
@end
