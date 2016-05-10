//
//  ViewController.m
//  TestViewBasedAnimation
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //[self simpleAnimation];
    //[self repeatAnimation];
    [self reverseAnimation];
}

-(void)simpleAnimation
{
//    [UIView animateWithDuration:2.0 animations:^{
//        self.blueView.alpha = 0.0;
//        self.redView.alpha = 0.0;
//    }];
    
    
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionNone animations:^{
        self.blueView.alpha = 0.0;
        self.redView.alpha = 0.0;
    } completion:nil];
    
}

-(void) nestAnimation
{
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionNone animations:^{
        self.blueView.alpha = 0.0;
        
        [UIView animateWithDuration:5.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionNone|UIViewAnimationOptionOverrideInheritedCurve | UIViewAnimationOptionOverrideInheritedDuration animations:^{
            self.redView.alpha = 0.0;
        } completion:nil];
        
    } completion:nil];
    
}

-(void)repeatAnimation
{
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionNone animations:^{
        [UIView setAnimationRepeatCount:3];
        self.blueView.alpha = 0.0;
        self.redView.alpha = 0.0;
    } completion:nil];
}

-(void)reverseAnimation
{
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionNone |UIViewAnimationOptionAutoreverse animations:^{
        [UIView setAnimationRepeatCount:2.5];
        self.blueView.alpha = 0.0;
        self.redView.alpha = 0.0;
    } completion:nil];
}


@end
