//
//  Styles.swift
//  time-travel
//
//  Created by Nathan Wang on 9/18/24.
//

import Foundation
import SwiftUI

struct AppColors {
    static let primary = Color(hex: "#5C608F")
    static let secondary = Color(hex: "#608D8E")
    static let background = Color.white
    static let accent = Color(hex: "#BCB1C8")
    static let hover = Color(hex: "#F6B4CD")
    static let eventtype = Color(hex: "#964C1B")
}

struct AppFonts {
    static let heading = Font.custom("Helvetica-Bold", size: 24)
    static let subheading = Font.custom("Helvetica-Bold", size: 18)
    static let labels = Font.custom("Helvetica-Bold", size: 14)
    static let body = Font.custom("Helvetica", size: 14)
}

struct AppSpacing {
    static let small = 8.0
    static let medium = 16.0
    static let large = 24.0
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}
