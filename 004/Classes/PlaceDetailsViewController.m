//
//  PlaceDetailsViewController.m
//  TapPlace
//
//  Created by Thomas Balthazar on 30/08/10.
//  Copyright 2010 Suit My Mind SPRL. All rights reserved.
//

#import "PlaceDetailsViewController.h"
#import "Place.h"

@interface PlaceDetailsViewController ()
- (void)setupButtonsForEditing:(BOOL)editing;
@end


@implementation PlaceDetailsViewController

@synthesize textView, place;


#pragma mark -
#pragma mark Override the designated initializer

- (id)init {
	if (self = [super initWithNibName:@"PlaceDetailsViewController" bundle:nil]) {
		// init code here
	}
	
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];

	self.textView.text = self.place.name;
	[self setupButtonsForEditing:NO];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Editing Mode

- (void)edit {
	[self setEditing:YES animated:YES];
}

- (void)cancel {
	[self setEditing:NO animated:YES];
}

- (void)save {
	[self setEditing:NO animated:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];
	[self setupButtonsForEditing:editing];

	if (editing) {
		[self.textView becomeFirstResponder];
	}
	else {
		[self.textView resignFirstResponder];
	}	
}

- (void)setupButtonsForEditing:(BOOL)editing {
	if (editing) {
		// cancel button
		UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(
																					@"Cancel",
																					@"Cancel button") 
																	   style:UIBarButtonItemStyleBordered 
																	  target:self
																	  action:@selector(cancel)];
		[self.navigationItem setLeftBarButtonItem:leftButton 
										 animated:YES];
		[leftButton release];
		
		// save button
		UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(
																					@"Save",
																					@"Save button") 
																		style:UIBarButtonItemStyleBordered 
																	   target:self
																	   action:@selector(save)];
		[self.navigationItem setRightBarButtonItem:rightButton 
										  animated:YES];
		[rightButton release];
	}
	else {
		// back button
		[self.navigationItem setLeftBarButtonItem:self.navigationItem.backBarButtonItem 
										 animated:YES];
		
		// edit button
		UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(
																					@"Edit",
																					@"Edit button") 
																		style:UIBarButtonItemStyleBordered 
																	   target:self
																	   action:@selector(edit)];
		[self.navigationItem setRightBarButtonItem:rightButton 
										  animated:YES];
		[rightButton release];
	}
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[textView release];
	[place release];
	
    [super dealloc];
}


@end
