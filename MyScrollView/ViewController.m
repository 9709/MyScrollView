//
//  ViewController.m
//  MyScrollView
//
//  Created by Matthew Chan on 2019-01-21.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.containerView.bounds = CGRectMake (0, 100, self.containerView.bounds.size.width, self.containerView.bounds.size.height);
    
}

- (IBAction)containerViewWasPanned:(UIPanGestureRecognizer *)sender {
    
    CGPoint translationInView = [sender translationInView:self.view];
    
    // ================================ Assigning to variables and setting limits to bounds ======================================
    float x = self.containerView.bounds.origin.x - translationInView.x;
    if(x < 0){
        x = 0;
    }
    
    if (x > 300) {
        x = 300;
    }

    float y = self.containerView.bounds.origin.y - translationInView.y;
    if (y < 0) {
        y = 0;
    }
    
    if (y > 800) {
        y = 800;
    }
    
    // ===================================== Moving bounds to panned location ============================================================
    self.containerView.bounds = CGRectMake(x,
                                           y,
                                           self.containerView.bounds.size.width,
                                           self.containerView.bounds.size.height);
    
    // ===================================== Setting CGPoint back to Zero ============================================================
    [sender setTranslation:CGPointZero inView:self.view];
    
}


@end
