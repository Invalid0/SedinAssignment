//
//  SplashScreenView.swift
//  SedinAssignment
//
//  Created by EMPULSE on 01/11/23.
//

import SwiftUI
struct SplashScreenView: View {
    @ObservedObject var internetReachability = InternetChecker()
    @State private var isConnectedToInternet = false
    @State private var elapsedTimeInSeconds = 0
    
    var body: some View {
        VStack {
            !isConnectedToInternet ?  CheckNetworkView(isConnected: false, elapsedTimeInSeconds: elapsedTimeInSeconds) : elapsedTimeInSeconds > 3 ? CheckNetworkView(isConnected: true, elapsedTimeInSeconds: elapsedTimeInSeconds) : CheckNetworkView(isConnected: false, elapsedTimeInSeconds: elapsedTimeInSeconds)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                elapsedTimeInSeconds += 1
            }
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                isConnectedToInternet = internetReachability.isInternetConnected
            }
        }
    }
}
