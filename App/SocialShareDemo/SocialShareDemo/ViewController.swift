//
//  ViewController.swift
//  SocialShareDemo
//
//  Created by SHASHANK SINGH on 10/06/23.
//

import UIKit
import SocialShare

class ViewController: UIViewController {

    let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        openPhotoLibrary()
    }

    func openPhotoLibrary() {
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                print("can't open photo library")
                return
            }
            
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            
            present(imagePicker, animated: true)
        }
    
    @IBAction func sharebuttonTapped(_ sender: Any) {
        let shareCordinator = SocialShareCoordinator(viewController: self, fileToShare: imageView.image ?? "www.google.co.in")
        shareCordinator.shareFile()
        
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        defer {
                   picker.dismiss(animated: true)
               }
               
               print(info)
               // get the image
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                   return
               }
               
               // do something with it
               imageView.image = image
           
           // do something with it
           imageView.image = image
           
       }
    
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           defer {
               picker.dismiss(animated: true)
           }
           
           print("did cancel")
       }
}

