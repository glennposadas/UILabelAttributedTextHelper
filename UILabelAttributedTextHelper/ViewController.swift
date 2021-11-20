//
//  ViewController.swift
//  UILabelAttributedTextHelper
//
//  Created by Glenn Posadas on 11/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.setAttributedText(
            leadingText: "Hello!",
            leadingTextColor: .red,
            leadingTextFont: .boldSystemFont(ofSize: 20)
        )
        
        
        label2.setAttributedText(
            leadingText: "Hello",
            leadingTextColor: .blue,
            leadingTextFont: .boldSystemFont(ofSize: 20),
            trailingText: ", World!",
            trailingTextColor: .red,
            trailingTextFont: .italicSystemFont(ofSize: 20),
            textAlignment: .left,
            numberOfLines: 2,
            lineHeightMultiple: 1,
            lineSpacing: 1
        )
        
        label3.setAttributedText(
            completeString: "I believe that hard work beats talent. This is case sensitive. I learned the value of hard work by working hard",
            textColor: .label,
            font: .systemFont(ofSize: 20),
            highlightedText: "hard work",
            highlightedTextColor: .blue,
            highlightedTextFont: .boldSystemFont(ofSize: 25),
            textAlignment: .right,
            numberOfLines: 0,
            highlightAllOccurrence: false,
            lineHeightMultiple: 1,
            lineSpacing: 1
        )
        
        label4.setAttributedText(
            completeString: "I believe that hard work beats talent. This is case sensitive. I learned the value of hard work by working hard",
            textColor: .label,
            font: .systemFont(ofSize: 20),
            highlightedText: "hard work",
            highlightedTextColor: .blue,
            highlightedTextFont: .boldSystemFont(ofSize: 25),
            textAlignment: .center,
            numberOfLines: 0,
            highlightAllOccurrence: true,
            lineHeightMultiple: 1,
            lineSpacing: 1
        )
    }
}


class VC2: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.performSegue(withIdentifier: "show", sender: nil)
        }
    }
}
