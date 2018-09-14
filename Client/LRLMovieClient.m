//
//  LRLMovieClient.m
//  MovieDataBaseC
//
//  Created by Levi Linchenko on 14/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLMovieClient.h"

@implementation LRLMovieClient

+(void)searchMovieByTitle: (NSString*) title withBlock: (void(^)(NSArray<LRLMovie*>* _Nullable movie))block
{
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.themoviedb.org/3/search/movie"];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"api_key" value:@"ebbdfa6557b575564ac2d754db0b0406"];
    NSURLQueryItem *queryItem2 = [NSURLQueryItem queryItemWithName:@"query" value: title];
    NSURLComponents *components = [[NSURLComponents alloc]initWithURL:baseUrl resolvingAgainstBaseURL:true];
    components.queryItems = [[NSArray alloc]initWithObjects:queryItem, queryItem2, nil];
    NSURL *url = components.URL;
    
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            block(nil);
            return;
        }
        NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray * resultsArray = jsonDictionary[@"results"];
        NSMutableArray * movies = [[NSMutableArray alloc]init];
        for (NSDictionary * movieDictionary in resultsArray)
        {
            LRLMovie * movie = [[LRLMovie alloc] initWithDictionary:movieDictionary];
            [movies addObject:movie];
        }
        
        block(movies);
        
    }]resume];
    
}



+(void)fetchImage:(LRLMovie*)movie withBlock:(void(^)(UIImage* _Nullable image))block
{
    NSURL * baseURL = [NSURL URLWithString:@"https://image.tmdb.org/t/p/w500"];
    NSURL * url = [baseURL URLByAppendingPathComponent:movie.imagePath];
    NSLog(@"%@", url);
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            block(nil);
            return;
        }
        UIImage * image = [UIImage imageWithData:data];
        block(image);
        
    }]resume];
    
    
}







@end











