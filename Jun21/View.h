//
//  View.h
//  Jun21
//
//  Created by Michael Compas on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView
{
	NSString *componentType;
	CGPoint point;
}

@property (strong, nonatomic) NSString *faderType;

- (id) initDeckWithRadius:(int) r;
- (id) initDeckWithRadius:(int) r atPoint: (CGPoint) p;

- (id) initFaderWithRange:(int) r andSliderHeight:(int) h;
- (id) initFaderWithRange:(int) r andSliderHeight:(int) h atPoint: (CGPoint) p;

@end
