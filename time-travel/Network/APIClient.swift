//
//  APIClient.swift
//  time-travel
//
//  Created by Nathan Wang on 9/16/24.
//

import Foundation

// Handles all network requests
class APIClient {
    // Global instance of APIClient()
    static let shared = APIClient() // Singleton instance, ensures only one instance
    
    // asynchronously fetch all events from the API
    func fetchEvents(completion: @escaping (Result<[Event], Error>) -> Void) { // uses a completion handler of type Result <[Event], Error>
        // Construct URL from the base URL and endpoint
        let url = APIConstants.baseURL.appendingPathComponent(APIConstants.eventsEndpoint)
        print("Fetching events from URL: \(url)")
        
        // Create a URLRequest object with the url
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // Set HTTP method to GET to retrieve data

        // Network task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in // task to retrieve url contents, calls handler
            if let error = error {
                // Check for network error
                print("Network request failed with error: \(error)")
                completion(.failure(error))
                return
            }
            
            // Check and log the response status code
            if let httpResponse = response as? HTTPURLResponse {
                print("Received HTTP status code: \(httpResponse.statusCode)")
            }

            // Log the raw data received as a string for debugging purposes
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Received data: \(dataString)")
            }

            // Ensure the response is valid
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else { // Check for status code 200
                print("Invalid response or status code not 200")
                // Handle if the response is not valid or the status code is not 200
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                return
            }
            
            // JSON Decoding using JSONDecoder()
            do {
                // Decode the JSON response into the model
                let eventsResponse = try JSONDecoder().decode(EventsResponse.self, from: data)
                print("Successfully decoded \(eventsResponse.events.count) events.")
                // Return success with array of events
                completion(.success(eventsResponse.events))
            } catch {
                // If the JSON decoding fails
                print("JSON decoding failed with error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        print("Network task started")
        task.resume() // Start network task
    }
}

