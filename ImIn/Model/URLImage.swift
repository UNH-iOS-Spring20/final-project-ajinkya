//
//  URLImage.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/24/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import Foundation
import SwiftUI

class URLImage: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        
        guard let urlString = URL(string: self.urlString!) else {fatalError()}
        
        
        URLSession.shared.dataTask(with: urlString) { data, _, _ in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
        }.resume()
        
    }
}
