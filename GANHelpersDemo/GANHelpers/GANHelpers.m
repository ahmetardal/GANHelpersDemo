//
//  GANHelpers.m
//  Trendle
//
//  Created by Ahmet Ardal on 12/7/10.
//  Copyright 2010 SpinningSphere Labs. All rights reserved.
//

#import "GANTracker.h"
#import "GANHelpers.h"

//
// google analytics tracking dispatch period in seconds
//
static const NSInteger kGANDispatchPeriodSec = 10;

//
// google analytics profile id
//
#warning Replace analytics profile id placeholder string with \
         your app's analytics profile id and remove this #warning directive.
static NSString *const kGANProfileId = @"UA-XXXXXXXX-XX";

@implementation GANHelpers

+ (NSInteger) dispatchPeriodSeconds
{
    return kGANDispatchPeriodSec;
}

+ (NSString *) profileId
{
    return kGANProfileId;
}

+ (void) startTracker
{
    [[GANTracker sharedTracker] startTrackerWithAccountID:kGANProfileId
                                           dispatchPeriod:kGANDispatchPeriodSec
                                                 delegate:nil];
}

+ (void) trackEvent:(NSString *)category
             action:(NSString *)action
{
    [GANHelpers trackEvent:category action:action label:@"" value:-1];
}

+ (void) trackEvent:(NSString *)category
             action:(NSString *)action
              label:(NSString *)label
{
    [GANHelpers trackEvent:category action:action label:label value:-1];
}

+ (void) trackEvent:(NSString *)category
             action:(NSString *)action
              label:(NSString *)label
              value:(NSInteger)value
{
    NSError *error = nil;
    if (![[GANTracker sharedTracker] trackEvent:category
                                         action:[NSString stringWithFormat:@"%@-%@", category, action]
                                          label:label
                                          value:value
                                      withError:&error]) {
        NSLog(@"GANHelpers::trackEvent - trackEvent failed - %@, %@, %@",
              [error localizedDescription], [error localizedFailureReason], [error description]);
    }
}

+ (void) trackPageview:(NSString *)url
{
    if (![url hasPrefix:@"/"]) {
        url = [NSString stringWithFormat:@"/%@", url];
    }

    NSError *error = nil;
    if (![[GANTracker sharedTracker] trackPageview:url withError:&error]) {
        NSLog(@"GANHelpers::trackPageview - trackPageview failed - %@, %@, %@",
              [error localizedDescription], [error localizedFailureReason], [error description]);
    }
}

+ (void) dispatchNow
{
    [[GANTracker sharedTracker] dispatch];
}

@end
