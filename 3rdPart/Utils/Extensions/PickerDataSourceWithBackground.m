//
//  PickerDataSourceWithBackground.m
//  CinesHoyts
//
//  Created by Gustavo E Halperin on 3/20/12.
//  Copyright (c) 2012 Gustavo E Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "PickerDataSourceWithBackground.h"
#import "UIView+utils.h"

@interface PickerDataSourceWithBackground ()
@property (weak, nonatomic) id<UIPickerViewDataSource, UIPickerViewDelegate> delegate;
@property CGRect frame;
@property (strong, nonatomic) UIColor *background;
@property int count;

@property (nonatomic, strong) NSArray *indices;
@end

@implementation PickerDataSourceWithBackground
@synthesize delegate = _delegate;
@synthesize frame = _frame;
@synthesize background = _background;
@synthesize count = _count;

@synthesize indices = _indices;
- (id)initWithPickerView: (UIPickerView*)pickerView 
   andPickerViewDelegate: (id<UIPickerViewDataSource, UIPickerViewDelegate>) iDelegate
           andBackground: (UIColor*)iBackground
{
    self = [super init];
    if (self) {
        _background = iBackground;
        
        [self resetDataSource:pickerView andPickerViewDelegate:iDelegate];
    }
    return self;
}


- (void)resetDataSource: (UIPickerView*)pickerView
  andPickerViewDelegate: (id<UIPickerViewDataSource, UIPickerViewDelegate>) iDelegate
{
    _frame = CGRectMake(0, 0,
                        [iDelegate pickerView:pickerView widthForComponent:0],
                        [iDelegate pickerView:pickerView rowHeightForComponent:0]);
    _count = [iDelegate pickerView:pickerView numberOfRowsInComponent:0];
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithObjects:
                                    [NSNumber numberWithInt:-4],
                                    [NSNumber numberWithInt:-3], nil];
    for (int index = 0; index < _count; index++) {
        [mutableArray addObject:[NSNumber numberWithInt:index]];
    }
    [mutableArray addObject:[NSNumber numberWithInt:-2]];
    [mutableArray addObject:[NSNumber numberWithInt:-1]];
    _indices = [NSArray arrayWithArray:mutableArray];
    
    _delegate = iDelegate;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [pickerView selectRow:2 inComponent:0 animated:YES];
}

#pragma mark -
#pragma mark UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (_indices){
        return _indices.count;
    }
	return 0;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


#pragma mark -
#pragma mark UIPickerViewDelegate


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (_delegate 
        && [_delegate respondsToSelector:@selector(pickerView:widthForComponent:)]) {
        return [_delegate pickerView:pickerView widthForComponent:component];
    }
    return 0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    if (_delegate 
        && [_delegate respondsToSelector:@selector(pickerView:rowHeightForComponent:)]) {
        return [_delegate pickerView:pickerView rowHeightForComponent:component];
    }
    return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSNumber *indexNumber = [_indices objectAtIndex:row];
    if (indexNumber.intValue >= 0) {
        if (_delegate 
            && [_delegate respondsToSelector:@selector(pickerView:viewForRow:forComponent:reusingView:)]) {
            return [_delegate pickerView:pickerView viewForRow:row-2 forComponent:component reusingView:view];
        }
        return nil;
    }
    CGRect bigFrame;
    switch (indexNumber.intValue) {
        case -4:
        case -1:
            bigFrame = _frame;
            bigFrame.size.height = _frame.size.height * 10;
            bigFrame.origin.y = -_frame.size.height * 9;
            
            view = [[UIView alloc] initWithFrame:bigFrame];
            view.backgroundColor = _background;
            [view insertBorder];
            
            return view;
        case -3:
        case -2:
            view = [[UIView alloc] initWithFrame:_frame];
            view.backgroundColor = _background;
            [view insertBorder];
            
            return view;
            
        default:
            return nil;
    }
    
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (_indices.count <= 4) {
        return;
    }
    switch ([[_indices objectAtIndex:row] intValue]) {
        case -4:
        case -3:
            return [pickerView selectRow:2 inComponent:0 animated:YES];
        case -2:
        case -1:
            return [pickerView selectRow:_indices.count-3 inComponent:0 animated:YES];
            
        default:
            break;
    }
    if (_delegate 
        && [_delegate respondsToSelector:@selector(pickerView:didSelectRow:inComponent:)] ) {
        return [_delegate pickerView:pickerView didSelectRow:row-2 inComponent:component];
    }
}


@end
