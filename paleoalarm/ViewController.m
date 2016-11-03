//
//  ViewController.m
//  paleoalarm
//
//  Created by Daniel Pape on 24/04/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

CLLocationManager *locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
  
    EDSunriseSet *sunriseset = [[EDSunriseSet alloc]initWithTimezone:[NSTimeZone localTimeZone] latitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude];
    
    [sunriseset calculateSunriseSunset:[NSDate date]];
    
    NSLog(@"%f,%f", locationManager.location.coordinate.latitude,locationManager.location.coordinate.longitude);
    NSDate *sunrise = [sunriseset sunrise];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"h mm"];
    
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:sunrise]];
    
    /* Initialize Pan Gesture with target */
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [panGesture setDelegate:self];
    
    /* set no of touch for pan gesture*/
    
    [panGesture setMaximumNumberOfTouches:1];
    
    /*  Add gesture to your image. */
    
    [self.drageImage setUserInteractionEnabled:YES];
    [self.drageImage addGestureRecognizer:panGesture];
    
    
}

- (void)handlePan:(UIPanGestureRecognizer*)recognizer {
    
    CGPoint translation = [recognizer translationInView:recognizer.view];
    
    recognizer.view.center=CGPointMake(recognizer.view.center.x, recognizer.view.center.y+ translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:recognizer.view];
    
    [self.skyDarkener setAlpha:(((self.sunImage.frame.origin.y/3)/100)-0.2)];
    NSLog(@"%f",self.skyDarkener.alpha);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
