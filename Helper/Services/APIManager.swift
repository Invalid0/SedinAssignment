//
//  APIManager.swift
//  SedinAssignment
//
//  Created by EMPULSE on 01/11/23.
//

import Foundation
import Combine
import SwiftUI

class APIManager: ObservableObject {
   @Published var users: [User] = []
    var baseUrl: String
    var endpoint: String
   private var cancellables: Set<AnyCancellable> = []
   let apiService = APIService()
    init(baseUrl: String, endPoint: String) {
        self.baseUrl = baseUrl
        self.endpoint = endPoint
       fetchIssues()
   }
   func fetchIssues() {
       guard let githubURL = URL(string: "\(baseUrl)\(endpoint)") else {
           return
       }
       
       apiService.fetchData(from: githubURL, responseType: [User].self)
           .receive(on: DispatchQueue.main)
           .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] users in
               self?.users = users
           })
           .store(in: &cancellables)
   }
}
