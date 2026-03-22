//
//  ColorsDataSource.swift
//  Delegation
//
//  Created by Swayambhu BANERJEE on 22/03/26.
//

import Foundation
import UIKit

protocol Colors {
    var color: UIColor { get }
}

enum ColorsDataSource: Colors, CaseIterable {
    case red
   // case blue
    case green
    case yellow
    
    var color: UIColor {
        switch self {
        case .red : return .red
       // case .blue : return .blue
        case .green : return .green
        case .yellow : return .yellow
        }
    }
}
