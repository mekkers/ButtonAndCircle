//
//  ViewController.swift
//  ButtonAndCircle
//
//  Created by igor mekkers on 16.02.2022.
//

import UIKit

enum Direction: String {
    case left = "left"
    case right = "right"
    case up = "up"
    case down = "down"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    let viewCircle = UIView()
    let screenSize = UIScreen.main.bounds
    let step = CGFloat(20)
    let size = CGFloat(100)
    var safe = UIEdgeInsets()
    var error = false
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    

    override func viewDidLoad() {
        createView()
        safe = self.view.safeAreaInsets
        
       
      
        
    }
    @IBAction func upButtonPressed(_ sender: UIButton) {
        move(direction: .up)
    }
    @IBAction func downButtonPressed(_ sender: UIButton) {
        move(direction: .down)
    }
    @IBAction func leftButtonPressed(_ sender: UIButton) {
        move(direction: .left)
    }
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        move(direction: .right)
    }
    
    private func createView() {
        
        viewCircle.frame = CGRect(x: screenSize.midX-(size/2), y: (screenSize.midY-(size/2))*2/3, width: size, height: size)
        viewCircle.backgroundColor = .red
        self.view.addSubview(viewCircle)
        
        viewCircle.layer.cornerRadius = viewCircle.frame.size.width/2
    }
    private func move(direction: Direction) {
        errorLabel.text = ""
        switch direction {
        case .left:
            if self.viewCircle.frame.origin.x - step > safe.left{
                self.viewCircle.frame.origin.x -= step
            } else {
                error = true
            }
        case .right:
            if self.viewCircle.frame.origin.x + size + step < screenSize.width - safe.right{
                self.viewCircle.frame.origin.x += step
            } else {
                error = true
            }
        case .up:
            if self.viewCircle.frame.origin.y - step > safe.top{
                self.viewCircle.frame.origin.y -= step
                } else {
                error = true
            }
        case .down:
            if self.viewCircle.frame.origin.y + size + step < errorLabel.frame.minY{
                self.viewCircle.frame.origin.y += step
                } else {
                error = true
            }
       }
        if error == true {
            errorLabel.text = "Move \(direction.rawValue) isn't possible"
            error = false
        } else {
            errorLabel.text = "Move \(direction.rawValue)"
        }
   }
}

