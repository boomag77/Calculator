//
//  ViewController.swift
//  Calculator
//
//  Created by Sergey on 8/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    var calculator = Calculator()
    var operation: Operation?
    var firstTerm: String = "0"
    var secondTerm: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setLabelText("0")
        
    }

    @IBOutlet var textLabel: UILabel?
    
    @IBAction func clearAll(_ sender: UIButton) {
        self.firstTerm = "0"
        self.operation = nil
        calculator.clearAll()
        setLabelText("0")
    }
    
    private func setLabelText(_ text: String) {
        textLabel?.text = text
    }
    
    @IBAction func addDigit(_ sender: UIButton) {
        if self.operation == nil {
            if textLabel!.text! == "0" {
                textLabel!.text! = sender.accessibilityLabel!
            } else {
                textLabel!.text! += sender.accessibilityLabel!
            }
            //calculator.firstTerm = Float(textLabel!.text!)!
            //setLabelText(self.firstTerm)
            return
        } else {
            if !self.secondTerm {
                textLabel?.text = sender.accessibilityLabel!
                self.secondTerm = true
            } else {
                textLabel!.text! += sender.accessibilityLabel!
            }
            return
        }
    }
    
    @IBAction func setOperation(_ sender: UIButton) {
        switch sender.accessibilityLabel {
            case "addition":
                operation = .addition
            case "substraction":
                operation = .substraction
            case "multiplication":
                operation = .multiplication
            case "division":
                operation = .division
            default:
                return
        }
        self.secondTerm = false
        calculator.firstTerm = textLabel!.text!
        
    }
    
    @IBAction func equals(_ sender: UIButton) {
        self.secondTerm = false
        guard self.operation != nil else { return }
        calculator.secondTerm = textLabel!.text!
        if let result = Int(calculator.evaluate(operation!)) {
            setLabelText(String(result))
            return
        }
        setLabelText(calculator.evaluate(operation!))
    }
    
    @IBAction func toggleSign(_ sender: UIButton) {
        if Float(textLabel!.text!)! < 0 {
            textLabel!.text!.removeFirst()
            return
        }
        if self.operation == nil {
            guard self.firstTerm != "0" else { return }
            self.firstTerm = "-" + self.firstTerm
            setLabelText(self.firstTerm)
        } else {
            textLabel!.text! = "-" + textLabel!.text!
        }
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        guard operation != nil else { return }
        calculator.secondTerm = textLabel!.text!
        setLabelText(calculator.percent(operation!))
        
    }
    
    @IBAction func setPoint(_ sender: UIButton) {
        
        if textLabel!.text!.contains(sender.accessibilityLabel!) {
            return
        } else {
            if textLabel!.text! == "0" {
                textLabel?.text = "0."
                return
            }
            textLabel!.text!.append(sender.accessibilityLabel!)
            return
        }
    }
    
}
