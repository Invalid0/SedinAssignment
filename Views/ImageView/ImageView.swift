//
//  ImageView.swift
//  SedinAssignment
//
//  Created by EMPULSE on 01/11/23.
//

import SwiftUI

struct ImageView: View {
   @State private var image: UIImage? = nil
   let imageURL: URL

   var body: some View {
       if let image = image {
           Image(uiImage: image)
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: 150, height: 150,alignment: .center)
               .clipShape(Circle())
               .padding(10)
       } else {
           Text("Loading Image...")
               .onAppear(perform: loadImage)
       }
   }

   private func loadImage() {
       URLSession.shared.dataTask(with: imageURL) { data, _, error in
           if let data = data, let loadedImage = UIImage(data: data) {
               DispatchQueue.main.async {
                   self.image = loadedImage
               }
           } else {
               print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
           }
       }.resume()
   }
}
