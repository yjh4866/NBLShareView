//
//  NBLShareItem.h
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBLShareItem : NSObject

@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, copy) void (^handler)(NBLShareItem *shareItem);

// 创建指定图标和文本的分享项
+ (instancetype)createWithIcon:(UIImage *)icon andTitle:(NSString *)title handler:(void(^)(NBLShareItem *shareItem))handler;

// 创建“分享到微信”分享项
+ (instancetype)createItemForShareToWXFriendWithHandler:(void(^)(NBLShareItem *shareItem))handler;
// 创建“分享到朋友圈”分享项
+ (instancetype)createItemForShareToWXTimelineWithHandler:(void(^)(NBLShareItem *shareItem))handler;
// 创建“分享到QQ”分享项
+ (instancetype)createItemForShareToQQWithHandler:(void(^)(NBLShareItem *shareItem))handler;
// 创建“复制链接”分享项
+ (instancetype)createItemForCopyLinkWithHandler:(void(^)(NBLShareItem *shareItem))handler;
// 创建“保存到相册”分享项
+ (instancetype)createItemForSaveToAlbumWithHandler:(void(^)(NBLShareItem *shareItem))handler;

@end

NS_ASSUME_NONNULL_END
