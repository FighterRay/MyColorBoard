//
//  ColorViewController.m
//  MyColorBoard
//
//  Created by 张润峰 on 15/11/23.
//  Copyright © 2015年 张润峰. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet UITextField *redTextField;
@property (weak, nonatomic) IBOutlet UITextField *greenTextField;
@property (weak, nonatomic) IBOutlet UITextField *blueTextField;
@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    
    UIColor *color = self.colorDescription.color;
    NSLog(@"%@", color);
    
    CGFloat red, green, blue;
    [color getRed:&red
            green:&green
             blue:&blue
            alpha:nil];
    
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    
    self.view.backgroundColor = color;
    self.textField.text = self.colorDescription.name;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (self.existingColor) {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.colorDescription.name = self.textField.text;
    self.colorDescription.color = self.view.backgroundColor;
    
//    BOOL success = [self saveChanges];
//    if (success) {
//        NSLog(@"Save successful !");
//    }else{
//        NSLog(@"Not save successful!");
//    }
}

- (IBAction)dismiss:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:NULL];
}

- (IBAction)changeColor:(id)sender
{
    float red = self.redSlider.value;
    float green = self.greenSlider.value;
    float blue = self.blueSlider.value;
    UIColor *newColor = [UIColor colorWithRed:red
                                        green:green
                                         blue:blue
                                        alpha:1.0];
    
    self.redTextField.text = [NSString stringWithFormat:@"%f", red * 255.0];
    self.greenTextField.text = [NSString stringWithFormat:@"%f", green * 255.0];
    self.blueTextField.text = [NSString stringWithFormat:@"%f", blue * 255.0];

    self.view.backgroundColor = newColor;
}

//- (NSString *)colorDescriptionArchivePath{
//    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentDirectory = [documentDirectories firstObject];
//    return documentDirectory;
//}
//
//- (BOOL)saveChanges{
//    NSString *path = [self colorDescriptionArchivePath];
//    return [NSKeyedArchiver archiveRootObject:self.colorDescription toFile:path];
//}

@end
