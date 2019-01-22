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

+ (instancetype)createWithIcon:(UIImage *)icon andTitle:(NSString *)title handler:(void(^)(NBLShareItem *shareItem))handler;

@end

NS_ASSUME_NONNULL_END
