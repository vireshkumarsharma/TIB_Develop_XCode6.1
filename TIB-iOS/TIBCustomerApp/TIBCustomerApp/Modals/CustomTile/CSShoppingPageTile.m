//
//  CStileForShoppingPage.m
//  CustomerApp
//
//  Created by Vaishali Gupta on 10/29/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import "CSShoppingPageTile.h"

@implementation CSShoppingPageTile

-(id) initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
        self.layer.shouldRasterize = YES;
        
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0.0, 4.0);
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.0;
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 2.0f;
        
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        backgroundView.backgroundColor =[UIColor whiteColor];
        self.contentView.backgroundColor =[UIColor whiteColor] ;
        
        UIImageView *temp=[[UIImageView alloc] init];
        temp.backgroundColor=[UIColor clearColor];
        self.imvIcon=temp;
        self.imvIcon.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:self.imvIcon];
        
        UIImageView *tempIcon=[[UIImageView alloc] init];
        tempIcon.backgroundColor=[UIColor clearColor];
        self.imvTile=tempIcon;
        self.imvTile.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:self.imvTile];
        
        UILabel *lblTemp = [[UILabel alloc] init];
        lblTemp.numberOfLines = 0;
        lblTemp.backgroundColor = [UIColor clearColor];
        self.lblTitle = lblTemp;
        self.lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
        self.lblTitle.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:self.lblTitle];
        
        UILabel *lblTempSubTitle = [[UILabel alloc] init];
        lblTempSubTitle.numberOfLines = 0;
        lblTempSubTitle.backgroundColor = [UIColor clearColor];
        lblTempSubTitle.textAlignment = NSTextAlignmentLeft;
        self.lblSubTitle = lblTempSubTitle;
        
        self.lblSubTitle.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.lblSubTitle];
        
    }
    return self;
}

- (NSDictionary *)textAttributesForTitle
{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.hyphenationFactor = 1.0;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    return @{
             NSFontAttributeName : [UIFont boldSystemFontOfSize:14.0],
             NSForegroundColorAttributeName : [UIColor blackColor],
             NSParagraphStyleAttributeName : paragraphStyle
             };
}

- (NSDictionary *)textAttributesForSubtitle
{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.hyphenationFactor = 1.0;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    return @{
             NSFontAttributeName : [UIFont systemFontOfSize:12.0],
             NSForegroundColorAttributeName : [UIColor blackColor],
             NSParagraphStyleAttributeName : paragraphStyle
             };
}



-(void) setDataFromModalForShoppingPage:(CSmodalShoppingPage *)modal
{
    self.imvTile.image=modal.imgTile;
    self.imvIcon.image=modal.imgIcon;
    
    self.lblTitle.attributedText=[[NSAttributedString alloc]initWithString:modal.strTitle attributes: [self textAttributesForTitle]];
    self.lblSubTitle.attributedText=[[NSAttributedString alloc]initWithString:modal.strSubTitle attributes: [self textAttributesForSubtitle]];
    
    
}



-(void) setConstraints{
    
    NSDictionary *views = [[NSDictionary alloc] initWithObjectsAndKeys: self.imvTile,@"imvTile",self.imvIcon,@"imvIcon",self.lblSubTitle,@"lblSubTitle",self.lblTitle,@"lblTitle", nil];
    
    CGFloat height = self.frame.size.height-10;
    
    CGFloat iconWidth = self.imvIcon.frame.size.width;
    
    CGFloat iconHeight = self.imvIcon.frame.size.height;
    
    
    NSDictionary *metrices = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithFloat:height],@"height",[NSNumber numberWithFloat:iconWidth],@"iconWidth",[NSNumber numberWithFloat:iconHeight],@"iconHeight",nil ];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[imvTile(height)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrices views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[imvTile]-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    
    
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[imvIcon(30)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrices views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[imvTile]-8-[imvIcon(20)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrices views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[imvIcon]-3-[lblTitle]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrices views:views]];
    
    
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[lblTitle]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrices views:views]];
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[imvTile]-8-[lblSubTitle]-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrices views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-18-[lblTitle]-8-[lblSubTitle]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrices views:views]];
    
}

@end
