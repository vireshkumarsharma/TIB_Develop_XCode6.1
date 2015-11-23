//
//  CustomTile.h
//  Tiles
//
//  Created by Vaishali Gupta on 10/12/15.
//  Copyright (c) 2015 Anil K. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "TileModal.h"


typedef enum : NSUInteger {
    UICollectionViewCellStyleDefault,
    UICollectionViewCellStyleSubtitle,
} UICollectionViewCellStyle;




@interface CustomTile : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imvIcon;

@property (nonatomic, weak) IBOutlet UILabel *lblTitle;

@property (nonatomic, weak) IBOutlet UILabel *lblSubTitle;

@property (nonatomic, weak)  UIView *bgView;

@property (nonatomic,assign) BOOL bIsSelected;


@property (nonatomic, assign) UICollectionViewCellStyle style;

-(void) createConstraints : (TileModal *) modal;

-(void) setDataFromModal:(TileModal *)tileModal;

- (void) showScaleAnimation;

@end
