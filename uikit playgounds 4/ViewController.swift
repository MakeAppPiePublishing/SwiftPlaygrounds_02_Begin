//
//  ViewController.swift
//  StackviewDemo
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 16 (Q4 2021) video 07
//  by Steven Lipton (C)2021, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Build a stackview like a SwiftUI Stack
//  For more code, go to http://bit.ly/AppPieGithub


import UIKit

class ViewController: UIViewController {
    var rootStackView = UIStackView()
    
    
    /// A Basic button like SwiftUI without an action
    /// - Parameters:
    ///   - title: The title on the button
    ///   - background: A background color. Defaults to gray.
    func button(number:Int, background:UIColor = .gray ) -> UIButton{
        var config = UIButton.Configuration.filled()
        config.title = "Button \(number)"
        config.baseBackgroundColor = background
        let action = UIAction(title:"Button \(number)"){ _ in 
            let vc = DetailViewController()
            vc.buttonNumber = number
            self.navigationController?.pushViewController(vc,animated:true)
        }
        return UIButton(configuration: config, primaryAction: action)
    }
    
    /// An ImageView that gives you a SF Symbol.
    /// - Parameter systemName: the name of the SF Symbol
    func image(systemName:String)-> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName:systemName))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func vStack(_ views:[UIView], spacing:CGFloat = 0)->UIStackView{
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = spacing
        return stack
    }
    
    func hStack(_ views:[UIView], spacing:CGFloat = 0)->UIStackView{
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = spacing
        return stack
    }
    
    override func viewWillLayoutSubviews() {
        rootStackView.frame = view.bounds
            .inset(by: view.safeAreaInsets)
            .insetBy(dx:10, dy:10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController Demo"
        rootStackView = vStack([
            button(number: 1),
            image(systemName: "3.circle.fill"),
            button(number: 2, background: .systemRed),
            hStack([
                button(number: 3),
                image(systemName: "3.circle.fill"),
                button(number: 4, background: .systemRed)
            ],spacing:5)
        ],spacing:5)
        view.addSubview(rootStackView)
    }


}

