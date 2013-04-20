//
//  CustomCell.h
//  Table
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UITextField *cellText;
@property (weak, nonatomic) IBOutlet UISwitch *cellOnOff;

@end
