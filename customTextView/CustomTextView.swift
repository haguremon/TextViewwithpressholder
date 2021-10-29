//
//  CustomTextView.swift
//  customTextView
//
//  Created by IwasakIYuta on 2021/10/29.
//

import UIKit

class CustomTextView: UITextView {
    
    var placeholderText: String? {
        didSet{ placeholderLabel.text = placeholderText }
    }
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //y軸をセンターにするー
    var placeholderShouldCenter = true {
        didSet{
            if placeholderShouldCenter {
                NSLayoutConstraint.activate([
                    placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
                    placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
                    placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
                ])
            } else {
                
                NSLayoutConstraint.activate([
                    placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
                    placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
                ])
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(placeholderLabel)
        //AutoLayoutの制約
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
        //オブザーバーを使って監視
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    //変更通知を受け取った時にplaceholderLabelをTextViewのtext.isEmptyで隠すか判断する
    @objc func handleTextDidChange() {
        
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    
}
