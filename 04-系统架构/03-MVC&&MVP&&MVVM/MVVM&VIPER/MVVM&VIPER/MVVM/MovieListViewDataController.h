//
//  MovieListViewDataController.h
//  MVVM&VIPER
//
//  Created by KB on 2018/6/21.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieListViewDataController : NSObject
+(void)fetchMovieListWithCompleteHandler:(void(^)(NSArray*list))completeHandler;
@end
