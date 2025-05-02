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
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asCurrencyWithDecimals(2, numberStyle: .decimal)
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asCurrencyWithDecimals(2, numberStyle: .decimal)
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asCurrencyWithDecimals(2, numberStyle: .decimal)
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asCurrencyWithDecimals(2, numberStyle: .decimal)
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asCurrencyWithDecimals(2, numberStyle: .decimal)

        default:
            return "\(sign)\(self)"
        }
    }
}
