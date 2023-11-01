//
//  CheckNetworkView.swift
//  SedinAssignment
//
//  Created by EMPULSE on 01/11/23.
//
//@StateObject var apiManager = APIManager()
//@ObservedObject var internetReachability = InternetChecker()
import SwiftUI

struct CheckNetworkView: View {
    @State private var isRedirectingToSplash = false
    let isConnected: Bool
    let elapsedTimeInSeconds: Int
    @StateObject var apiManager = APIManager(baseUrl: APIConfiguration.baseURL, endPoint: APIConfiguration.issuesEndpoint)
    @ObservedObject var internetReachability = InternetChecker()
    var body: some View {
        NavigationView {
            
                if isConnected {
                    List(apiManager.users) { user in
                        CardView(user: user)
                    }
                    .navigationTitle("User Details")
                } else {

                    if elapsedTimeInSeconds > 3 {
                        VStack{
                            Image("Signel")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250, alignment: .center)
                                .foregroundColor(.red)
                            Text("Not connected to the Internet pls Check the internet connection......")
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                    } else {
                        VStack{
                            Image("Internet")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150, alignment: .center)
                                .foregroundColor(.blue)
                                .padding(30)
                            Text("Checking Internet Connection...")
                                .font(.custom( "", size: 17))
                            Text("Elapsed Time: \(elapsedTimeInSeconds) seconds")
                        }
                    }
                }
        }
    }
}



