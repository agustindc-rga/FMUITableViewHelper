//
//  AutoLayoutTableView.m
//  UITableViewHelper
//
//  Created by Fernando Mazzon on 2/6/14.
//  Copyright (c) 2014 Fernando Mazzon. All rights reserved.
//

#import "FMAutoLayoutTableViewCell.h"
#import <FMRuntimeHelpers/FMRuntimeHelpers.h>

static char kOffscreenCellKey;

@interface FMAutoLayoutTableViewCell ()

@property (nonatomic, assign) BOOL offscreen;

@end

@implementation FMAutoLayoutTableViewCell

#pragma mark - AutoLayoutTableViewCell

+ (FMAutoLayoutTableViewCell *)offscreenCellForIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    NSMutableDictionary *offscreenCellDictionary = [(id)tableView associatedObjectForKey:&kOffscreenCellKey orBlockResult:^id{
        return [NSMutableDictionary dictionary];
    }];
    
    if (!offscreenCellDictionary[identifier]) {
        offscreenCellDictionary[identifier] = [self cellFromIdentifier:identifier inTableView:tableView];
		[offscreenCellDictionary[identifier] setOffscreen:YES];
    }
    return offscreenCellDictionary[identifier];
}

#pragma mark - TableViewCellProtocol

+ (CGFloat)heightForObject:(id)object inTableView:(UITableView *)tableView
{
    FMAutoLayoutTableViewCell *cell = [self offscreenCellForIdentifier:[self cellIdentifierForObject:object] tableView:tableView];
    
    [cell setObject:object];
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    return [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
}

#pragma mark -

@end
