//
//  ViewController.m
//  CrystalBall
//
//  Created by Renn Jervis on 10/11/14.
//  Copyright (c) 2014 Renn Jervis. All rights reserved.
//

#import "ViewController.h"
#import "Crystal Ball.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController ()

@end

@implementation ViewController{
    SystemSoundID soundEffect;  //this is an instance variable called soundEffect
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //locate sound effect file
    NSString *soundPath= [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    NSError *error;
    AVAudioPlayer *theAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    [theAudioPlayer prepareToPlay];
    self.audioPlayer = theAudioPlayer;
    
    
    
    self.crystalBall = [[Crystal_Ball alloc] init];
    self.colors =[[NSArray alloc] initWithObjects: [UIColor greenColor], [UIColor blueColor], [UIColor purpleColor], [UIColor redColor], [UIColor yellowColor], nil];
    
    self.animateBall.animationImages = [[NSArray alloc] initWithObjects:
                                        [UIImage imageNamed:@"CB00001"],
                                        [UIImage imageNamed:@"CB00002"],
                                        [UIImage imageNamed:@"CB00003"],
                                        [UIImage imageNamed:@"CB00004"],
                                        [UIImage imageNamed:@"CB00005"],
                                        [UIImage imageNamed:@"CB00006"],
                                        [UIImage imageNamed:@"CB00007"],
                                        [UIImage imageNamed:@"CB00008"],
                                        [UIImage imageNamed:@"CB00009"],
                                        [UIImage imageNamed:@"CB00010"],
                                        [UIImage imageNamed:@"CB00011"],
                                        [UIImage imageNamed:@"CB00012"],
                                        [UIImage imageNamed:@"CB00013"],
                                        [UIImage imageNamed:@"CB00014"],
                                        [UIImage imageNamed:@"CB00014"],
                                        [UIImage imageNamed:@"CB00015"],
                                        [UIImage imageNamed:@"CB00017"],
                                        [UIImage imageNamed:@"CB00018"],
                                        [UIImage imageNamed:@"CB00019"],
                                        [UIImage imageNamed:@"CB00020"],
                                        [UIImage imageNamed:@"CB00021"],
                                        [UIImage imageNamed:@"CB00022"],
                                        [UIImage imageNamed:@"CB00023"],
                                        [UIImage imageNamed:@"CB00024"],
                                        [UIImage imageNamed:@"CB00025"],
                                        [UIImage imageNamed:@"CB00026"],
                                        [UIImage imageNamed:@"CB00027"],
                                        [UIImage imageNamed:@"CB00028"],
                                        [UIImage imageNamed:@"CB00029"],
                                        [UIImage imageNamed:@"CB00030"],
                                        [UIImage imageNamed:@"CB00031"],
                                        [UIImage imageNamed:@"CB00032"],
                                        [UIImage imageNamed:@"CB00033"],
                                        [UIImage imageNamed:@"CB00034"],
                                        [UIImage imageNamed:@"CB00035"],
                                        [UIImage imageNamed:@"CB00036"],
                                        [UIImage imageNamed:@"CB00037"],
                                        [UIImage imageNamed:@"CB00038"],
                                        [UIImage imageNamed:@"CB00039"],
                                        [UIImage imageNamed:@"CB00040"],
                                        [UIImage imageNamed:@"CB00041"],
                                        [UIImage imageNamed:@"CB00042"],
                                        [UIImage imageNamed:@"CB00043"],
                                        [UIImage imageNamed:@"CB00044"],
                                        [UIImage imageNamed:@"CB00045"],
                                        [UIImage imageNamed:@"CB00046"],
                                        [UIImage imageNamed:@"CB00047"],
                                        [UIImage imageNamed:@"CB00048"],
                                        [UIImage imageNamed:@"CB00049"],
                                        [UIImage imageNamed:@"CB00050"],
                                        [UIImage imageNamed:@"CB00051"],
                                        [UIImage imageNamed:@"CB00052"],
                                        [UIImage imageNamed:@"CB00053"],
                                        [UIImage imageNamed:@"CB00054"],
                                        [UIImage imageNamed:@"CB00055"],
                                        [UIImage imageNamed:@"CB00056"],
                                        [UIImage imageNamed:@"CB00057"],
                                        [UIImage imageNamed:@"CB00058"],
                                        [UIImage imageNamed:@"CB00059"],
                                        [UIImage imageNamed:@"CB00060"],
                                        nil];
    self.animateBall.animationDuration =1.0f;
    self.animateBall.animationRepeatCount =1;
}

-(void) viewDidAppear:(BOOL)animated{
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Prediction
-(void) makePrediction{
    [self.animateBall startAnimating];
    self.predictLabel.text = [self.crystalBall randomPrediction];
    
    [self.audioPlayer play];
    
    [UIView animateWithDuration:2.0 animations:^{
        self.predictLabel.alpha = 1.0;
    }];
    
    
    
    
    
}
# pragma mark motion events
- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake){
        self.predictLabel.alpha = 0.0f;
        self.predictLabel.text = nil;}
}
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
        [self makePrediction];
    
}

#pragma mark touch events

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.predictLabel.text = nil;
    self.predictLabel.alpha = 0.0f;
    
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self makePrediction];
    NSInteger randColor = arc4random_uniform((unsigned int) self.colors.count);
    self.predictLabel.textColor = [self.colors objectAtIndex:randColor];
}
@end
