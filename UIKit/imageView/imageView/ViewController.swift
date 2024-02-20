//
//  ViewController.swift
//  imageView
//
//  Created by Pragyaratan on 19/02/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var hotel1ImageView: UIImageView!
    
    @IBOutlet weak var hotel2ImageView: UIImageView!
    
    @IBOutlet weak var urlImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotel1ImageView.image = UIImage(named: "hotelImage1")
        hotel1ImageView.backgroundColor = .red
        hotel1ImageView.layer.borderWidth = 2
        hotel1ImageView.layer.borderColor = .init(red: 0, green: 0, blue: 255, alpha: 1)
        
        // stretch image to fill the size
        // this will maintain aspect ratio of image and may result in cropping some parts of image
        
        hotel1ImageView.contentMode = .scaleAspectFill
        
        // this will maintain aspect ratio of image without cropping but can leave some extra space
        // hotel1ImageView.contentMode = .scaleAspectFit
        
        // it scale image to fill imageView without maintaing aspect ratio
        // hotel1ImageView.contentMode = .scaleToFill
        
//        hotel1ImageView.highlightedImage = "hotelImage1"
        
        
        
        urlImage.renderImageFromURL(url: "https://t4.ftcdn.net/jpg/00/09/21/15/360_F_9211505_d4hxfNtPeTfgt7AeGmoO7u79P2hwxkoQ.jpg")
        
        urlImage.layer.cornerRadius = 20
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        let tap2 =  UITapGestureRecognizer(target: self, action: #selector(tapImage))
        hotel1ImageView.isUserInteractionEnabled = true
        urlImage.isUserInteractionEnabled = true
        hotel1ImageView.addGestureRecognizer(tap1)
        urlImage.addGestureRecognizer(tap2)
       
    
    }

    @objc func tapImage(sender: UITapGestureRecognizer) {
        debugPrint("image tap")
        if let imageView = sender.view as? UIImageView {
            imageView.renderImageFromURL(url: "https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=")
        }
    }
}


extension UIImageView {
    func renderImageFromURL(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: url)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
            
        }
    }
}
