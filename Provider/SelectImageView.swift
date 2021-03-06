//
//  SelectImageView.swift
//  
//
//  Created by CSS on 07/03/18.
//

import UIKit
import Lightbox

class SelectImageView : NSObject{
    
private var completion : (([UIImage])->())?
    
   static let main = SelectImageView()
    
    func show(imagePickerIn view : UIViewController, completion : @escaping ([UIImage])->()){
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        view.present(imagePicker, animated: true, completion: nil)
    }
}


// MARK: - UIImagePickerControllerDelegate
extension SelectImageView: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        picker.dismiss(animated: true, completion: {
            self.completion!([tempImage])
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UINavigationControllerDelegate
extension SelectImageView: UINavigationControllerDelegate {
    
}
