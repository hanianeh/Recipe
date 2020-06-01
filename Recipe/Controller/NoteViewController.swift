//
//  NoteViewController.swift
//  Recipe
//
//  Created by Haniyeh Nobakht Niaragh on 5/29/20.
//  Copyright © 2020 Haniyeh Nobakht Niaragh. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLable: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = noteTitle
        noteLable.text = note
        
    }
}
