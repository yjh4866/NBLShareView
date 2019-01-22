//
//  NBLShareItem.m
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/22.
//

#import "NBLShareItem.h"

@implementation NBLShareItem

+ (instancetype)createWithIcon:(UIImage *)icon andTitle:(NSString *)title handler:(void(^)(NBLShareItem *shareItem))handler
{
    NBLShareItem *shareItem = [[NBLShareItem alloc] init];
    shareItem.icon = icon;
    shareItem.title = title;
    shareItem.handler = handler;
    return shareItem;
}

@end
