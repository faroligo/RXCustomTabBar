//
//  RumexCustomTabBar.m
//  
//
//  Created by Oliver Farago on 19/06/2010.
//  Copyright 2010 Rumex IT All rights reserved.
//

#import "RXCustomTabBar.h"

@implementation RXCustomTabBar

@synthesize btn1, btn2, btn3, btn4;

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[self hideTabBar];
	[self addCustomElements];
}

- (void)hideTabBar
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

- (void)hideNewTabBar 
{
    self.btn1.hidden = 1;
    self.btn2.hidden = 1;
    self.btn3.hidden = 1;
    self.btn4.hidden = 1;
}

- (void)showNewTabBar 
{
    self.btn1.hidden = 0;
    self.btn2.hidden = 0;
    self.btn3.hidden = 0;
    self.btn4.hidden = 0;
}

-(void)addCustomElements
{
	// Initialise our two images
	UIImage *btnImage = [UIImage imageNamed:@"NavBar_01.png"];
	UIImage *btnImageSelected = [UIImage imageNamed:@"NavBar_01_s.png"];
	
	self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom]; //Setup the button
	btn1.frame = CGRectMake(0, 430, 80, 50); // Set the frame (size and position) of the button)
	[btn1 setBackgroundImage:btnImage forState:UIControlStateNormal]; // Set the image for the normal state of the button
	[btn1 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; // Set the image for the selected state of the button
	[btn1 setTag:0]; // Assign the button a "tag" so when our "click" event is called we know which button was pressed.
	[btn1 setSelected:true]; // Set this button as selected (we will select the others to false as we only want Tab 1 to be selected initially
	
	// Now we repeat the process for the other buttons
	btnImage = [UIImage imageNamed:@"NavBar_02.png"];
	btnImageSelected = [UIImage imageNamed:@"NavBar_02_s.png"];
	self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn2.frame = CGRectMake(80, 430, 80, 50);
	[btn2 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[btn2 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
	[btn2 setTag:1];
	
	btnImage = [UIImage imageNamed:@"NavBar_03.png"];
	btnImageSelected = [UIImage imageNamed:@"NavBar_03_s.png"];
	self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn3.frame = CGRectMake(160, 430, 80, 50);
	[btn3 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[btn3 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
	[btn3 setTag:2];
	
	btnImage = [UIImage imageNamed:@"NavBar_04.png"];
	btnImageSelected = [UIImage imageNamed:@"NavBar_04_s.png"];
	self.btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn4.frame = CGRectMake(240, 430, 80, 50);
	[btn4 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[btn4 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
	[btn4 setTag:3];
	
	// Add my new buttons to the view
	[self.view addSubview:btn1];
	[self.view addSubview:btn2];
	[self.view addSubview:btn3];
	[self.view addSubview:btn4];
	
	// Setup event handlers so that the buttonClicked method will respond to the touch up inside event.
	[btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClicked:(id)sender
{
	int tagNum = [sender tag];
	[self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
	switch(tabID)
	{
		case 0:
			[btn1 setSelected:true];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
			[btn4 setSelected:false];
			break;
		case 1:
			[btn1 setSelected:false];
			[btn2 setSelected:true];
			[btn3 setSelected:false];
			[btn4 setSelected:false];
			break;
		case 2:
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:true];
			[btn4 setSelected:false];
			break;
		case 3:
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
			[btn4 setSelected:true];
			break;
	}	
	
	self.selectedIndex = tabID;
	
	
}

- (void)dealloc {
	[btn1 release];
	[btn2 release];
	[btn3 release];
	[btn4 release];

    [super dealloc];
}

@end
