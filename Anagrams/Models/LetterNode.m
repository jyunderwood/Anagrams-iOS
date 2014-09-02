//
//  LetterNode.m
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import "LetterNode.h"

@implementation LetterNode

- (instancetype)initWithLetterValue:(NSString *)letter {
    self = [super init];
    if (self) {
        _childNodes = [[NSMutableArray alloc] init];
        _letterValue = letter;
    }
    return self;
}

- (LetterNode *)addChildLetter:(NSString *)letter {
    LetterNode *childNode;

    for (LetterNode *letterNode in self.childNodes) {
        if ([letterNode.letterValue isEqualToString:letter]) {
            childNode = letterNode;
        }
    }

    if (!childNode) {
        childNode = [[LetterNode alloc] initWithLetterValue:letter];
        [self.childNodes addObject:childNode];
    }

    return childNode;
}

- (NSString *)description {
    return self.letterValue;
}

@end
