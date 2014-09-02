//
//  DictionaryImporter.m
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import "DictionaryImporter.h"
#import "LetterNode.h"

@interface DictionaryImporter()
@end

@implementation DictionaryImporter

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *dictionaryPath = [[NSBundle mainBundle] pathForResource:@"twl06" ofType:@"txt"];
        NSString* fileContents = [NSString stringWithContentsOfFile:dictionaryPath encoding:NSUTF8StringEncoding error:nil];

        self.words = [fileContents componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
    }
    return self;
}

- (WordTree *)buildWordTree:(void (^)(long total, long imported))progressBlock {
    WordTree *wordTree = [[WordTree alloc] init];

    long wordsToImport = [self.words count];
    long numberImported = 0;

    for (NSString *word in self.words) {
        LetterNode *previousLetter;

        for (int i=0; i < [word length]; i++) {
            NSString *letter = [NSString stringWithFormat:@"%c", [word characterAtIndex:i]];

            if (previousLetter) {
                previousLetter = [previousLetter addChildLetter:letter];
            } else {
                previousLetter = [wordTree rootLetter:letter];
            }
        }

        previousLetter.endOfWord = YES;

        numberImported++;
        progressBlock(wordsToImport, numberImported);
    }

    return wordTree;
}

@end
