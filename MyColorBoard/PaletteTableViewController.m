//
//  PaletteTableViewController.m
//  MyColorBoard
//
//  Created by 张润峰 on 15/11/23.
//  Copyright © 2015年 张润峰. All rights reserved.
//

#import "PaletteTableViewController.h"
#import "ColorDescription.h"
#import "ColorViewController.h"

@interface PaletteTableViewController ()

@property (strong, nonatomic) NSMutableArray *colors;

@end

@implementation PaletteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (NSMutableArray *)colors{
    if (!_colors) {
        _colors = [NSMutableArray array];
        ColorDescription *cd = [[ColorDescription alloc]init];
        [_colors addObject:cd];
    }
    return _colors;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    
    ColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        ColorDescription *color = [[ColorDescription alloc] init];
        [self.colors addObject:color];
        
        UINavigationController *nc = segue.destinationViewController;
        ColorViewController *cvc = (ColorViewController *)[nc topViewController];
        cvc.colorDescription = color;
    } else if ([segue.identifier isEqualToString:@"ExistingColor"]){
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        ColorDescription *color = self.colors[ip.row];
        
        ColorViewController *cvc = segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    }
}

@end
