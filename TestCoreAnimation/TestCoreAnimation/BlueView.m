//
//  BlueView.m
//  TestCoreAnimation
//
//  Created by apple on 16/4/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor blueColor];
    }
    
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"I am blue view!");
}

@end
