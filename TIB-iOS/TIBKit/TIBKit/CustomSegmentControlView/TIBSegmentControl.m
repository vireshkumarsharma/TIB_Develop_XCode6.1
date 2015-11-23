//
//  CStibSegmentControl.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

//
//  TIBSegmentControl.m
//  CustomerApp
//
//  Created by Anil K on 10/30/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import "TIBSegmentControl.h"

@implementation TIBSegmentControl


#pragma mark touch began

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint locationPoint = [[touches anyObject] locationInView:self];
    
    for (CAShapeLayer *layer in _iconLayer) {
        if (CGPathContainsPoint(layer.path, nil, locationPoint, false)) {
            self.selectedLayer = layer;
            [self updateSelectedLayer:self.selectedLayer];
        }
    }
}

-(void) initialize{
    
    // Making default
    if (_numberOfSegment == 0) {
        _numberOfSegment = 2;
    }
    _selectedSegment = -1;
    _previousSelectedSegment  = -1;
    _triangleSideHalfValue    = 0.0;
    
    self.color = [UIColor whiteColor];
    
    self.backgroundColor = [UIColor whiteColor];
}

-(void) layoutSubviews{
    
    
}

-(void) drawSegmentControl{
    [self initialize];
    
    for (CALayer *layer in self.iconLayer) {
        [layer removeFromSuperlayer];
    }
    
    self.iconLayer = [[NSMutableArray alloc] init];
    self.textLayerArray = [[NSMutableArray alloc] init];
    
    [self drawLayer];
    
    [self updateSelectedLayerIndex:self.selectedSegment];
    
    [self updateColor];
    
}


-(void) drawLayer{
    
    self.baseRect = CGRectMake(0, 0, self.frame.size.width /_numberOfSegment, self.frame.size.height - self.triangleSideHalfValue);
    
    int i=0;
    
    for (i=0; i< (int)self.numberOfSegment; i++) {
        
        [self.layer addSublayer:[self createLayer]];
        
        float width = self.frame.size.width;
        
        
        self.baseRect = CGRectOffset(self.baseRect, width / _numberOfSegment, 0);
        
    }
    
}

-(void)drawRect:(CGRect)rect{
}

-(void) updateSelectedLayerIndex:(NSInteger) index{
    if (index>0) {
        CAShapeLayer *layer = self.iconLayer[index];
        layer.fillColor = self.color.CGColor;
        layer.strokeColor = self.color.CGColor;
    }
}


-(void)rotate{
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width/self.numberOfSegment;
    
    self.baseRect = CGRectMake(width*self.selectedSegment, 0, width, height - self.triangleSideHalfValue);
    
    self.selectedLayer.path = [self newPath:self.baseRect];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    
    animation.duration = 0.35;
    animation.autoreverses = false;
    animation.fromValue = [NSNumber numberWithInt:0.3];
    animation.toValue = [NSNumber numberWithInt:1];
    
    [self.selectedLayer addAnimation:animation forKey:@"new_drop_pin"];
    
}

-(CGPathRef)rectanglePath{
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width/self.numberOfSegment;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(width*self.previousSelectedSegment, 0, width, height - self.triangleSideHalfValue)];
    return path.CGPath;
}


-(CGPathRef)newPath:(CGRect) frame{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    NSInteger triangleSide = 10;
    
    CGRect rect = frame;
    
    CGPoint startPoint = CGPointMake(rect.origin.x, rect.origin.y);
    
    [path moveToPoint:startPoint];
    
    
    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width ,rect.origin.y )];
    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width ,rect.origin.y + rect.size.height)];
    
    float space = triangleSide/1.8;
    
    [path addLineToPoint:CGPointMake(frame.origin.x + (rect.size.width/2) + space ,frame.origin.y + rect.size.height)];
    
    float y = 0.866 * triangleSide;
    
    [path addLineToPoint:CGPointMake(frame.origin.x + (rect.size.width/2) ,rect.origin.y + rect.size.height + y)];
    
    [path addLineToPoint:CGPointMake(frame.origin.x + (rect.size.width/2) - space ,rect.origin.y + rect.size.height)];
    
    [path addLineToPoint:CGPointMake(frame.origin.x   ,frame.origin.y + rect.size.height)];
    
    [path addLineToPoint:CGPointMake(frame.origin.x ,frame.origin.y )];
    
    return path.CGPath;
    
}



-(void) updateSelectedLayer:(CAShapeLayer *)shapeLayer{
    
    self.selectedSegment = 0;
    
    for (CAShapeLayer *layer in self.iconLayer) {
        
        if (layer == self.selectedLayer) {
            
            if (self.previousSelectedSegment != self.selectedSegment){
                
                [self rotate];
                
                self.color = [UIColor whiteColor];
                [self updateColor];
                
                CATextLayer *textLayer = self.textLayerArray[self.selectedSegment];
                textLayer.foregroundColor = [UIColor blackColor].CGColor;
                
                if ([self.delegate respondsToSelector:@selector(tappedSegmentControl:onIndex:)]) {
                    [self.delegate tappedSegmentControl:self onIndex:self.selectedSegment];
                }
                
                //change path of previous selected segment
                if (self.previousSelectedSegment != -1){
                    CAShapeLayer *layer =  self.iconLayer[self.previousSelectedSegment];
                    layer.path = [self rectanglePath];
                    layer.fillColor=nil ;
                    
                    CATextLayer *textLayer =self.textLayerArray[self.previousSelectedSegment];
                    textLayer.foregroundColor = [UIColor colorWithHexString:@"#458772"].CGColor ;
                }
                
                _previousSelectedSegment = _selectedSegment;
                
            }
            
        }
        else{
            
            self.color = [UIColor whiteColor];
            [self updateColor];
            layer.fillColor = nil;
            self.selectedSegment += 1 ;
        }
        
    }
    
}

-(CAShapeLayer *) createLayer{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = nil;
    
    shapeLayer.path = [UIBezierPath bezierPathWithRect:self.baseRect].CGPath;
    shapeLayer.strokeColor = self.color.CGColor;
    
    [self.iconLayer addObject:shapeLayer];
    
    
    CATextLayer *textLayer = [self returnTextLayer];
    [shapeLayer addSublayer:textLayer];
    
    [self.textLayerArray addObject:textLayer];
    
    return shapeLayer;
    
}

-(CATextLayer *)returnTextLayer{
    CATextLayer *textLayer = [CATextLayer layer];
    
    textLayer.font = (__bridge CFTypeRef)@"Helvetica-Bold";
    textLayer.fontSize = 18;
    
    textLayer.frame = CGRectMake(self.baseRect.origin.x, self.baseRect.origin.y+18, self.baseRect.size.width, self.baseRect.size.height-10);
    
    
    int iCounter = (int)self.textLayerArray.count;
    
    textLayer.string = [self.titles objectAtIndex:iCounter];
    
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.backgroundColor = [UIColor clearColor].CGColor;
    textLayer.foregroundColor = [UIColor colorWithHexString:@"#458772"].CGColor;
    
    return textLayer;
}


-(void) updateColor{
    
    for (CAShapeLayer *layer in self.iconLayer){
        
        if (layer == self.selectedLayer){
            layer.fillColor = self.color.CGColor;
        }else{
            layer.fillColor = nil;
        }
    }
    
}

-(void) updateProperties{
    
}

@end
