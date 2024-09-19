//
//  TabView.swift
//  time-travel
//
//  Created by Nathan Wang on 9/18/24.
//

import SwiftUI

struct TabView: View {
    @ObservedObject var viewModel: EventViewModel // updates when view model changes
    @Binding var selectedDate: Date? // reacts to and can change the selected date

    var body: some View {
        HStack(spacing: AppSpacing.small) { // aranges tabs horizontally
            ForEach(Array(viewModel.eventsByDate.keys.sorted()), id: \.self) { date in // loops through each date in events dictionary
                Button(action: { // creates a button for each date
                    self.selectedDate = date
                }) {
                    Text(date, formatter: dateFormatter)
                        .font(AppFonts.subheading)
                        .padding(.vertical, AppSpacing.small)
                        .padding(.horizontal, AppSpacing.small)
                        .background(self.selectedDate == date ? AppColors.hover : AppColors.accent) // background changes if the tab is selected
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal, AppSpacing.medium)
    }

    private var dateFormatter: DateFormatter { // formats dates to day and month
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("d MMM")
        return formatter
    }
}


