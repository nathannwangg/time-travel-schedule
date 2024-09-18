//
//  EventViewModel.swift
//  time-travel
//
//  Created by Nathan Wang on 9/17/24.
//

import Foundation
import Combine

// Responsible for fetching data from the API Client and bridging it with the view
class EventViewModel: ObservableObject { // handles event data and interaction utlizing the Observable Object protocol
    // Published properties that the view can observe and react to
    @Published var events: [Event] = [] // List of events
    @Published var isLoading = false // keeps track of if the data is loading
    @Published var errorMessage: String? // Stores error message if needed

    // Creates a private instance of the API Client
    private var apiClient = APIClient.shared // Makes the network requests

    // load events from the API
    func loadEvents() { // called by the view to fetch data
        self.isLoading = true // Starts loading indicator
        self.errorMessage = nil
        
        // calls fetchEvents from API Client
        apiClient.fetchEvents { [weak self] result in
            DispatchQueue.main.async { // dispatch to main queue, UI updates on main thread
                self?.isLoading = false // stops loading indicator
                switch result {
                case .success(let events):
                    self?.events = events // update events array if newtork request succeeds
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription // stores an error message otherwise
                }
            }
        }
    }
}

