//
//  DllNewFeatureCell.m
//  DllWeibo
//
//  Created by zcdll on 16/5/10.
//  Copyright © 2016年 ZC. All rights reserved.
//

#import "DllNewFeatureCell.h"
#import "DllTabBarController.h"
#import "UIImage+Image.h"
#import "UIView+Frame.h"

@interface DllNewFeatureCell ()

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UIButton *shareButton;

@property (nonatomic, weak) UIButton *startButton;

@end

@implementation DllNewFeatureCell

-(UIButton *)shareButton{
    
    if (_shareButton == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"分享给大家"  forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        
        [self.contentView addSubview:btn];
        
        _shareButton = btn;
        
    }
    return _shareButton;
    
}

-(UIButton *)startButton{
    
    if (_startButton == nil) {
        
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [startBtn sizeToFit];
        [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:startBtn];
        _startButton = startBtn;
        
    }
    
    return _startButton;
    
}

-(UIImageView *)imageView{
    
    if (_imageView == nil) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        
        _imageView = imageV;
        
        // 注意：一定要加在contentView上面
        [self.contentView addSubview:imageV];

        
    }
    return _imageView;
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    // 分享按钮
    self.shareButton.center = CGPointMake(self.width * 0.5, self.height * 0.8);
    
    // 开始按钮
    self.startButton.center = CGPointMake(self.width * 0.5 + 5, self.height * 0.88);
    
}

- (void)setImage:(UIImage *)image{
    
    _image = image;
    
    self.imageView.image = image;
    
}

// 判断当前cell是否是最后一页
- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count{
    
    if (indexPath.row == count -1) { //最后一页，显示分享和开始按钮
        
        self.shareButton.hidden = NO;
        self.startButton.hidden = NO;
        
    } else { //非最后一页，隐藏分享和开始按钮
        
        self.shareButton.hidden = YES;
        self.startButton.hidden = YES;
        
    }
    
}

//点击开始微博按钮的时候调用
- (void)start{
    
    // 创建tabBarVc
    DllTabBarController *tabBarVc = [[DllTabBarController alloc] init];
    
    // 设置窗口的根控制器
    self.window.rootViewController = tabBarVc;
    
}

@end
