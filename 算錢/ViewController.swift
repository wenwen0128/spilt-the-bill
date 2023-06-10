//
//  ViewController.swift
//  算錢
//
//  Created by 溫皓 on 2023/6/7.
//

import UIKit

class ViewController: UIViewController {
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBOutlet weak var perLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func caculateButton(_ sender: Any) {
        //將 UITextField 的 text 屬性的值指派給相應的變數。保證這些 Optional的值 不是nil，以確保它們的值存在。
        // TextField 的 text 也是optional， 但會有值（空字串），一定有東西。可以放心加！。
        let priceText = moneyTextField.text!
        let taxText = taxTextField.text!
        let peopleText = peopleTextField.text!
        // 字串轉數字用於計算
        let price = Double(priceText)
        let tax : Double
        let people = Double(peopleText)
        // 檢查 taxText 是否為空，若為空則將 tax 設為 0，否則轉換為數值
        if taxText.isEmpty{
            tax = 0
        }else {
            tax = Double(taxText) ?? 0
        }
        //在這段程式碼中，使用了可選綁定（Optional Binding）的語法 if let。這種語法允許我們同時將多個可選值進行綁定（解包）並檢查它們是否都不為 nil。
        if let price = price ,let people = people {
            let priceCaculate = price*(1+tax/100)
            let taxCaculate = price*(tax/100)
            let peopleCaculate = price*(1+tax/100)/people
            //這裡使用了 truncatingRemainder(dividingBy: 1) 函數來檢查數值是否有小數部分。如果結果等於 0，表示沒有小數部分，則使用 "%.0f" 格式化字符串來顯示整數。如果有小數部分，則使用 "%.1f" 格式化字符串來顯示一位小數。
            if priceCaculate.truncatingRemainder(dividingBy: 1) == 0{
                moneyLabel.text = String(format:"%.0f",priceCaculate)
            }else {
                moneyLabel.text = String(format:"%.1f",priceCaculate)
            }
            if taxCaculate.truncatingRemainder(dividingBy: 1) == 0{
                taxLabel.text = String(format: "%.0f",taxCaculate)
            }else {
                taxLabel.text = String(format: "%.1f",taxCaculate)
            }
            if peopleCaculate.truncatingRemainder(dividingBy: 1) == 0{
                perLabel.text = String(format: "%.0f", peopleCaculate)
            }else {
                perLabel.text = String(format: "%.1f", peopleCaculate)
            }
        }
        view.endEditing(true)
    }
    @IBAction func clearButton(_ sender: Any) {
        moneyTextField.text = String("")
        taxTextField.text = String("")
        peopleTextField.text = String("")
        moneyLabel.text = String("")
        taxLabel.text = String("")
        perLabel.text = String("")
        
    }
    

}

