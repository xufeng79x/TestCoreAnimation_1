//
//  TransitionViewController.m
//  TestViewBasedAnimation
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) UIView *currentTextView;

@property (weak, nonatomic) UIView *currentView;
@property (weak, nonatomic) UIView *swapView;
@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentView = self.redView;
    self.swapView = self.blueView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //[self simpleTransition];
    [self simpleTransitionDoingContentAni];
}

-(void)simpleTransition
{
    [UIView transitionWithView:self.containerView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        self.currentView.hidden = YES;
                        self.swapView.hidden = NO;
                    }
                    completion:^(BOOL finished){
                        UIView*    temp = self.currentView;
                        self.currentView = self.swapView;
                        self.swapView = temp;
                    }];
}

-(void)simpleTransitionDoingContentAni
{
    [UIView transitionWithView:self.containerView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCurlUp |   UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
                        self.currentView.hidden = YES;
                        self.swapView.hidden = NO;
                        
                        self.swapView.alpha = 0.0;
                    }
                    completion:^(BOOL finished){
                        UIView*    temp = self.currentView;
                        self.currentView = self.swapView;
                        self.swapView = temp;
                        self.currentView.alpha = 1.0;
                    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
