//
//  DSConstants.h
//  DSLib
//
//  Created by Alexander Belyavskiy on 2/10/14.
//  Copyright (c) 2014 DS ltd. All rights reserved.
//

@import Foundation;
@import UIKit;

@class UITableViewCell;

//Custom types
typedef off_t DSFileSize;
extern const DSFileSize DSFileSize_Max;
extern DSFileSize DSFileSizeUndefined;

typedef int64_t DSRecID;

//block types
typedef void (^ds_action_block_t)(id sender);
typedef void (^ds_cell_action_block_t)(UITableViewCell *cell, id sender);
typedef void (^ds_results_multiple_errors_completion)(BOOL success, NSArray *errorMessages, id result);
typedef void (^ds_object_handler)(id object);
