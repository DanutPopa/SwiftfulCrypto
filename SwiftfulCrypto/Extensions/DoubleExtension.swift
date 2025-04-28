//
//  DoubleExtension.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 25.04.2025.
//

import Foundation

extension Double {
    
    /// Converts a Double into a Currency as a String with n decimal places
    /// ```
    /// n = 2: Convert 1234.56 to "$1.234,56"
    /// ```
    func asCurrencyWithDecimals(_ fraction: Int, numberStyle: NumberFormatter.Style) -> String {
        let number = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.currencyCode = "EUR"
        formatter.numberStyle = numberStyle
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = fraction
        
        return formatter.string(from: number) ?? "$0.00"
    }
}
