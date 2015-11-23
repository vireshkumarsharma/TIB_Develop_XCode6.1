//
//  CStibSegmentControl.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TIBKit/TIBKit.h>


@class TIBSegmentControl;

@protocol SegmentControlDelegate <NSObject>

-(void) tappedSegmentControl:(TIBSegmentControl *)segmentControl onIndex :(NSUInteger ) index;

@end

@interface TIBSegmentControl : UIView

//CAShapeLayer
@property (nonatomic, strong) NSMutableArray *iconLayer;

//CATextLayer
@property (nonatomic, strong) NSMutableArray *textLayerArray;

@property (nonatomic, strong) NSMutableArray *titles;


@property (nonatomic, assign) NSInteger numberOfSegment;

@property (nonatomic, assign) NSInteger selectedSegment;

@property (nonatomic, assign) NSInteger previousSelectedSegment;

@property (nonatomic, assign) CGRect baseRect;

@property (nonatomic, assign) float triangleSideHalfValue;

@property (nonatomic, strong) UIColor* color;

@property (nonatomic, strong) CAShapeLayer* selectedLayer;

@property (nonatomic, weak) id<SegmentControlDelegate> delegate;

-(void) drawSegmentControl;
@end
