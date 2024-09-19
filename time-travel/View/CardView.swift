//
//  CardView.swift
//  time-travel
//
//  Created by Nathan Wang on 9/17/24.
//

import SwiftUI

struct CardView: View {
    var event: Event // holds the event data

    var body: some View {
        HStack(alignment: .top, spacing: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: AppSpacing.small) { // VStack holding the start and end time
                Text(formatDate(event.startTime))
                    .font(AppFonts.subheading)
                    .foregroundColor(.black)
                Text(formatDate(event.endTime))
                    .font(.subheadline)
            }
            
            VStack(alignment: .leading, spacing: 4) { // VStack holding event name, location, type, points, and description
                Text(event.name)
                    .font(AppFonts.subheading)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                if let location = event.locations.first {
                    Text("@ \(location.description)")
                        .font(AppFonts.labels)
                        .foregroundColor(.black)
                }
                
                HStack {
                    LabelView(text: event.eventType, backgroundColor: AppColors.eventtype)
                    LabelView(text: "+ \(event.points) pts", backgroundColor: AppColors.secondary)
                }
                .padding(.bottom, AppSpacing.small)

                Text(event.description)
                    .font(AppFonts.body)
                    .foregroundColor(.black)
                    .lineLimit(2) // limit the description to 2 lines
                    .truncationMode(.tail)
                
                Spacer()
            }
        }
        .padding(AppSpacing.medium)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal, AppSpacing.medium)
    }

    private func formatDate(_ timestamp: Int, showDate: Bool = false) -> String { // formats the UNIX time into a string using DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        if showDate {
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
        } else {
            formatter.dateStyle = .none
            formatter.timeStyle = .short
        }
        return formatter.string(from: date)
    }
}
