//
//  LetterNode.m
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import "LetterNode.h"

@interface LetterNode()
@property (nonatomic, strong) NSMutableArray *nodes;
@end

@implementation LetterNode

- (instancetype)initWithLetter:(char)letter {
    self = [super init];

    if (self) {
        _letter = letter;
        _nodes = [[NSMutableArray alloc] init];
    }

    return self;
}

- (instancetype)init {
    return [self initWithLetter:'-'];
}

- (LetterNode *)addChildLetter:(char)letter {
    LetterNode *childNode;

    for (LetterNode *letterNode in self.childNodes) {
        if (letterNode.letter == letter) {
            childNode = letterNode;
        }
    }

    if (!childNode) {
        childNode = [[LetterNode alloc] initWithLetter:letter];
        [self.nodes addObject:childNode];
    }

    return childNode;
}

- (NSArray *)childNodes {
    return [self.nodes copy];
}

- (NSString *)letterValue {
    return [NSString stringWithFormat:@"%c", self.letter];
}

- (NSString *)description {
    return [self letterValue];
}

@end
