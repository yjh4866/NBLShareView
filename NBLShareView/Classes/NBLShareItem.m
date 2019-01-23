//
//  NBLShareItem.m
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/22.
//

#import "NBLShareItem.h"
#import "NBLShareView.h"

@implementation NBLShareItem

// 创建指定图标和文本的分享项
+ (instancetype)createWithIcon:(UIImage *)icon andTitle:(NSString *)title handler:(void(^)(NBLShareItem *shareItem))handler
{
    NBLShareItem *shareItem = [[NBLShareItem alloc] init];
    shareItem.icon = icon;
    shareItem.title = title;
    shareItem.handler = handler;
    return shareItem;
}

// 创建“分享到微信”分享项
+ (instancetype)createItemForShareToWXFriendWithHandler:(void(^)(NBLShareItem *shareItem))handler
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShareView.self];
    UIImage *icon = [UIImage imageNamed:@"NBLShareView.bundle/WeiXinFriend" inBundle:bundle compatibleWithTraitCollection:nil];
    //
    return [NBLShareItem createWithIcon:icon andTitle:@"分享给好友" handler:handler];
}
// 创建“分享到朋友圈”分享项
+ (instancetype)createItemForShareToWXTimelineWithHandler:(void(^)(NBLShareItem *shareItem))handler
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShareView.self];
    UIImage *icon = [UIImage imageNamed:@"NBLShareView.bundle/WeiXinTimeline" inBundle:bundle compatibleWithTraitCollection:nil];
    //
    return [NBLShareItem createWithIcon:icon andTitle:@"分享到朋友圈" handler:handler];
}
// 创建“分享到QQ”分享项
+ (instancetype)createItemForShareToQQWithHandler:(void(^)(NBLShareItem *shareItem))handler
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShareView.self];
    UIImage *icon = [UIImage imageNamed:@"NBLShareView.bundle/QQ" inBundle:bundle compatibleWithTraitCollection:nil];
    //
    return [NBLShareItem createWithIcon:icon andTitle:@"分享到QQ" handler:handler];
}
// 创建“复制链接”分享项
+ (instancetype)createItemForCopyLinkWithHandler:(void(^)(NBLShareItem *shareItem))handler
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShareView.self];
    UIImage *icon = [UIImage imageNamed:@"NBLShareView.bundle/CopyLink" inBundle:bundle compatibleWithTraitCollection:nil];
    //
    return [NBLShareItem createWithIcon:icon andTitle:@"复制链接" handler:handler];
}
// 创建“保存到相册”分享项
+ (instancetype)createItemForSaveToAlbumWithHandler:(void(^)(NBLShareItem *shareItem))handler
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShareView.self];
    UIImage *icon = [UIImage imageNamed:@"NBLShareView.bundle/SaveToAlbum" inBundle:bundle compatibleWithTraitCollection:nil];
    //
    return [NBLShareItem createWithIcon:icon andTitle:@"保存到相册" handler:handler];
}

@end
