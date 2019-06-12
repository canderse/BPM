//
//  EchoInterfaceController.h
//  BPM WatchKit Extension
//
//  Created by Christian Andersen on 12/6/19.
//  Copyright © 2019 Christian Andersen. All rights reserved.
//

#import <WatchKit/WatchKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EchoInterfaceController : WKInterfaceController
@property (assign,nonatomic) float bpm;
@end

NS_ASSUME_NONNULL_END
