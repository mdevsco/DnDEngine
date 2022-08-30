//
//  DnDError.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/30/22.
//

import Foundation

/// All errors supported by the ``DnDEngine``
public enum DnDError: Error {
    /// There was not enough coin value for the transaction [DnDCoins]
    case insufficentFunds(String)
    /// There is enough value but not the correct coin type for the transaction
    case noExactChange(String)
    /// The was a general parsing error with a DnD expression
    case unableToParse(String)
}
