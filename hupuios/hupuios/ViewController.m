//
//  ViewController.m
//  hupuiOS
//
//  Created by xunan on 2020/2/12.
//  Copyright © 2020 centanet. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) FirstViewController *fristVC;
@property (strong, nonatomic) SecondViewController *secondVC;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        #ifdef DEBUG
            [[WHDebugToolManager sharedInstance] toggleWith:DebugToolTypeAll];
        #endif

    [self addChildViewController:self.fristVC];
    [self addChildViewController:self.secondVC];
    
    [self.scrollView addSubview:self.fristVC.view];
    [self.scrollView addSubview:self.secondVC.view];
    
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 0);
    
}

- (IBAction)flutterBtnClick:(UIButton *)sender {
    
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] init];
    //此处是设置路由跳转的
    [flutterViewController setInitialRoute:@"list"];
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

- (IBAction)firstBtnClick:(id)sender {
    self.scrollView.contentOffset = CGPointMake(0, 0);
    
}
- (IBAction)secondBtnClick:(id)sender {
    self.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
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


- (FirstViewController *)fristVC {
    if (!_fristVC) {
        _fristVC = [[FirstViewController alloc] init];
        [_fristVC setInitialRoute:@"/first"];
        _fristVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.scrollView.frame.size.height);
        FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                                methodChannelWithName:@"samples.flutter.dev/battery"
                                                binaryMessenger:(FlutterViewController<FlutterBinaryMessenger> *)_fristVC];
        [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
            NSLog(@"%@", result);
        }];
    }
    return _fristVC;
}

- (SecondViewController *)secondVC {
    if (!_secondVC) {
        _secondVC = [[SecondViewController alloc] init];
        [_secondVC setInitialRoute:@"/second"];
        _secondVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width,
                                          0,
                                          [UIScreen mainScreen].bounds.size.width,
                                          self.scrollView.frame.size.height);
        
    }
    return _secondVC;
}

@end
