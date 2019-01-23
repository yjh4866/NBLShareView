//
//  NBLShareView.m
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/22.
//

#import "NBLShareView.h"
#import "NBLShareCell.h"

#define CellId_ShareItem   @"CellId_ShareItem"

@interface NBLShareView () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintCollectionViewHeight;

@property (nonatomic, strong) NSArray<NBLShareItem *> *shareItems;
@end

@implementation NBLShareView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.shareCellSize = CGSizeMake(80, 80);
        self.numberPreLine = 4;
        self.minimumLineSpacing = 20;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat maxHeight = self.coverView.bounds.size.height - 100 - 50;
    self.constraintCollectionViewHeight.constant = self.collectionView.contentSize.height;
    // 最大高度
    if (self.constraintCollectionViewHeight.constant > maxHeight) {
        self.constraintCollectionViewHeight.constant = maxHeight;
    }
}

#pragma mark - Public

+ (instancetype)show:(NSArray<NBLShareItem *> *)shareItems on:(UIView *)superView
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleWithIdentifier:@"org.cocoapods.NBLShareView"];
    // 获取分享视图
    NBLShareView *shareView = [bundle loadNibNamed:@"NBLShareView.bundle/NBLShareView" owner:nil options:nil][0];
    shareView.shareItems = shareItems;
    // 注册
    [shareView.collectionView registerNib:[UINib nibWithNibName:@"NBLShareView.bundle/NBLShareCell" bundle:bundle] forCellWithReuseIdentifier:CellId_ShareItem];
    // 添加到指定视图
    [superView addSubview:shareView];
    // 自定义约束
    shareView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:shareView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:shareView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:shareView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:shareView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [NSLayoutConstraint activateConstraints:@[left, top, right, bottom]];
    
    // 动画展现
    shareView.coverView.alpha = 0;
    shareView.contentView.center = CGPointMake(shareView.contentView.bounds.size.width/2, superView.bounds.size.height+shareView.bounds.size.height/2);
    [UIView animateWithDuration:0.3f animations:^{
        shareView.coverView.alpha = 1;
        shareView.contentView.center = CGPointMake(shareView.contentView.bounds.size.width/2, superView.bounds.size.height-shareView.bounds.size.height/2);
    }];
    return shareView;
}

- (void)close
{
    // 动画关闭
    [UIView animateWithDuration:0.3f animations:^{
        self.coverView.alpha = 0;
        self.contentView.center = CGPointMake(self.superview.bounds.size.width/2, self.superview.bounds.size.height+self.bounds.size.height/2);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - Event

- (IBAction)clickClose:(id)sender
{
    [self close];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shareItems.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NBLShareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellId_ShareItem forIndexPath:indexPath];
    cell.shareItem = self.shareItems[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.shareCellSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (self.numberPreLine < 1) {
        self.numberPreLine = 4;
    }
    CGFloat spacing = (collectionView.bounds.size.width-self.numberPreLine*self.shareCellSize.width) / (self.numberPreLine+1);
    return UIEdgeInsetsMake(35, spacing, 35, spacing);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return self.minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (self.numberPreLine < 1) {
        self.numberPreLine = 4;
    }
    CGFloat spacing = (collectionView.bounds.size.width-self.numberPreLine*self.shareCellSize.width) / (self.numberPreLine+1);
    return spacing;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NBLShareItem *shareItem = self.shareItems[indexPath.row];
    if (shareItem.handler) {
        shareItem.handler(shareItem);
    }
    // 关闭
    [self close];
}

@end
