//
//  NetworkManager.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import Foundation
import Network

struct NetworkManager {
    
    var session: URLSession
    
    init( session: URLSession = .shared) {
        self.session = session
    }

    
    func createRequest(for url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func executeRequest<T: Codable>(request: URLRequest, completion: ((T?, Error?) -> Void)?) {
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion?(nil,NetworkError.unableToComplete )
                return
            }
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
               
                    completion?(decodedResponse, nil)
                
            } else {
                completion?(nil, NetworkError.invalidData)
            }
        }
        dataTask.resume()
    }
    
    
    // ASYNC  AWAIT  CALL
    func executeRequest<T:Codable>(request:URLRequest) async throws -> T{
        
        // Check network connectivity
        guard isConnectedToNetwork() else {
            throw NetworkError.unableToComplete
        }
        
        let session = URLSession(configuration: .default)

        //Wait for the response, and data is not optional here
        let (data,urlResponse) = try await session.data(for: request)
        
        guard (urlResponse as? HTTPURLResponse)?.statusCode == 200 else{
            throw NetworkError.invalidResponse
        }
        debugPrint("🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻")
        debugPrint("Request : \(request)")
        debugPrint("🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻\n\n")
        let response = try JSONDecoder().decode(T.self, from: data)
        debugPrint("Response : \(response)")

        return response
    }
}


extension NetworkManager{
    
    func isConnectedToNetwork() -> Bool {
        let monitor = NWPathMonitor()
        var isConnected = false
        let semaphore = DispatchSemaphore(value: 0)

        monitor.pathUpdateHandler = { path in
            isConnected = path.status == .satisfied
            semaphore.signal()
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
        // Wait for the network status to be determined
        semaphore.wait()
        monitor.cancel()
        
        return isConnected
    }
}
