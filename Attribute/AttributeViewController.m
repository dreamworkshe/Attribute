//
//  AttributeViewController.m
//  Attribute
//
//  Created by yaocheng on 2/15/13.
//  Copyright (c) 2013 Yaocheng. All rights reserved.
//

#import "AttributeViewController.h"

@interface AttributeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIStepper *selectedWordStepper;
@property (weak, nonatomic) IBOutlet UILabel *selectedWordlabel;
@end

@implementation AttributeViewController

- (IBAction)underline {
    NSRange range = [[self.label.attributedText string] rangeOfString:[self selectedWord]];
    if (range.location != NSNotFound) {
        
    }
}


- (NSArray *)wordList {
    NSArray *wordList = [[self.label.attributedText string] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([wordList count]) {
        return wordList;
    } else {
        return @[@""];
    }
}

- (NSString *)selectedWord {
    return [self wordList][(int)self.selectedWordStepper.value];
}

- (IBAction)updateSelectedWord {
    self.selectedWordStepper.maximumValue = [[self wordList] count]-1;
    self.selectedWordlabel.text = [self selectedWord];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    [self updateSelectedWord];
}

@end
