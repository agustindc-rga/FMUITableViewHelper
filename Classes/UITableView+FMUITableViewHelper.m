//
//  UITableView+UITableViewHelper.m
//  UITableViewHelper
//
//  Created by Fernando Mazzon on 12/21/12.
//  Copyright (c) 2012 UITableViewHelper. All rights reserved.
//

#import "UITableView+FMUITableViewHelper.h"

@implementation UITableView (FMUITableViewHelper)

- (UITableViewCell<FMTableViewCellProtocol> *)cellOfClass:(Class<FMTableViewCellProtocol>)class
{
    return [self cellOfClass:class forObject:nil];
}

- (UITableViewCell<FMTableViewCellProtocol> *)cellOfClass:(Class<FMTableViewCellProtocol>)class forObject:(id)object
{
    return [class cellForObject:object inTableView:self];
}

- (UITableViewCell<FMTableViewCellProtocol> *)cellOfClass:(Class<FMTableViewCellProtocol>)class withObject:(id)object
{
    UITableViewCell<FMTableViewCellProtocol> *cell = [self cellOfClass:class forObject:object];
    if ([cell respondsToSelector:@selector(setObject:)]) {
        [cell setObject:object];
    }
    
    return cell;
}

@end
