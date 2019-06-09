//
//  BFEchoViewController.h
//  BPM
//
//  Created by Christian Andersen on 7/6/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFEchoViewController : UIViewController
{
    float _bpm;
}
@property (assign) float bpm;
@property (weak, nonatomic) IBOutlet UILabel *wholeNoteLbl;
@property (weak, nonatomic) IBOutlet UILabel *halfNoteLbl;
@property (weak, nonatomic) IBOutlet UILabel *quaterNoteLbl;
@property (weak, nonatomic) IBOutlet UILabel *eighthNoteLbl;


@end

NS_ASSUME_NONNULL_END
