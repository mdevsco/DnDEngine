//
//  DnDDistanceType.swift
//  
//
//  Created by Rodney Aiglstorfer on 9/3/22.
//

import Foundation

/// Supported type of distance (most common is ``.feet``
/// **NOTE** for anything else be sure to provide a
/// description as an associated value:
///
/// ```swift
///    let unit = DnDDistanceType.other("squares")
/// ```
public enum DnDDistanceType: Equatable {
    case feet
    case other(String)
}
