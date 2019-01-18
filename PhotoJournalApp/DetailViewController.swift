//
//  DetailViewController.swift
//  PhotoJournalApp
//
//  Created by Nathalie  on 1/16/19.
//  Copyright © 2019 Nathalie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var photoLibraryButton: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    private var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImagePicker()
        updateUI()
    }
    
    private func showViewController(){
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func updateUI(){
        if let photoJournal =  PhotoJournalModel.getPhotoJournal(){
            let image = UIImage(data: photoJournal.photoData)
            imageView.image = image
        } else {
            print("there is no image")
        }
    }
    
    private func savePhoto(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 0.5){
            let photoJournal = Photo.init(photoData: imageData, photoTitle: "Title", photoDescription: description, createdAt: "no date")
            PhotoJournalModel.savePhotoJournal(photoJournal: photoJournal)
        }
    }
    
    private func setupImagePicker(){
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            cameraButton.isEnabled = false
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            savePhoto(image: image)
        } else {
            print("image is nil")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }
    
    
    @IBAction func photoLibraryButton(_ sender: UIBarButtonItem) {
        showViewController()
    }
    
    @IBAction func cameraButton(_ sender: UIBarButtonItem) {
    }
    
}
