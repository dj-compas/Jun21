//
//  View.m
//  Jun21
//
//  Created by Michael Compas on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

@synthesize faderType;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		// setting the background color here will set it for ALL instances of this class
		// instead, create an instance variable that custom colors can be passed through
		// 
		self.backgroundColor = [UIColor clearColor];
		
		// modify bounds
		if (componentType == @"fader")
		{
			//			CGFloat w = self.bounds.size.width;
			//			CGFloat h = self.bounds.size.height;
			//			self.bounds = CGRectMake(-w/2, -h/2, w, h);
		}
		
    }
    return self;
}

-(id)initDeckWithRadius:(int)r
{
	componentType = @"deck";
	
	// view gets created with frame defined below at point x,y
	return [self initWithFrame:CGRectMake(point.x, point.y, r, r)];
}

-(id)initDeckWithRadius:(int)r atPoint: (CGPoint) p
{	
	point = p;
	return [self initDeckWithRadius:r];
}

-(id)initFaderWithRange:(int)r andSliderHeight:(int)h
{
	componentType = @"fader";
	return [self initWithFrame:CGRectMake(point.x, point.y, h, r)];
}

-(id)initFaderWithRange:(int)r andSliderHeight:(int)h atPoint:(CGPoint)p
{
	point = p;
	return [self initFaderWithRange:r andSliderHeight:h];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	
	// Drawing code
	if (componentType == @"deck")
	{
		int strokeWidth = 4;
		
		// create frame to hold graphics
		// - for the decks, the x,y is centered within the view frame based on the strokeWidth
		// - the width and height of the drawing frame is also modified based on the stroke width
		CGRect f = CGRectMake(strokeWidth/2, strokeWidth/2, w-(strokeWidth*2), h-(strokeWidth*2));
		
		// ========================
		// draw circles
		CGContextRef c = UIGraphicsGetCurrentContext();
		CGContextBeginPath(c);
		
		//CGContextTranslateCTM(c, self.bounds.size.width / 2, self.bounds.size.height / 2); //origin at center of view
		
		CGContextAddEllipseInRect(c, f);
		CGContextSetRGBFillColor(c, .1, .1, .1, 1);
		CGContextFillPath(c);
		
		// ========================
		// draw stroke
		CGContextAddEllipseInRect(c, f);
		CGContextSetRGBStrokeColor(c, .9, .9, .8, 1);
		CGContextSetLineWidth(c, strokeWidth);
		CGContextStrokePath(c);
	}
	else if (componentType == @"fader")
	{
		int rangeLineWidth = 4;
		
		//CGRect f = CGRectMake(-w/2, -h/2, w, h);
		
		CGContextRef c = UIGraphicsGetCurrentContext();
		CGContextBeginPath(c);
		
		// draw range
		CGContextSetLineWidth(c, rangeLineWidth);
		CGContextSetLineCap(c, kCGLineCapRound);
		CGContextMoveToPoint(c, w/2, 0);
		CGContextAddLineToPoint(c, w/2, h);
		CGContextSetRGBStrokeColor(c, 0, 0, 0, 1);
		CGContextStrokePath(c);
		
		// draw slider
		int sliderHeight = 10;
		CGRect slider = CGRectMake(0, (h/2-sliderHeight/2), w, sliderHeight);
		CGContextAddRect(c, slider);
		CGContextSetRGBFillColor(c, .8, .8, .8, 1);
		CGContextFillPath(c);
	}
}

@end
