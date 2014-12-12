//
//  TreeClimber.m
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import "TreeClimber.h"
#import "LetterNode.h"

@interface TreeClimber()
@property LetterNode *rootNode;
@property NSArray *letters;
@end

@implementation TreeClimber

- (instancetype)initWithTree:(LetterNode *)rootNode andLetters:(NSString *)letters {
    self = [super init];
    if (self) {
        _results = [[NSMutableArray alloc] init];
        _rootNode = rootNode;
        _letters = [self sanitizeLetters:letters];
    }
    return self;
}

- (NSArray *)sanitizeLetters:(NSString *)inputLetters {
    NSMutableArray *outputLetters = [[NSMutableArray alloc] init];

    for (int i=0; i < inputLetters.length; i++) {
        NSString *letter = [NSString stringWithFormat:@"%c", [inputLetters characterAtIndex:i]];
        [outputLetters addObject:letter.lowercaseString];
    }

    return (NSArray *)outputLetters;
}

- (void)startClimbing {
    NSString *emptyResult = @"";
    [self climbBranches:[self.rootNode childNodes] withLetters:self.letters andResult:emptyResult];
}

- (void)climbBranches:(NSArray *)childNodes withLetters:(NSArray *)letters andResult:(NSString *)result {
    NSMutableArray *validNodes = [self findClimbableBranches:childNodes withLetters:letters];

    for (LetterNode *node in validNodes) {
        NSMutableArray *remainingLetters;
        NSString *currentResult = [result stringByAppendingString:node.letterValue];

        if (node.endOfWord) {
            [self.results addObject:currentResult];
        }

        remainingLetters = [self removeLetter:node.letterValue fromLetters:letters];
        [self climbBranches:node.childNodes withLetters:remainingLetters andResult:currentResult];
    }
}

- (NSMutableArray *)findClimbableBranches:childNodes withLetters:letters {
    NSSet *uniqueLetters = [NSSet setWithArray:letters];
    NSMutableArray *validNodes = [[NSMutableArray alloc] initWithCapacity:uniqueLetters.count];

    for (NSString *letter in uniqueLetters) {
        for (LetterNode *node in childNodes) {
            if ([node.letterValue isEqualToString:letter]) {
                [validNodes addObject:node];
            }
        }
    }

    return validNodes;
}


- (NSMutableArray *)removeLetter:(NSString *)letterToRemove fromLetters:(NSArray *)letters {
    NSMutableArray *remainingLetters = [[NSMutableArray alloc] initWithArray:letters];

    for (int i=0; i < remainingLetters.count; i++) {
        NSString *letter = [letters objectAtIndex:i];
        if ([letterToRemove isEqualToString:letter]) {
            [remainingLetters removeObjectAtIndex:i];
            break;
        }
    }

    return remainingLetters;
}

@end
