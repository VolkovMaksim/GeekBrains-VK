//
//  TestView.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 20.12.2021.
//

import UIKit

class TestView: UIView {

    var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onClick))
        recognizer.numberOfTapsRequired = 1 // Распознаем кол-во нажатий
        recognizer.numberOfTouchesRequired = 1 // Кол-во пальцев необходимых для реагирования
        
        return recognizer
    }()
    
    @objc func onClick() {
        let boundsSize = self.imageView.bounds.size
        self.imageView.bounds.size = CGSize(width: self.imageView.bounds.width / 2, height: self.imageView.bounds.height / 2)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
            self.imageView.bounds.size = boundsSize
        },
                       completion: nil)
    }

    private var imageView: UIImageView = UIImageView()
    private var containaerView: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupImage()
        addGestureRecognizer(tapGestureRecognizer)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupImage()
        addGestureRecognizer(tapGestureRecognizer)
    }

    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            self.updateColor()
        }
    }

    @IBInspectable var shadowOpacity: Float = 3.0 {
        didSet {
            self.updateOpacity()
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            self.updateRadius()
        }
    }

    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            self.updateOffset()
        }
    }

    private func setupImage() {
        containaerView.frame = self.bounds
        containaerView.layer.cornerRadius = 28

        imageView.layer.masksToBounds = true
        imageView.frame = containaerView.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 28
        imageView.image = image

        containaerView.addSubview(imageView)
        self.addSubview(containaerView)
        updateShadows()
    }

    private func updateOpacity() {
        self.containaerView.layer.shadowOpacity = shadowOpacity
    }

    private func updateColor() {
        self.containaerView.layer.shadowColor = shadowColor.cgColor
    }

    private func updateOffset() {
        self.containaerView.layer.shadowOffset = shadowOffset
    }

    private func updateRadius() {
        self.containaerView.layer.shadowRadius = shadowRadius
    }

    private func updateShadows() {
        self.containaerView.layer.shadowOpacity = shadowOpacity
        self.containaerView.layer.shadowRadius = shadowRadius
        self.containaerView.layer.shadowColor = shadowColor.cgColor
        self.containaerView.layer.shadowOffset = shadowOffset
    }
}
