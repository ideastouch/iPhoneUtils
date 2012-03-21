//
//  PickerDataSourceWithBackground.h
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

#import <Foundation/Foundation.h>

@interface PickerDataSourceWithBackground : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
- (id)initWithPickerView: (UIPickerView*)pickerView 
   andPickerViewDelegate: (id<UIPickerViewDataSource, UIPickerViewDelegate>) delegate
           andBackground: (UIColor*)background;

- (void)resetDataSource: (UIPickerView*)pickerView
  andPickerViewDelegate:(id<UIPickerViewDataSource, UIPickerViewDelegate>) delegate;
@end