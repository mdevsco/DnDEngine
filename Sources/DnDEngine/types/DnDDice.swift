//
//  DnDDice.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// Types of Dice used in DnD
enum DnDDice: String {
  /// Four-sided Dice
  case d4 = "d4"

  /// Six-sided Dice
  case d6 = "d6"

  /// Eight-sided Dice
  case d8 = "d8"

  /// Ten-sided Dice
  case d10 = "d10"

  /// Twelve-sided Dice
  case d12 = "d12"

  /// Twenty-sided Dice
  case d20 = "d20"

  /// Percentage Dice
  case d100 = "d100"
}
