//
//  MainViewController.swift
//  iOS Student List
//
//  Created by Seschwan on 5/21/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Outlets & Properties
    
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    @IBOutlet weak var filterSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - IBActions & Methods
    
    @IBAction func sort(_ sender: UISegmentedControl) {
        
        
    }
    
    @IBAction func filter(_ sender: UISegmentedControl) {
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
