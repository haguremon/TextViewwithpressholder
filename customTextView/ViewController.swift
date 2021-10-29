//
//  ViewController.swift
//  customTextView
//
//  Created by IwasakIYuta on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: CustomTextView!
    
    @IBOutlet weak var centerYTextView: CustomTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.placeholderText = "入力しろや"
        centerYTextView.placeholderShouldCenter = true
        centerYTextView.placeholderText = "YCenter"
    }


}

