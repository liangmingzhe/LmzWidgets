//
//  BatteryView.m
//  DemoForBattery
//
//  Created by benjaminlmz@qq.com on 2020/3/18.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "BatteryView.h"

#define UIColorFromRGB(rgbValue,a) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)])

#define lineWidth self.frame.size.width/50
#define widthEdge self.frame.size.width/50
@interface BatteryView() {
    CGContextRef ctx;
    float percent;
    UIColor *fillColor;
    UIColor *lineColor;
}

@end

@implementation BatteryView


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
        self.backgroundColor = [UIColor clearColor];
        self.opaque = YES;
        percent = 0;
        [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
            if (self->percent < 1) {
                self->percent = self->percent + 0.001;
            }else {
                self->percent = 0;
            }
//            percent = 1;
            
            [self setNeedsDisplay];
        }];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawBatteryView];

}
- (void)drawBatteryView {
    ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, lineWidth);//线的宽度
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
   
    lineColor = UIColorFromRGB(0x666666,1);
    fillColor = UIColorFromRGB(0x666666,1);
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);//线框颜色
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);//填充颜色
    //外框
    //外框y起点坐标
    float offsetY = self.frame.size.height/20;
    switch (_textStyle) {
        case TextStyleTop:
            offsetY = self.frame.size.height/20;
            break;
        case TextStyleBottom:
            offsetY = -self.frame.size.height/20;
            break;
        case TextStyleHide:
            offsetY = 0;
            break;
            
        default:
            offsetY = 0;
            break;
            
    }
    //外框高度
    float heightY =  self.frame.size.width/2.5;
    CGContextAddRoundRect(ctx, CGRectMake(widthEdge, self.frame.size.height * 0.5 - (self.frame.size.width/2.5)/2 + offsetY, self.frame.size.width * 0.9 - widthEdge,heightY),kCGPathStroke, widthEdge * 2);
    
    
    //电池头
    CGContextAddRoundRect(ctx, CGRectMake(self.frame.size.width * 0.9, self.frame.size.height /2 - (self.frame.size.width/6)/2 + offsetY, self.frame.size.width * 0.08 - widthEdge, self.frame.size.width/6),kCGPathFillStroke, widthEdge);
    
    if (percent > 0.75) {
           fillColor = UIColorFromRGB(0x49a6f6,0.8);
       }else if (percent <= 0.75 && percent > 0.5) {
           fillColor = UIColorFromRGB(0x89d146,0.8);//绿色
       }else if (percent <= 0.5 && percent > 0.8) {
           fillColor = UIColorFromRGB(0xFFBA57,0.8);//橙黄色
       }else {
           fillColor = UIColorFromRGB(0xF25E5E,0.8);//红色
       }
    CGContextSetStrokeColorWithColor(ctx, fillColor.CGColor);//线框颜色
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);//填充颜色
    CGContextSetLineWidth(ctx, 0);//线的宽度
    //内矩形
    //内矩形高度
    float innerHeight = self.frame.size.width/2.5 - widthEdge * 2 - lineWidth*2;
    //内矩形宽度
    float innerWidth = (self.frame.size.width * 0.9 - widthEdge - widthEdge * 2 - lineWidth * 2)*percent;
    //内矩形圆角
    float innercornerRadius = MIN(innerWidth * 0.5, widthEdge * 2);
    CGContextAddRoundRect(ctx, CGRectMake(widthEdge + lineWidth + widthEdge, self.frame.size.height * 0.5 - (self.frame.size.width/2.5 - widthEdge * 2)/2 + widthEdge + offsetY, innerWidth, innerHeight), kCGPathFillStroke,innercornerRadius);

    //闪电⚡️
    if(_batteryState == 1) {
        UIColor *aColor = UIColorFromRGB(0x444444,1);
        UIColor *alineColor = UIColorFromRGB(0xDDDDDD,1);
        CGContextSetLineJoin(ctx, kCGLineJoinMiter);
        CGContextSetLineWidth(ctx, lineWidth/2);//线的宽度
        CGContextSetStrokeColorWithColor(ctx, alineColor.CGColor);//线框颜色
        CGContextSetFillColorWithColor(ctx, aColor.CGColor);//填充颜色
        //point1
        CGContextMoveToPoint(ctx,self.frame.size.width/2 + widthEdge * 2,self.frame.size.height * 0.5 - (self.frame.size.width/2.5 - widthEdge * 2)/2 + widthEdge + offsetY);
        //point2
        CGContextAddLineToPoint(ctx, self.frame.size.width/2 - widthEdge*4, self.frame.size.height/2  + widthEdge + offsetY);
        //point3
        CGContextAddLineToPoint(ctx, self.frame.size.width/2 , self.frame.size.height/2 + widthEdge + offsetY);
        
        //point4
        CGContextAddLineToPoint(ctx, self.frame.size.width/2 - widthEdge* 2, self.frame.size.height * 0.5 + (self.frame.size.width/2.5 - widthEdge * 2)/2 - widthEdge + offsetY);
        //point5
        CGContextAddLineToPoint(ctx, self.frame.size.width/2 + widthEdge * 4, self.frame.size.height/2 - widthEdge + offsetY);
        //point6
        CGContextAddLineToPoint(ctx, self.frame.size.width/2 , self.frame.size.height * 0.5 - widthEdge + offsetY);
        CGContextClosePath(ctx);
        CGContextDrawPath(ctx, kCGPathFillStroke);
    }
    
    


    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);//填充颜色
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    NSString *s = [NSString stringWithFormat:@"%0.0f%%",percent * 100];
    
    float textHeight = self.frame.size.width/4;
    //字体
    UIFont *font = [UIFont fontWithName:@"Arial" size:textHeight];
    //文本风格，设置居中
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    
    //文本位置
    CGRect iRect = CGRectMake(0, self.frame.size.height/2 + offsetY - heightY/2, self.frame.size.width, textHeight);
    
    switch (_textStyle) {
        case TextStyleTop:
           iRect = CGRectMake(0, self.frame.size.height/2 + offsetY - heightY/2 - textHeight - lineWidth, self.frame.size.width, textHeight);
            break;
        case TextStyleBottom:
            iRect = CGRectMake(0, self.frame.size.height/2 + offsetY + heightY/2, self.frame.size.width, textHeight);
            break;
        case TextStyleHide:
            return;
            break;
            
        default:
            return;
            break;
            
    }
    //打印文本
    [s drawInRect:iRect withAttributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:fillColor}];

}
- (void)drawLightView {

}

- (void)drawText {

}

void CGContextAddRoundRect(CGContextRef context,CGRect rect,CGPathDrawingMode mode,CGFloat radius){
    float x1=rect.origin.x;
    float y1=rect.origin.y;
    float x2=x1+rect.size.width;
    float y2=y1;
    float x3=x2;
    float y3=y1+rect.size.height;
    float x4=x1;
    float y4=y3;
    CGContextMoveToPoint(context, x1, y1+radius);
    CGContextAddArcToPoint(context, x1, y1, x1+radius, y1, radius);
    
    CGContextAddArcToPoint(context, x2, y2, x2, y2+radius, radius);
    CGContextAddArcToPoint(context, x3, y3, x3-radius, y3, radius);
    CGContextAddArcToPoint(context, x4, y4, x4, y4-radius, radius);
    
    CGContextClosePath(context);
    CGContextDrawPath(context, mode); //根据坐标绘制路径
}
@end
