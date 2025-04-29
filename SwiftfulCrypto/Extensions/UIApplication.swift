//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 29.04.2025.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
