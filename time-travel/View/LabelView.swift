//
//  LabelView.swift
//  time-travel
//
//  Created by Nathan Wang on 9/18/24.
//

import SwiftUI

struct LabelView: View {
    var text: String
    var backgroundColor: Color
    var textColor: Color = .white

    var body: some View {
        Text(text)
            .font(AppFonts.labels)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
