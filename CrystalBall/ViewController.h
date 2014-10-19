//
//  ViewController.h
//  CrystalBall
//
//  Created by Renn Jervis on 10/11/14.
//  Copyright (c) 2014 Renn Jervis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class Crystal_Ball;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *predictLabel;
@property (strong, nonatomic) Crystal_Ball *crystalBall;

@property (strong, nonatomic) NSArray *colors;

-(void) makePrediction;

@property (strong, nonatomic) IBOutlet UIImageView *animateBall;
@property (strong,nonatomic) AVAudioPlayer *audioPlayer;

@end

