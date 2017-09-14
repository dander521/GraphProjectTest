//
//  ViewController.m
//  GraphProject
//
//  Created by 程荣刚 on 2017/9/14.
//  Copyright © 2017年 程荣刚. All rights reserved.
//

#import "ViewController.h"
#import "BEMSimpleLineGraphView.h"

@interface ViewController ()<BEMSimpleLineGraphDataSource, BEMSimpleLineGraphDelegate>

@property (weak, nonatomic) IBOutlet BEMSimpleLineGraphView *graphView;

@property (strong, nonatomic) NSArray *arrayOfValues;
@property (strong, nonatomic) NSArray *arrayOfDates;

@property (strong, nonatomic) NSArray *values;
@property (strong, nonatomic) NSArray *dates;

@property (assign, nonatomic) BOOL isWeek;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isWeek = true;
    self.graphView.enableTouchReport = YES;
    self.graphView.enablePopUpReport = YES;
    self.graphView.enableYAxisLabel = YES;
    self.graphView.autoScaleYAxis = YES;
    self.graphView.alwaysDisplayDots = YES;
    self.graphView.alwaysDisplayPopUpLabels = YES;
    self.graphView.enableReferenceXAxisLines = YES;
    self.graphView.enableReferenceYAxisLines = YES;
    self.graphView.enableReferenceAxisFrame = YES;
    
    // Draw an average line
    self.graphView.averageLine.enableAverageLine = YES;
    self.graphView.averageLine.alpha = 0.6;
    self.graphView.averageLine.color = [UIColor darkGrayColor];
    self.graphView.averageLine.width = 2.5;
    self.graphView.averageLine.dashPattern = @[@(2),@(2)];
    
    self.arrayOfValues = @[@"22", @"33", @"55", @"44", @"33", @"88", @"11"];
    self.arrayOfDates = @[@"一", @"二", @"三", @"四", @"五", @"六", @"日"];
    
    self.values = @[@"22", @"33", @"55", @"44", @"33", @"88", @"11", @"33", @"55", @"44", @"33", @"88", @"11"];
    self.dates = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"2", @"3", @"4", @"5", @"6", @"7"];
}

- (NSString *)labelForDateAtIndex:(NSInteger)index {
 
    NSString *label = nil;
    
    if (_isWeek) {
        label = self.arrayOfDates[index];
    } else {
        label = self.dates[index];
    }
    return label;
}

- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
    if (_isWeek) {
        return self.arrayOfValues.count;
    } else {
        return self.values.count;
    }
}

- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    if (_isWeek) {
        return [self.arrayOfValues[index] floatValue];
    } else {
        return [self.values[index] floatValue];
    }
    
}


- (NSInteger)numberOfGapsBetweenLabelsOnLineGraph:(BEMSimpleLineGraphView *)graph {
    return 0;
}

- (NSString *)lineGraph:(BEMSimpleLineGraphView *)graph labelOnXAxisForIndex:(NSInteger)index {
    NSString *label = [self labelForDateAtIndex:index];
    return [label stringByReplacingOccurrencesOfString:@" " withString:@"\n"];
}

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didTouchGraphWithClosestIndex:(NSInteger)index {
//    self.labelValues.text = [NSString stringWithFormat:@"%@", [self.arrayOfValues objectAtIndex:index]];
//    self.labelDates.text = [NSString stringWithFormat:@"in %@", [self labelForDateAtIndex:index]];
}

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didReleaseTouchFromGraphWithClosestIndex:(CGFloat)index {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        self.labelValues.alpha = 0.0;
//        self.labelDates.alpha = 0.0;
    } completion:^(BOOL finished) {
//        self.labelValues.text = [NSString stringWithFormat:@"%i", [[self.myGraph calculatePointValueSum] intValue]];
//        self.labelDates.text = [NSString stringWithFormat:@"between %@ and %@", [self labelForDateAtIndex:0], [self labelForDateAtIndex:self.arrayOfDates.count - 1]];
        
//        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            self.labelValues.alpha = 1.0;
//            self.labelDates.alpha = 1.0;
//        } completion:nil];
    }];
}

- (void)lineGraphDidFinishLoading:(BEMSimpleLineGraphView *)graph {
//    self.labelValues.text = [NSString stringWithFormat:@"%i", [[self.myGraph calculatePointValueSum] intValue]];
//    self.labelDates.text = [NSString stringWithFormat:@"between %@ and %@", [self labelForDateAtIndex:0], [self labelForDateAtIndex:self.arrayOfDates.count - 1]];
}

/* - (void)lineGraphDidFinishDrawing:(BEMSimpleLineGraphView *)graph {
 // Use this method for tasks after the graph has finished drawing
 } */

- (NSString *)popUpSuffixForlineGraph:(BEMSimpleLineGraphView *)graph {
    return @" ";
}


- (IBAction)touchResetDataBtn:(id)sender {
    self.isWeek = !self.isWeek;
    [self.graphView reloadGraph];
}

@end
