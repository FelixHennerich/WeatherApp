//
//  IconExtension.swift
//  Weather
//
//  Created by Felix Hennerich on 12.01.23.
//

import Foundation
import UIKit

extension Int {
    func cube() -> Int {
        return self*self*self
    }
    
    func hexa() -> Int {
        return self.cube() * self.cube()
    }
}

extension UIImageView {
    func load(urlString: String){
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.sync {
                        self?.image = image
                    }
                }
            }
        }
    }
}
