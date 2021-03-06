//
//  UIColor+EZRSharedColorAdditions.h
//  EasyReader
//
//  Created by Michael Beattie on 3/24/14.
//  Copyright (c) 2014 Cloudspace. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Extends UIColor to provide a set of standard colors used across the application
 */
@interface UIColor (EZRSharedColorAdditions)


#pragma mark - Color Methods

/// The menu background color
+ (UIColor *) EZR_menuBackground;

/// The menu input background color
+ (UIColor *) EZR_menuInputBackground;

/// The gradient background color
+ (UIColor *) EZR_charcoal;

/**
 * The charcoal gradient background with a given opacity
 *
 * @param opacity The opacity
 */
+ (UIColor *) EZR_charcoalWithOpacity:(float)opacity;


@end
