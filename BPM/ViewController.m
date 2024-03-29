//
//  ViewController.m
//  BPM
//
//  Created by Christian Andersen on 29/5/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import "ViewController.h"
#import "BFEchoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.beatCounter = [[BFBeatCounter alloc] init];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    // Do any additional setup after loading the view.
    [self setNeedsStatusBarAppearanceUpdate];
    [self.tapButton.layer setCornerRadius:10.0];
    self.resetTimer = [NSTimer scheduledTimerWithTimeInterval:120.0 target:self selector:@selector(checkActivity) userInfo: nil repeats:YES];
}

-(UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)tapped:(UIButton *)sender {
    [self.beatCounter triggerBeat];
    _bpm = [self.beatCounter getBeatsPerMinute];
    NSInteger bpm = _bpm;
    if(bpm)
    {
        [self.tapButton setTitle:[NSString stringWithFormat:@"%ld",bpm] forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ToEchoSegue" ])
        {
            ((BFEchoViewController *)segue.destinationViewController).bpm = _bpm;
        }
}

-(void) viewWillAppear:(BOOL)animated
{
    [self checkActivity];
}


-(void) checkActivity
{
    NSDate * lastEvent = [self.beatCounter lastEvent];
    if(lastEvent)
    {
        if([[NSDate date] timeIntervalSinceDate:lastEvent] > 100.f)
        {
             [self.tapButton setTitle:@"Tap" forState:UIControlStateNormal];
            self.navigationItem.rightBarButtonItem.enabled = NO;
            [self.beatCounter reset];
        }
    }
}
@end
