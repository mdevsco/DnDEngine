//
//  File.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/21/22.
//

import Foundation

extension String {
    func extractMatches(_ capturePattern: String) throws -> [String] {
        let range = NSRange(
            self.startIndex..<self.endIndex,
            in: self
        )
        
        let captureRegex = try! NSRegularExpression(
            pattern: capturePattern,
            options: []
        )
        
        let matches = captureRegex.matches(
            in: self,
            options: [],
            range: range
        )
        
        guard let match = matches.first else {
            // Handle exception
            throw NSError(domain: "", code: 0, userInfo: nil)
        }
        
        var results: [String] = []
        for rangeIndex in 0..<match.numberOfRanges {
            let matchRange = match.range(at: rangeIndex)
            
            // Ignore matching the entire username string
            if matchRange == range { continue }
            
            // Extract the substring matching the capture group
            if let substringRange = Range(matchRange, in: self) {
                let capture = String(self[substringRange])
                results.append(capture)
            }
        }
        
        return results
    }
}
