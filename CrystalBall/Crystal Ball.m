//
//  Crystal Ball.m
//  CrystalBall
//
//  Created by Renn Jervis on 10/12/14.
//  Copyright (c) 2014 Renn Jervis. All rights reserved.
//

#import "Crystal Ball.h"

@implementation Crystal_Ball

-(NSArray*) predictions //getter
{
    if (_predictions ==nil)
    {   _predictions = [[NSArray alloc] initWithObjects:@"It is certain", @"It is decidedly so", @"Perhaps", @"Perhaps not", @"It seems unlikely", @"Hmm...", nil];
    }
    return _predictions;
}

-(NSString*) randomPrediction
{
    int random = arc4random_uniform((unsigned int) self.predictions.count);
    return[self.predictions objectAtIndex:random];

    return nil;
    
}
@end
