//
//  InformationDialog.swift
//  mobile_architecture
//
//  Created by Ferdinand on 17/11/20.
//

import UIKit

class InformationDialog: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var dialogImageView: UIImageView!
    @IBOutlet weak var informationTitleDialog: UILabel!
    @IBOutlet weak var closeDialogButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 24
    }
    
    @IBAction func closeDialog(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
