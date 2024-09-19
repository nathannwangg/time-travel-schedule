//
//  ListView.swift
//  time-travel
//
//  Created by Nathan Wang on 9/16/24.
//

import SwiftUI
import Foundation

struct ListView: View {
    // connect with the ViewModel
    @StateObject var viewModel = EventViewModel()

    var body: some View {
        NavigationView {
            // holds CardViews as child views in a vertical list
            VStack {
                
                HeadingView(title: "SCHEDULE") // HeadingView component
                
                if let selectedDate = viewModel.selectedDate { // check if a date is selected
                    TabView(viewModel: viewModel, selectedDate: $viewModel.selectedDate) // TavView component manages a list of Events based on the selectedDate
                    
                    ScrollView { // Scrollable List
                        LazyVStack { // Lazily loads views as needed
                            // Sort the events by startTime before displaying them
                            ForEach((viewModel.eventsByDate[selectedDate] ?? []).sorted(by: { $0.startTime < $1.startTime }), id: \.eventId) { event in
                                CardView(event: event) // Creates a CardView for each Event
                                    .padding(.vertical, AppSpacing.small)
                            }
                        }
                    }
                } else {
                    Text("No events available for selected date.")
                        .padding()
                }
            }
            .navigationBarHidden(true)
            .background(AppColors.primary)
            .onAppear {
                viewModel.loadEvents() // Calls loadEvents from EventViewModel to load data
            }
        }
    }
}





