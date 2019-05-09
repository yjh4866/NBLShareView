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

+ (instancetype)show:(NSArray<NBLShareItem *> *)shareItems
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    // 获取分享视图
    NBLShareView *shareView = [bundle loadNibNamed:@"NBLShareView.bundle/NBLShareView" owner:nil options:nil][0];
    shareView.shareItems = shareItems;
    // 注册Cell
    [shareView.collectionView registerNib:[UINib nibWithNibName:@"NBLShareView.bundle/NBLShareCell" bundle:bundle] forCellWithReuseIdentifier:CellId_ShareItem];
    // 显示
    [[NBLShareView frontWindow] addSubview:shareView];
    shareView.frame = CGRectMake(0, 0, shareView.superview.frame.size.width, shareView.superview.frame.size.height);
    
    // 动画展现
    shareView.coverView.alpha = 0;
    shareView.contentView.center = CGPointMake(shareView.contentView.bounds.size.width/2, shareView.bounds.size.height+shareView.bounds.size.height/2);
    [UIView animateWithDuration:0.3f animations:^{
        shareView.coverView.alpha = 1;
        shareView.contentView.center = CGPointMake(shareView.contentView.bounds.size.width/2, shareView.bounds.size.height-shareView.bounds.size.height/2);
    }];
    return shareView;
}

- (void)close:(void(^)(void))completion
{
    // 动画关闭
    [UIView animateWithDuration:0.3f animations:^{
        self.coverView.alpha = 0;
        self.contentView.center = CGPointMake(self.superview.bounds.size.width/2, self.superview.bounds.size.height+self.bounds.size.height/2);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}

#pragma mark - Event

- (IBAction)clickClose:(id)sender
{
    [self close:nil];
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
    // 关闭
    [self close:^{
        // 关闭动画完成后再回调
        if (shareItem.handler) {
            shareItem.handler(shareItem);
        }
    }];
}


#pragma mark - Private

+ (UIWindow *)frontWindow
{
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowKeyWindow = window.isKeyWindow;
        
        if(windowOnMainScreen && windowIsVisible && windowKeyWindow) {
            return window;
        }
    }
    return nil;
}

@end
