//
//  HeadingView.swift
//  time-travel
//
//  Created by Nathan Wang on 9/18/24.
//

import SwiftUI
import Foundation

struct HeadingView: View {
    var title: String

    var body: some View {
        Text(title)
            .font(AppFonts.heading)
            .foregroundColor(AppColors.background)
            .padding(.vertical, AppSpacing.medium)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(AppColors.primary)
    }
}
