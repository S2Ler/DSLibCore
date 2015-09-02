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
extern const DSFileSize DSFileSizeUndefined;

typedef int64_t DSRecID;

//block types
typedef void (^ds_action_block_t)(id __nonnull sender);
typedef void (^ds_cell_action_block_t)(UITableViewCell *__nonnull cell, id __nullable sender);
typedef void (^ds_results_multiple_errors_completion)(BOOL success, NSArray *__nullable errorMessages, id __nullable result);
typedef void (^ds_object_handler)(id _Nullable object);
