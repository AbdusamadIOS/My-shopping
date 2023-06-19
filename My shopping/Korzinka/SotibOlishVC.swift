//
//  SotibOlishVC.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 26/05/23.
//

import UIKit

class SotibOlishVC: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productModeliLbl: UILabel!
    @IBOutlet weak var productNarxiLbl: UILabel!
    @IBOutlet weak var tolovTuriTF: UITextField!
    @IBOutlet weak var yetkazibberishTF: UITextField!
    @IBOutlet weak var xaridQilishBtn: UIButton!
    
    var korzinka: KorzinkaMalumoti?
    let pickerView = UIPickerView()
    let paymentPickerView = UIPickerView()
    
    var olibKetish = ["Uygacha yetkazib berish ", "Pochta officegacha", "Do'kondan olib ketish"]
    var paymentTypes = ["Naq shaklda", "Plastik orqali", "Nasiya Savdo", "Mahsulot kelgandan keyin 15 kun ichida"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        EditRadius()
        setupPaymentPicker()
        setupPicker()
        XaridQilinganProductMAlumoti()
    }
    func EditRadius() {
        xaridQilishBtn.layer.cornerRadius = 15
        productImage.layer.borderColor = UIColor.systemGray2.cgColor
        productImage.layer.borderWidth = 1
        productImage.layer.cornerRadius = 15
        stackView.layer.cornerRadius = 7
        stackView.layer.borderColor = UIColor.systemGray2.cgColor
        stackView.layer.borderWidth = 1
        
    }
    
    func XaridQilinganProductMAlumoti() {
        
        if let korzinka {
            
            productImage.image = korzinka.mahsulotImage
            productModeliLbl.text = korzinka.mahsulotNomi
            productNarxiLbl.text = korzinka.mahsulotNarxi
           
            productImage.layer.borderColor = UIColor.darkGray.cgColor
            productImage.layer.borderWidth = 1
            
           
            
        
        }
     }

    @IBAction func disBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func xaridQilishBtn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Uzur so'raymiz hozirda ilovamizda mahsulot sotib xarid qila olmaymiz!", message: nil, preferredStyle: .alert)

        let Ok = UIAlertAction(title: "Tushunarli.", style: .cancel )

      

        alert.addAction(Ok)
    
        self.present( alert, animated: true)
    }
    func setupPicker() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolBar = UIToolbar()
        let done = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(donePres))
        toolBar.items = [done]
        toolBar.sizeToFit()
        
        yetkazibberishTF.inputView = pickerView
        yetkazibberishTF.inputAccessoryView = toolBar
    }
    @objc func donePres() {
        let row = pickerView.selectedRow(inComponent: 0)
        
        yetkazibberishTF.text = olibKetish[row]
        yetkazibberishTF.resignFirstResponder()  // orqaga qaytish
    }
    
    func setupPaymentPicker() {
        
        paymentPickerView.delegate = self
        paymentPickerView.dataSource = self
        
        let toolBar = UIToolbar()
        let done = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(donePaymentPess))
        toolBar.items = [done]
        toolBar.sizeToFit()
        
        tolovTuriTF.inputView = paymentPickerView
        tolovTuriTF.inputAccessoryView = toolBar
    }
    @objc func donePaymentPess() {
        let row = paymentPickerView.selectedRow(inComponent: 0)
        
        tolovTuriTF.text = paymentTypes[row]
        tolovTuriTF.resignFirstResponder()
    }
}
extension SotibOlishVC : UIPickerViewDelegate, UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        switch pickerView {
        case self.pickerView:
            return olibKetish.count
        default:
            return paymentTypes.count
        }
       
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        

        switch pickerView {
        case self.pickerView:
            return olibKetish[row]
        default:
            return paymentTypes[row]
        }
    }
    
}
