//
//  NBLShareCell.h
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/22.
//

#import <UIKit/UIKit.h>
#import "NBLShareItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NBLShareCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (nonatomic, strong) NBLShareItem *shareItem;

@end

NS_ASSUME_NONNULL_END
