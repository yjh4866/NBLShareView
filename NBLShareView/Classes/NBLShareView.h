//
//  NBLShareView.h
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/22.
//

#import <UIKit/UIKit.h>
#import "NBLShareItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NBLShareView : UIView

// 分享项尺寸。默认为80x80
@property (nonatomic, assign) CGSize shareCellSize;
// 每行的分享项数量。默认为4
@property (nonatomic, assign) NSUInteger numberPreLine;
// 行距。默认为20
@property (nonatomic, assign) CGFloat minimumLineSpacing;

+ (instancetype)show:(NSArray<NBLShareItem *> *)shareItems on:(UIView *)superView;

- (void)close;

@end

NS_ASSUME_NONNULL_END
