//
//  ColorDescription.m
//  MyColorBoard
//
//  Created by 张润峰 on 15/11/23.
//  Copyright © 2015年 张润峰. All rights reserved.
//

#import "ColorDescription.h"

@implementation ColorDescription

- (instancetype)init{
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:1
                                 green:1
                                  blue:1
                                 alpha:1];
        _name = @"White";
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        _color = [aDecoder decodeObjectForKey:@"color"];
        _name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.color forKey:@"color"];
    [aCoder encodeObject:self.name forKey:@"name"];
}

@end
