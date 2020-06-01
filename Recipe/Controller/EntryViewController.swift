//
//  EntryViewController.swift
//  Recipe
//
//  Created by Haniyeh Nobakht Niaragh on 5/29/20.
//  Copyright © 2020 Haniyeh Nobakht Niaragh. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!

    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //show keyboard
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    @objc func didTapSave(){
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty{
            completion?(text, noteField.text)
        }
        
    }
}
