//
//  ColorViewController.h
//  MyColorBoard
//
//  Created by 张润峰 on 15/11/23.
//  Copyright © 2015年 张润峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorDescription.h"

@interface ColorViewController : UIViewController

@property (nonatomic) BOOL existingColor;
@property (nonatomic) ColorDescription *colorDescription;

@end
