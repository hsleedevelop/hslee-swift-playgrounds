//
//  Test4.swift
//  EJNTest
//
//  Created by HS Lee on 2020/11/21.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation
import UIKit

enum ImageFetchingError: Error {
    case timeout
    case unknown
}

protocol CatImageCellModel {
    var placeholderImage: UIImage { get }
    func fetchCatImage(completion: @escaping (Result<UIImage, ImageFetchingError>) -> Void)
}

final class CatImageCell: UICollectionViewCell {

    private var imageView: UIImageView!
    private var model: CatImageCellModel?
    private var timestamp: Date!

    convenience init(imageView: UIImageView) {
        self.init()

        self.imageView = imageView
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageView.image = nil
        self.model = nil
    }

    func set(model: CatImageCellModel) {
        self.model = model
        self.timestamp = Date()
        
        self.setCatImage(timestamp: self.timestamp, image: model.placeholderImage)
        self.fetchCatImageProxy(timestamp: timestamp, count: 0)
    }
    
    private func setCatImage(timestamp: Date, image: UIImage) {
        guard self.timestamp == timestamp else { return }
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
    private func fetchCatImageProxy(timestamp: Date, count: Int) {
        guard self.model != nil, count <= 2 else {
            return
        }
        
        self.model?.fetchCatImage { [weak self] (result: Result<UIImage, ImageFetchingError>) in
            switch result {
            case .success(let image):
                self?.setCatImage(timestamp: timestamp, image: image)
            case .failure(let error):
                if error == .timeout {
                    self?.fetchCatImageProxy(timestamp: timestamp, count: count + 1)
                } else if error == .unknown {
                    //log to report service
                    print("fetch fail url")
                }
            }
        }
    }
}

class Test4 {
    
    func solution() {
        print("test4")
    }
}


