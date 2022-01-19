import UIKit

class DetailViewController:UIViewController{
    var buttonNumber:Int = 0
    
    func dismissAction() -> UIAction {         
        UIAction(title:"Dismiss"){ _ in 
            self.navigationController?.popViewController(animated:true)
        }
    }
    override func viewDidLoad() {
        title = "Detail View Controller"
        //a stack view for layout
        let rootStackView = UIStackView(frame:view.bounds)
        rootStackView.axis = .vertical
        rootStackView.distribution = .fillEqually
        rootStackView.alignment = .fill
        view.addSubview(rootStackView)
        //the label
        let label = UILabel()
        label.text = "Button # \(buttonNumber)"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        rootStackView.addArrangedSubview(label)
        //the image
        let image = UIImageView(image:UIImage(systemName:"\(buttonNumber).circle"))
        image.contentMode = .scaleAspectFit
        rootStackView.addArrangedSubview(image)
        
        //a dismiss button
        let mainButton = UIButton(configuration: .filled(),primaryAction: dismissAction())
        mainButton.configuration?.subtitle = "Dismiss with a tap"
        mainButton.configuration?.baseBackgroundColor = .red
        mainButton.configuration?.baseForegroundColor = .white
        mainButton.setImage(UIImage(systemName:"hand.tap.fill"), for: .highlighted)
        
        mainButton.configuration?.image = UIImage(systemName:"\(buttonNumber).circle")
        rootStackView.addArrangedSubview(mainButton)
        
    }
}

