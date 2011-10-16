//
//  GANHelpers.h
//  Trendle
//
//  Created by Ahmet Ardal on 12/7/10.
//  Copyright 2010 SpinningSphere Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GANHelpers: NSObject
{
}

+ (NSInteger) dispatchPeriodSeconds;

+ (NSString *) profileId;

+ (void) startTracker;

+ (void) trackEvent:(NSString *)category
             action:(NSString *)action;

+ (void) trackEvent:(NSString *)category
             action:(NSString *)action
              label:(NSString *)label;

+ (void) trackEvent:(NSString *)category
             action:(NSString *)action
              label:(NSString *)label
              value:(NSInteger)value;

+ (void) trackPageview:(NSString *)url;

+ (void) dispatchNow;

@end
