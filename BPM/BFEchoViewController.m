//
//  BFEchoViewController.m
//  BPM
//
//  Created by Christian Andersen on 7/6/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import "BFEchoViewController.h"

@interface BFEchoViewController ()

@end

@implementation BFEchoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(float) bpm
{
    return _bpm;
}

-(void) setBpm:(float)bpm
{
    _bpm = bpm;
    _wholeNoteLbl.text = [NSString stringWithFormat:@"%.3f ms",_bpm / 60];
    _halfNoteLbl.text = [NSString stringWithFormat:@"%.3f ms",_bpm / 60 / 2];
    _quaterNoteLbl.text = [NSString stringWithFormat:@"%.3f ms",_bpm / 60 / 4];
    _eighthNoteLbl.text = [NSString stringWithFormat:@"%.3f ms",_bpm / 60 / 8];
}
 /*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
