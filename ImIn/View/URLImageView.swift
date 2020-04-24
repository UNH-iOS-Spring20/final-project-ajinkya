//
//  URLImageView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/24/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct URLImageView: View {
    @ObservedObject var urlImageModel: URLImage
    
    init(urlString: String?) {
        self.urlImageModel = URLImage(urlString: urlString)
    }
    var body: some View {
        Image(uiImage:  urlImageModel.image ?? URLImageView.defaultImage!)
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
    }
    
    static var defaultImage = UIImage(named: "PlaceIcon")
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(urlString: nil)
    }
}
