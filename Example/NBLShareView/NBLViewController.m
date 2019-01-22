//
//  NBLViewController.m
//  NBLShareView
//
//  Created by 杨建红 on 01/22/2019.
//  Copyright (c) 2019 杨建红. All rights reserved.
//

#import "NBLViewController.h"
#import <NBLShareView/NBLShareView.h>

@interface NBLViewController ()

@end

@implementation NBLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickShare:(id)sender
{
    NBLShareItem *shareItem0 = [NBLShareItem createWithIcon:[UIImage imageNamed:@"share_friend"] andTitle:@"分享到微信" handler:^(NBLShareItem * _Nonnull shareItem) {
        NSLog(@"分享到微信");
    }];
    NBLShareItem *shareItem1 = [NBLShareItem createWithIcon:[UIImage imageNamed:@"share_friend"] andTitle:@"分享到朋友圈" handler:^(NBLShareItem * _Nonnull shareItem) {
        NSLog(@"分享到朋友圈");
    }];
    NBLShareView *shareView = [NBLShareView show:@[shareItem0, shareItem1, shareItem0, shareItem1, shareItem0, shareItem1, shareItem0, shareItem1, shareItem0, shareItem1, shareItem0, shareItem1, shareItem0, shareItem1, shareItem0, shareItem1, shareItem1] on:self.view];
    shareView.minimumLineSpacing = 80;
}

@end
