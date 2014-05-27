//
//  EditorViewController.m
//  CoreNumber02
//
//  Created by keta on 2014/05/18.
//  Copyright (c) 2014年 Keisuke Ueda. All rights reserved.
//

#import "EditorViewController.h"
#import "NoteManager.h"
#import <QuartzCore/QuartzCore.h>

@interface EditorViewController ()

@end

@implementation EditorViewController {
    int _row;
}
UITextField *title;
Note *note;

- (void)initCommon
{
    note = [[Note alloc] init];
    _row = -1;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }

    [self initCommon];

    return self;
}



- (id)initWithCoder:(NSCoder*)coder
{
	self = [super initWithCoder:coder];
	if( self == nil )
		return nil;

    [self initCommon];

	return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    title = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, 100, 44)];
    title.contentMode = UIViewContentModeScaleAspectFit;

    if( _row == -1 )
    {
        [title setText:@"Tap to change filename"];
    }
    else
    {
        NSArray *list = [[NoteManager sharedManager] list];
        NSString *filename = [list objectAtIndex:_row];
        note = [[NoteManager sharedManager] load:filename];
        [title setText:note.title];
        [_textView setText:note.contents];
    }

	self.navigationItem.titleView = title;
	_textView.layer.borderWidth = 1.0f;
	_textView.layer.cornerRadius = 5.0f;
	_textView.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)save:(id)sender
{
    note.title = [title text];
    note.contents = [_textView text];
    [[NoteManager sharedManager] save:note];

    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void) scrollToVisible:(UITextView *)textView
{
    if ([textView isFirstResponder] && textView.selectedTextRange.end) {
        CGRect caretRect = [textView caretRectForPosition:textView.selectedTextRange.end];
        [textView scrollRectToVisible:caretRect animated:YES];
    }
}

-(void) textViewDidBeginEditing:(UITextView *)textView
{
    [self performSelector:@selector(scrollToVisible:) withObject:textView afterDelay:0.3];

	
	CGRect f = self.view.frame;
	f.origin.x = 10;
	f.origin.y = 75;
	f.size.height -= 300;
	f.size.width -= 20;
	textView.frame = f;

}

- (void)textViewDidEndEditing: (UITextView *)textView
{
	CGRect f = self.view.frame;
	f.origin.x = 10;
	f.origin.y = 75;
	f.size.height -= 10 + 75;
	f.size.width -= 20;
	textView.frame = f;
}

- (void) textViewDidChangeSelection:(UITextView *)textView
{
    [self performSelector:@selector(scrollToVisible:) withObject:textView afterDelay:0.1];


}

-(void) textViewDidChange:(UITextView *)textView
{
    [self performSelector:@selector(scrollToVisible:) withObject:textView afterDelay:0.2];
	
}



@end
