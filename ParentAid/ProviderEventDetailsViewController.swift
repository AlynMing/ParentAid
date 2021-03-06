//
//  EventDetailsViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/13/20.
//

import UIKit
import Parse
import AlamofireImage

class ProviderEventDetailsViewController: UIViewController {
    //store selected event
    var event : PFObject!
    var events = [PFObject]()
    var providerUser : PFObject!
    var providerProfiles = [PFObject]()
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var providerProfilePhoto: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var providerName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var checkboxCOVIDsafe: UILabel!
    @IBOutlet weak var eventRegistrants: UILabel!
    @IBOutlet weak var availableSpots: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //display provider name
        if let user = event["provider"] as? PFUser{
        providerName.text = user.username
        }
        
        eventTitle.text = event["title"] as? String
        eventTitle.sizeToFit()
        
        synopsisLabel.text = event["synopsis"] as? String
        synopsisLabel.sizeToFit()
        
        eventDate.text = event["date"] as? String
        eventDate.sizeToFit()
        
        if let imageFile = event["image"] as? PFFileObject{
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        eventImageView.af.setImage(withURL: url)
        //To make round corners of the image
        eventImageView.layer.cornerRadius = 10
        eventImageView.clipsToBounds = true
    }
    }
//
//
//            if let imageProviderFile = providerUser["profilePhotoImageView"] as? PFFileObject{
//                    let urlProviderPhotoString = imageProviderFile.url!
//                    let urlProviderPhoto = URL(string: urlProviderPhotoString)!
//                    providerProfilePhoto.af.setImage(withURL: urlProviderPhoto)
//            //To make round corners of the image
//                    providerProfilePhoto.layer.cornerRadius = 10
//                    providerProfilePhoto.clipsToBounds = true
//
//            }else{
//                print ("@@@@@@@@@@@@ No profile picture" )
//            }
//        }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
