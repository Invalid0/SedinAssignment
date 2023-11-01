//
//  CardView.swift
//  SedinAssignment
//
//  Created by EMPULSE on 01/11/23.
//

import SwiftUI


struct CardView: View {
   let user: User
   
   @Environment(\.horizontalSizeClass) var horizontalSizeClass
   
   var body: some View {
       VStack {
           ImageView(imageURL: URL(string: user.user.avatar_url)!)
           Spacer()
           VStack(alignment: .leading) {
               Text(user.title)
                   .font(.custom("", size: 15))
                   .padding(5)
                   .frame(minWidth: 0, maxWidth: .infinity)
               Text("User: " + user.user.login)
                   .font(.subheadline)
                   .padding(5)
                   .frame(minWidth: 0, maxWidth: .infinity)
               Text("Created at: " + user.created_at)
                   .font(.subheadline)
                   .padding(5)
                   .frame(minWidth: 0, maxWidth: .infinity)
           }
           Spacer()
       }
       .frame(minWidth: 0, maxWidth: .infinity) // Ensure a fixed width for CardView
       .background(Color.white)
       .cornerRadius(10)
       .shadow(radius: 5)
       .padding(5)
   }
}


