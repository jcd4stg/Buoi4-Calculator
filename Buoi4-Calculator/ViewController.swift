//
//  ViewController.swift
//  Buoi4-Calculator
//
//  Created by lynnguyen on 19/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    var firstNumber = 0
    var resultNumber = 0
    
    var currentOperation: Operation?
    
    enum Operation {
        case add, substract, multiply, divide
    }
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var percenButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var mutiplyButton: UIButton!
    
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var substractButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    var arrayRow1: [UIButton]?
    var arrayRow2: [UIButton]?
    var arrayRow3: [UIButton]?
    var arrayRow4: [UIButton]?
    var arrayRow5: [UIButton]?
    var arrayRow6: [UIButton]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellWidth = clearButton.frame.size.width
        let spacing: CGFloat = 1
        let initialButtonX = clearButton.frame.origin.x - cellWidth * 2
        
        arrayRow1 = [clearButton, deleteButton, percenButton]
        
        for x in 0..<arrayRow1!.count {
            arrayRow1![x].frame.origin.x = initialButtonX
        }
        for x in 0..<arrayRow1!.count {
            UIView.animate(withDuration: 2) {
                self.arrayRow1![x].frame.origin.x = initialButtonX + cellWidth * (CGFloat(x) + 2) + spacing
            }
        }
        
        arrayRow2 = [sevenButton, eightButton, nineButton]
        for x in 0..<arrayRow2!.count {
            arrayRow2![x].tag = x + 7
            arrayRow2![x].frame.origin.x = initialButtonX
            arrayRow2![x].frame.origin.y = clearButton.frame.origin.y + spacing + cellWidth
        }
        for x in 0..<arrayRow2!.count {
            UIView.animate(withDuration: 2) {
                self.arrayRow2![x].frame.origin.x = initialButtonX + cellWidth * (CGFloat(x) + 2) + spacing
            }
        }
        
        arrayRow3 = [fourButton, fiveButton, sixButton]
        for x in 0..<arrayRow3!.count {
            arrayRow3![x].tag = x + 4
            arrayRow3![x].frame.origin.x = initialButtonX
            arrayRow3![x].frame.origin.y = clearButton.frame.origin.y + spacing + cellWidth * 2
        }
        for x in 0..<arrayRow3!.count {
            UIView.animate(withDuration: 2) {
                self.arrayRow3![x].frame.origin.x = initialButtonX + cellWidth * (CGFloat(x) + 2) + spacing
            }
        }
        
        arrayRow4 = [oneButton, twoButton, threeButton]
        for x in 0..<arrayRow4!.count {
            arrayRow4![x].tag = x + 1
            arrayRow4![x].frame.origin.x = initialButtonX
            arrayRow4![x].frame.origin.y = clearButton.frame.origin.y + spacing + cellWidth * 3
        }
        for x in 0..<arrayRow4!.count {
            UIView.animate(withDuration: 2) {
                self.arrayRow4![x].frame.origin.x = initialButtonX + cellWidth * (CGFloat(x) + 2) + spacing
            }
        }
        
        arrayRow5 = [zeroButton, decimalButton]
        for x in 0..<arrayRow5!.count {
            arrayRow1![1].tag = 0
            arrayRow5![x].frame.origin.x = initialButtonX
            arrayRow5![x].frame.origin.y = clearButton.frame.origin.y + spacing + cellWidth * 4
        }
        for x in 0..<arrayRow5!.count {
            UIView.animate(withDuration: 2) {
                self.arrayRow5![x].frame.origin.x = initialButtonX + cellWidth * (CGFloat(x) + 2) + spacing
            }
        }
        
        arrayRow6 = [divideButton, mutiplyButton, substractButton, addButton, equalButton]
        
        for x in 0..<arrayRow6!.count {
            arrayRow6![x].tag = x
            arrayRow6![x].frame.origin.x = initialButtonX
            arrayRow6![x].frame.origin.y = clearButton.frame.origin.y + spacing + cellWidth * CGFloat(x)
        }
        for x in 0..<arrayRow6!.count {
            UIView.animate(withDuration: 2) {
                self.arrayRow6![x].frame.origin.x = initialButtonX + cellWidth * 4 + spacing
            }
        }
        
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        calculatorResults.text = "0"
        currentOperation = nil
        firstNumber = 0
    }
    
    @IBAction func backTap(_ sender: Any) {
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let tag = sender.tag
        
        if calculatorResults.text == "0" {
            calculatorResults.text = "\(tag)"
        } else if let text = calculatorResults.text {
            calculatorResults.text = "\(text)\(tag)"
        }
    }
    
    @IBAction func operationTapped(_ sender: UIButton) {
        let tag = sender.tag
        
        if let text = calculatorResults.text, let value = Int(text), firstNumber == 0 {
            firstNumber = value
            calculatorResults.text = "0"
        }
        
        if tag == 0 {
            currentOperation = .divide
        } else if tag == 1 {
            currentOperation = .multiply
        } else if tag == 2 {
            currentOperation = .substract
        } else if tag == 3 {
            currentOperation = .add
        } else if tag == 4 {
            if let operation = currentOperation {
                var secondNumber = 0
                if let text = calculatorResults.text, let value = Int(text) {
                    secondNumber = value
                }
                switch operation {
                case .divide:
                    let result = Double(firstNumber) / Double(secondNumber)
                    calculatorResults.text = formatNumber(for: Int(result))
                    break
                case .multiply:
                    let result = firstNumber * secondNumber
                    calculatorResults.text = formatNumber(for: result)
                    break
                case .substract:
                    let result = firstNumber - secondNumber
                    calculatorResults.text = formatNumber(for: result)
                    break
                case .add:
                    let result = firstNumber + secondNumber
                    calculatorResults.text = formatNumber(for: result)
                    break
                }
            }
        }
    }
    
    func formatNumber(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        let formatedNumber = numberFormat.string(from: NSNumber(value: number))
        return formatedNumber ?? "\(number)"
    }
}

