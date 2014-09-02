//
//  WordTree.m
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import "WordTree.h"

@implementation WordTree

- (instancetype)init {
    self = [super init];
    if (self) {
        self.roots = [self buildRootsArray];
    }
    return self;
}

- (LetterNode *)rootLetter:(NSString *)letter {
    for (LetterNode *letterNode in self.roots) {
        if ([letterNode.letterValue isEqualToString:letter]) {
            return letterNode;
        }
    }

    return nil;
}

- (NSArray *)buildRootsArray {
    return @[
        [[LetterNode alloc] initWithLetterValue:@"a"],
        [[LetterNode alloc] initWithLetterValue:@"b"],
        [[LetterNode alloc] initWithLetterValue:@"c"],
        [[LetterNode alloc] initWithLetterValue:@"d"],
        [[LetterNode alloc] initWithLetterValue:@"e"],
        [[LetterNode alloc] initWithLetterValue:@"f"],
        [[LetterNode alloc] initWithLetterValue:@"g"],
        [[LetterNode alloc] initWithLetterValue:@"h"],
        [[LetterNode alloc] initWithLetterValue:@"i"],
        [[LetterNode alloc] initWithLetterValue:@"j"],
        [[LetterNode alloc] initWithLetterValue:@"k"],
        [[LetterNode alloc] initWithLetterValue:@"l"],
        [[LetterNode alloc] initWithLetterValue:@"m"],
        [[LetterNode alloc] initWithLetterValue:@"n"],
        [[LetterNode alloc] initWithLetterValue:@"o"],
        [[LetterNode alloc] initWithLetterValue:@"p"],
        [[LetterNode alloc] initWithLetterValue:@"q"],
        [[LetterNode alloc] initWithLetterValue:@"r"],
        [[LetterNode alloc] initWithLetterValue:@"s"],
        [[LetterNode alloc] initWithLetterValue:@"t"],
        [[LetterNode alloc] initWithLetterValue:@"u"],
        [[LetterNode alloc] initWithLetterValue:@"v"],
        [[LetterNode alloc] initWithLetterValue:@"w"],
        [[LetterNode alloc] initWithLetterValue:@"x"],
        [[LetterNode alloc] initWithLetterValue:@"y"],
        [[LetterNode alloc] initWithLetterValue:@"z"]
    ];
}

@end
