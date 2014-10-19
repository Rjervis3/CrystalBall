//
//  Crystal Ball.h
//  CrystalBall
//
//  Created by Renn Jervis on 10/12/14.
//  Copyright (c) 2014 Renn Jervis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Crystal_Ball : NSObject{
    NSArray *_predictions;     //instance variable because predictions is read-only
}

@property(strong, nonatomic, readonly) NSArray *predictions;

-(NSString*) randomPrediction;

@end
