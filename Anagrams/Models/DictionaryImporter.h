//
//  DictionaryImporter.h
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordTree.h"

@interface DictionaryImporter : NSObject

@property (nonatomic, strong) NSArray *words;

- (WordTree *)buildWordTree:(void (^)(long, long))progressBlock;

@end
