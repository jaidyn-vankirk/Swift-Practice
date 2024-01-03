//
//  ViewController.swift
//  lab-08-jvankirk20
//
//  Created by Jaidyn Vankirk on 12/6/22.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var text: UITextView!
    @IBOutlet var button1: UIBarButtonItem!
    @IBOutlet var button2: UIBarButtonItem!
    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet var sizeView: UIView!
    @IBOutlet var sizeSlider: UISlider!
    @IBOutlet var bodyButton: UIButton!
    @IBOutlet var subheadButton: UIButton!
    @IBOutlet var titleButton: UIButton!
    var fontSize: CGFloat = 15
    var fontWeight = UIFont.Weight.regular

    /*
     Code for the slider to change the font size.
     */
    @IBAction func sliderValueChanged(sender: UISlider){
        fontSize = CGFloat(sender.value)
        text.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        text.font = UIFont(name: text.font!.fontName, size: 15)
        /*
         Defines a primary action in here. Probably a better wat to do it.
         */
        button2.primaryAction = UIAction(title: "Change Font Size"){(action) in
            /*
             Does the math so that the frame is in the correct spot for every device.
             */
            self.sizeView.frame.origin.x = (3*(self.toolbar.frame.width/4)) - 47
            self.sizeView.frame.origin.y = (self.toolbar.frame.origin.y) - 238
            if(self.sizeView.isHidden){ //The toolbar button hides it or shows it.
            self.sizeView.isHidden = false
        } else{
            self.sizeView.isHidden = true
        }
        }
        //Rounds the slider frame.
        self.sizeView.layer.cornerRadius = 9
        /*
         Rotates the slider to be up and down.
         */
        self.sizeSlider.transform = CGAffineTransform(rotationAngle: -Double.pi/2)
        self.sizeView.isHidden = true
        /*
         Does the math so that the toolbar is centered no matter what device it is on.
         */
        self.button1.width = (self.toolbar.frame.width)/2
        self.button2.width = (self.toolbar.frame.width)/2
        self.sizeView.frame.origin.x = (3*(toolbar.frame.width/4)) - 47
        self.sizeView.frame.origin.y = (toolbar.frame.origin.y) - 238
    }
    
    /*
     For the three different buttons at the top.
     */
    @IBAction func actionRegular(sender: UIButton){
        fontWeight = UIFont.Weight.regular
        self.text.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
    
    @IBAction func actionThin(sender: UIButton){
        fontWeight = UIFont.Weight.thin
        self.text.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
    
    @IBAction func actionBold(sender: UIButton){
        fontWeight = UIFont.Weight.bold
        self.text.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
    
    /*
     Gives the information in the text box to the full sized view.
     */
    @IBAction func screenChangeAction(sender: UIBarButtonItem){
        performSegue(withIdentifier: "goToFullScreen", sender: self)
    }
    
    @IBAction func textFieldDone(textView: UIButton){
        text.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationVC = segue.destination as? SecondViewController
        destinationVC?.firstText = text.text
        destinationVC?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
}

