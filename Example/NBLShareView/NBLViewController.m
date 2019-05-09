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
    NBLShareItem *shareItem0 = [NBLShareItem createItemForShareToWXFriendWithHandler:^(NBLShareItem * _Nonnull shareItem) {
        NSLog(@"分享给微信好友");
    }];
    NBLShareItem *shareItem1 = [NBLShareItem createItemForShareToWXTimelineWithHandler:^(NBLShareItem * _Nonnull shareItem) {
        NSLog(@"分享到微信朋友圈");
    }];
    NBLShareItem *shareItem2 = [NBLShareItem createItemForShareToQQWithHandler:^(NBLShareItem * _Nonnull shareItem) {
        NSLog(@"分享到QQ");
    }];
    NBLShareItem *shareItem3 = [NBLShareItem createItemForCopyLinkWithHandler:^(NBLShareItem * _Nonnull shareItem) {
        NSLog(@"复制链接");
    }];
    NBLShareItem *shareItem4 = [NBLShareItem createItemForSaveToAlbumWithHandler:^(NBLShareItem * _Nonnull shareItem) {
        NSLog(@"保存到相册");
    }];
    [NBLShareView show:@[shareItem0, shareItem1, shareItem2, shareItem3, shareItem4]];
}

@end
