//
//  LRLMovie.m
//  MovieDataBaseC
//
//  Created by Levi Linchenko on 14/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLMovie.h"

@implementation LRLMovie

-(instancetype)initWithDictionary: (NSDictionary*)movieDictionary
{
    self = [super init];
    if (self){
        _title = movieDictionary[@"title"];
        _releaseDate = movieDictionary[@"release_date"];
        _movieDescription = movieDictionary[@"overview"];
        _imagePath = movieDictionary[@"poster_path"];
        _identification = movieDictionary[@"id"];
        
    }
    return self;
}

@end
