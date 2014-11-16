//
//  DictionaryImporter.h
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LetterNode;

@interface DictionaryImporter : NSObject

- (instancetype)initWithDictionaryName:(NSString *)dictionaryName;
- (LetterNode *)buildTreeWithProgress:(void (^)(long, long))progressBlock;

@end
