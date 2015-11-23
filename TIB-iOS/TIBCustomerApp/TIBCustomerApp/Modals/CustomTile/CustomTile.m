//
//  CustomTile.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//



#import "CustomTile.h"


@implementation CustomTile


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
        self.layer.shouldRasterize = YES;
        
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0.0, 4.0);
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.0;
        
        
        
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _bgView = temp;
        [_bgView setBackgroundColor:[UIColor whiteColor]];
        temp.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:_bgView];
        [self sendSubviewToBack:_bgView];
        
        
        UIImageView *imv = [[UIImageView alloc] init];
        imv.backgroundColor = [UIColor clearColor];
        self.imvIcon = imv;
        self.imvIcon.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.imvIcon];
        
        UILabel *lblTemp = [[UILabel alloc] init];
        lblTemp.numberOfLines = 0;
        lblTemp.backgroundColor = [UIColor clearColor];
        self.lblTitle = lblTemp;
        self.lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
        self.lblTitle.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:self.lblTitle];
        
        UILabel *lblTempSubTitle = [[UILabel alloc] init];
        lblTempSubTitle.numberOfLines = 0;
        lblTempSubTitle.backgroundColor = [UIColor clearColor];
        lblTempSubTitle.textAlignment = NSTextAlignmentCenter;
        self.lblSubTitle = lblTempSubTitle;
        
        self.lblSubTitle.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.lblSubTitle];
        self.bIsSelected = YES;
        
        [self updateColors];
        
        
    }
    return self;
}


-(void) createConstraints : (TileModal *) modal{
    
    
    for (NSLayoutConstraint *constraint in self.constraints ) {
        [self removeConstraint:constraint ];
        
    }
    float  imageWidth = modal.imgIcon.size.width;
    
    CGRect frame = self.frame;
    
    NSDictionary *views = [NSDictionary dictionaryWithObjectsAndKeys:self.lblTitle.superview,@"superview",self.imvIcon,@"imvIcon",self.lblTitle,@"lblTitle",self.lblSubTitle,@"lblSubTitle", nil];
    
    
    UIImage *img = modal.imgIcon;
    
    imageWidth = img.size.width;
    
    NSDictionary *metrics = @{@"horizontalSpacing" : @15 , @"verticalSpacing" : @15,};
    
    NSString *strWidth =nil;
    
    NSString *strHeight = nil;
    
    if (self.style == UICollectionViewCellStyleSubtitle) {
        strWidth = [NSString stringWithFormat:@"H:|-%f-[imvIcon(%f)]",ABS(frame.size.width - img.size.width)/2,img.size.width];
        
        strHeight = [NSString stringWithFormat:@"V:|-10-[imvIcon(%f)]-10-[lblTitle(>=20,<=40)]-10-[lblSubTitle]-(<=20)-|",(img.size.height)];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:strWidth options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:strHeight options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-90-[lblTitle]-90-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imvIcon]-10-[lblTitle(>=40,<=80)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblSubTitle]-10-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblTitle]-10-[lblSubTitle]-(<=20)-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
    }else{
        
        float centerX = ABS(frame.size.width - img.size.width)/2;
        
        strWidth = [NSString stringWithFormat:@"H:|-%f-[imvIcon(%f)]",centerX,img.size.width];
        
        strHeight = [NSString stringWithFormat:@"V:|-%f-[imvIcon(%f)]",0.7*ABS(frame.size.width - img.size.width)/2,img.size.width];
        
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:strWidth options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:strHeight options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblTitle]-10-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imvIcon]-10-[lblTitle(>=40)]->=10@200-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lblSubTitle(0)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblSubTitle(0)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:views]];
        
    }
    
}


-(void)setDataFromModal:(TileModal *)tileModal{
    
    self.lblTitle.attributedText = [[NSAttributedString alloc] initWithString:tileModal.strTitle attributes:[self titleAttributesHighlighted:self.bIsSelected]];
    self.lblSubTitle.attributedText = [[NSAttributedString alloc] initWithString:tileModal.strSubTitle attributes:[self subtitleAttributesHighlighted:self.bIsSelected]];
    self.imvIcon.image = tileModal.imgIcon;
    
}

- (void)updateColors{
    self.contentView.backgroundColor = [self backgroundColorHighlighted:self.bIsSelected];
    self.lblTitle.textColor = [self textColorHighlighted:self.bIsSelected];
    self.lblSubTitle.textColor = [self textColorHighlighted:self.bIsSelected];
}

- (NSDictionary *)titleAttributesHighlighted:(BOOL)highlighted
{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.hyphenationFactor = 1.0;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    return @{
             NSFontAttributeName : [UIFont boldSystemFontOfSize:12.0],
             NSForegroundColorAttributeName : [self textColorHighlighted:highlighted],
             NSParagraphStyleAttributeName : paragraphStyle
             };
}

- (NSDictionary *)subtitleAttributesHighlighted:(BOOL)highlighted
{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.hyphenationFactor = 1.0;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    return @{
             NSFontAttributeName : [UIFont systemFontOfSize:12.0],
             NSForegroundColorAttributeName : [self textColorHighlighted:highlighted],
             NSParagraphStyleAttributeName : paragraphStyle
             };
}

- (UIColor *)backgroundColorHighlighted:(BOOL)selected
{
    return  [UIColor colorWithRed:88/255 green:72/255 blue:234/255 alpha:1.0]    ;
}

- (UIColor *)textColorHighlighted:(BOOL)selected
{
    return    [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1.0];
}

- (UIColor *)borderColor
{
    return [[self backgroundColorHighlighted:NO] colorWithAlphaComponent:1.0];
}



-(void) setImgIcon:(UIImage *)imgIcon{
    if (imgIcon) {
        self.imvIcon.image = imgIcon;
    }
}
#pragma mark - UICollectionViewCell

- (void) showScaleAnimation {
    //    [UIView animateWithDuration:0.1 animations:^{
    //        self.transform = CGAffineTransformMakeScale(1.02, 1.02);
    //        self.layer.shadowOpacity = 0.8;
    //    } completion:^(BOOL finished) {
    //        [UIView animateWithDuration:0.1 animations:^{
    //            self.transform = CGAffineTransformIdentity;
    //        }];
    //    }];
}



@end
