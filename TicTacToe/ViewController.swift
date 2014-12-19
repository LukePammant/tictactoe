//
//  ViewController.swift
//  TicTacToe
//
//  Created by Software 3tSystems on 12/18/14.
//  Copyright (c) 2014 VitalSignsStudios. All rights reserved.
//

import UIKit
// Test4 from Jeff

class ViewController: UIViewController {

    @IBOutlet var ticTacToeView: TicTacToeBoard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ticTacToeView.drawBoard()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        ticTacToeView.playerTouchedScreen(touches)
    }


}

