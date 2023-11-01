//
//  InternetManager.swift
//  SedinAssignment
//
//  Created by EMPULSE on 01/11/23.
//

import Foundation
import Network
import Combine

class InternetChecker: ObservableObject {
    @Published var isInternetConnected = false

    private var monitor: NWPathMonitor?
    private var cancellables: Set<AnyCancellable> = []

    init() {
        monitor = NWPathMonitor()
        monitor?.pathUpdateHandler = { [weak self] path in
            self?.isInternetConnected = path.status == .satisfied
        }
        monitor?.start(queue: DispatchQueue.global())
    }
}
