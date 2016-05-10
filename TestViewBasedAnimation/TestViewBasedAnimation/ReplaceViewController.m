//
//  ReplaceViewController.m
//  TestViewBasedAnimation
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ReplaceViewController.h"

@interface ReplaceViewController ()
@property (weak, nonatomic) IBOutlet UIView *primaryView;
@property (weak, nonatomic) IBOutlet UIView *secondaryView;
@property (assign) BOOL displayingPrimary;

@end

@implementation ReplaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.displayingPrimary = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView transitionFromView:(self.displayingPrimary ? self.primaryView : self.secondaryView)
                        toView:(self.displayingPrimary ? self.secondaryView : self.primaryView)
                      duration:1.0
                       options:(self.displayingPrimary ? UIViewAnimationOptionTransitionFlipFromRight :
                                UIViewAnimationOptionTransitionFlipFromLeft) |UIViewAnimationOptionShowHideTransitionViews 
                    completion:^(BOOL finished) {
                        if (finished) {
                            self.displayingPrimary = !self.displayingPrimary;
                        }
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
