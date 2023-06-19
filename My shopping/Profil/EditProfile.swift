//
//  EditProfile.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 25/05/23.
//

import UIKit

class EditProfile: UIViewController {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var FIShTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var telefonNomerTF: UITextField!
    @IBOutlet weak var shaharTF: UITextField!
    @IBOutlet weak var saqlashBtn: UIButton!
 
    var closure:((UserDataModel) -> Void)?
    var userdata: UserDataModel?
    let pickerView = UIPickerView()
    
    var olibKetish = ["Toshkent", "Andijon", "Namangan", "Fag'ona", "Samarqand", "Xorazm", "Buxoro", "Navoiy" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPhoto.layer.cornerRadius = 67
        saqlashBtn.layer.cornerRadius = 10
        setupPicker()
        
    }
    func setupPicker() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolBar = UIToolbar()
        let done = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(donePres))
        toolBar.items = [done]
        toolBar.sizeToFit()
        
        shaharTF.inputView = pickerView
        shaharTF.inputAccessoryView = toolBar
    }
    @objc func donePres() {
        let row = pickerView.selectedRow(inComponent: 0)
        
        shaharTF.text = olibKetish[row]
        shaharTF.resignFirstResponder()  // orqaga qaytish
    }

    @IBAction func disBtn(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    @IBAction func saqlashBtn(_ sender: UIButton) {

        if userdata != nil {
            userdata!.FISh = FIShTF.text ?? "no name"
        } else {
            
            userdata = UserDataModel(FISh: FIShTF.text ?? "No name",
                                     email: emailTF.text ?? "No Email",
                                     image: (userPhoto.image ?? UIImage(systemName: "person"))!)
        }
        if let closure {
            closure(userdata!)
        }
       
        dismiss(animated: true)
    }
    @IBAction func uploadImage(_ sender: UIButton) {

        let alert = UIAlertController(title: "Choose image source", message: nil, preferredStyle: .actionSheet)

        let camera = UIAlertAction(title: "Camera", style: .default ) { _ in

            if UIImagePickerController.isSourceTypeAvailable(.camera) {

                let imagePicker = UIImagePickerController()

                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = true

                self.present(imagePicker, animated: true)
            }else{
                let alert = UIAlertController(title: "Camera is not available on this device", message: nil, preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default)

                alert.addAction(ok)

                self.present(alert, animated: true)
            }
        }

        let gallery = UIAlertAction(title: "Gallery", style: .default) { _ in

            let imagePicker = UIImagePickerController()

            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self

            self.present(imagePicker, animated: true)
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        self.present( alert, animated: true)
    }
}
extension EditProfile: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            userPhoto.image = image
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
}

extension EditProfile : UIPickerViewDelegate, UIPickerViewDataSource {

func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
   
    
    return olibKetish.count
}
func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    return olibKetish[row]
   
}

}


