//
//  FirstViewController.m
//  hupuiOS
//
//  Created by xunan on 2020/2/12.
//  Copyright © 2020 centanet. All rights reserved.
//

#import "FirstViewController.h"
#import <Masonry/Masonry.h>

@interface FirstViewController ()



@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *centerLabel = [[UILabel alloc] init];
    [self.view addSubview:centerLabel];
    centerLabel.text = @"FirstDemo";
    centerLabel.textColor = [UIColor colorWithRed:200 green:100 blue:100 alpha:1];
    [centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
}

@end
