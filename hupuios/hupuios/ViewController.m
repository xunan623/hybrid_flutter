//
//  ViewController.m
//  hupuiOS
//
//  Created by xunan on 2020/2/12.
//  Copyright © 2020 centanet. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
//#import "FirstViewController.h"
//#import "SecondViewController.h"
#import "ListViewController.h"

// flutter_boost
#import "FirstController.h"
#import "SecondController.h"
#import "ThirdController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//@property (strong, nonatomic) FirstViewController *fristVC;
//@property (strong, nonatomic) SecondViewController *secondVC;

@property (strong, nonatomic) FirstController *fristBootVC;
@property (strong, nonatomic) SecondController *secondBootVC;
@property (strong, nonatomic) ThirdController *thirdBootVC;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    #ifdef DEBUG
//        [[WHDebugToolManager sharedInstance] toggleWith:DebugToolTypeAll];
//    #endif
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 0);


}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //注意这行代码不可缺少
    [self.fristBootVC.view setNeedsLayout];
    [self.fristBootVC.view layoutIfNeeded];
    
    [self.secondBootVC.view setNeedsLayout];
    [self.secondBootVC.view layoutIfNeeded];

    [self.thirdBootVC.view setNeedsLayout];
    [self.thirdBootVC.view layoutIfNeeded];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
        // 原始flutter页面
    //    [self addChildViewController:self.fristVC];
    //    [self addChildViewController:self.secondVC];
    //
    //    [self.scrollView addSubview:self.fristVC.view];
    //    [self.scrollView addSubview:self.secondVC.view];
        
        // flutter_boost优化后的页面
        [self addChildViewController:self.fristBootVC];
        [self addChildViewController:self.secondBootVC];
        [self addChildViewController:self.thirdBootVC];

        [self.scrollView addSubview:self.fristBootVC.view];
        [self.scrollView addSubview:self.secondBootVC.view];
        [self.scrollView addSubview:self.thirdBootVC.view];

    
}

- (IBAction)flutterBtnClick:(UIButton *)sender {
//    FLBFlutterViewContainer *list = [[FLBFlutterViewContainer alloc] init];
//    [list setName:@"list" params:@{}];
//    [self.navigationController pushViewController:list animated:YES];

//    FlutterViewController* flutterViewController = [[FlutterViewController alloc] init];
//    //此处是设置路由跳转的
//    [flutterViewController setInitialRoute:@"list"];
//    [self.navigationController pushViewController:flutterViewController animated:YES];
    
    ListViewController *vc =[ListViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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


//- (FirstViewController *)fristVC {
//    if (!_fristVC) {
//        _fristVC = [[FirstViewController alloc] init];
//        [_fristVC setInitialRoute:@"/first"];
//        _fristVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.scrollView.frame.size.height );
//        FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
//                                                methodChannelWithName:@"samples.flutter.dev/battery"
//                                                binaryMessenger:(FlutterViewController<FlutterBinaryMessenger> *)_fristVC];
//        [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
//            NSLog(@"%@", result);
//        }];
//    }
//    return _fristVC;
//}
//
//- (SecondViewController *)secondVC {
//    if (!_secondVC) {
//        _secondVC = [[SecondViewController alloc] init];
//        [_secondVC setInitialRoute:@"/second"];
//        _secondVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width,
//                                          0,
//                                          [UIScreen mainScreen].bounds.size.width,
//                                          self.scrollView.frame.size.height);
//
//    }
//    return _secondVC;
//}


- (FirstController *)fristBootVC {
    if (!_fristBootVC) {
        _fristBootVC = [[FirstController alloc] init];
        [_fristBootVC setName:@"vpdemo://flutter/first" params:@{}];
        _fristBootVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.scrollView.frame.size.height);
    }
    return _fristBootVC;
}

- (SecondController *)secondBootVC {
    if (!_secondBootVC) {
        _secondBootVC = [[SecondController alloc] init];
        [_secondBootVC setName:@"vpdemo://flutter/second" params:@{}];
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
        [_thirdBootVC setName:@"vpdemo://flutter/third" params:@{}];
        _thirdBootVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 2,
                                          0,
                                          [UIScreen mainScreen].bounds.size.width,
                                          self.scrollView.frame.size.height);
    }
    return _thirdBootVC;
}

@end
