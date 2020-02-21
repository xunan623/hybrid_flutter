//
//  ViewController.m
//  hupuiOS
//
//  Created by xunan on 2020/2/12.
//  Copyright © 2020 centanet. All rights reserved.
//

#import "ListViewController.h"
#import <Flutter/Flutter.h>

// flutter_boost
#import "FirstController.h"
#import "SecondController.h"
#import "ThirdController.h"

@interface ListViewController ()

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) FirstController *fristBootVC;
@property (strong, nonatomic) SecondController *secondBootVC;
@property (strong, nonatomic) ThirdController *thirdBootVC;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 0);

    
    // flutter_boost优化后的页面
    [self addChildViewController:self.fristBootVC];
    [self addChildViewController:self.secondBootVC];
    [self addChildViewController:self.thirdBootVC];

    [self.scrollView addSubview:self.fristBootVC.view];
    [self.scrollView addSubview:self.secondBootVC.view];
    [self.scrollView addSubview:self.thirdBootVC.view];

}



- (IBAction)firstBtnClick:(id)sender {
    self.scrollView.contentOffset = CGPointMake(0, 0);
    
}
- (IBAction)secondBtnClick:(id)sender {
    self.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
}

- (IBAction)thirdClick:(UIButton *)sender {
    self.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 2, 0);

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        
        if (scrollView == self.scrollView && self.scrollView.contentOffset.y == 0) {
            
            NSInteger pageIndex = self.scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
            
            self.currentIndex = pageIndex;
            
        }
    }
    
}



- (FirstController *)fristBootVC {
    if (!_fristBootVC) {
        _fristBootVC = [[FirstController alloc] init];
        [_fristBootVC setName:@"first" params:@{}];
        _fristBootVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.scrollView.frame.size.height);
    }
    return _fristBootVC;
}

- (SecondController *)secondBootVC {
    if (!_secondBootVC) {
        _secondBootVC = [[SecondController alloc] init];
        [_secondBootVC setName:@"second" params:@{}];
        _secondBootVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width,
                                          0,
                                          [UIScreen mainScreen].bounds.size.width,
                                          self.scrollView.frame.size.height);

    }
    return _secondBootVC;
}

- (ThirdController *)thirdBootVC {
    if (!_thirdBootVC) {
        _thirdBootVC = [[ThirdController alloc] init];
        [_thirdBootVC setName:@"third" params:@{}];
        _thirdBootVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 2,
                                          0,
                                          [UIScreen mainScreen].bounds.size.width,
                                          self.scrollView.frame.size.height);
    }
    return _thirdBootVC;
}

@end
