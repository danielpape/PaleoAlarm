//
//  ViewController.h
//  paleoalarm
//
//  Created by Daniel Pape on 24/04/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "EDSunriseSet.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *drageImage;
@property (strong, nonatomic) IBOutlet UIImageView *skyDarkener;
@property (strong, nonatomic) IBOutlet UIImageView *sunImage;

@end
