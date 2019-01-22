//
//  NBLShareCell.m
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/22.
//

#import "NBLShareCell.h"

@implementation NBLShareCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addObserver:self forKeyPath:@"shareItem"
                  options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"shareItem"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"shareItem"]) {
        self.imageViewIcon.image = self.shareItem.icon;
        self.labelTitle.text = self.shareItem.title;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
