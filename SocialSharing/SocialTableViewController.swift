//
//  SocialTableViewController.swift
//  SocialSharing
//
//  Created by max on 02.03.2022.
//

import UIKit
import FacebookShare

class SocialTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["Cafe Deadend.jpg", "homei.jpg", "teakha.jpg", "Cafe Loisl.jpg", "petiteoyster.jpg", "For Kee Restaurant.jpg", "posatelier.jpg", "Bourke Street Bakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "Five Leaves.jpg", "Cafe Lore.jpg", "Confessional.jpg", "Barrafina.jpg", "Donostia.jpg", "royaloak.jpg", "CASK Pub and Kitchen.jpg"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SocialTableViewCell

        // Configure the cell...
        cell.featuredImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.nameLabel.text = restaurantNames[indexPath.row]

        return cell
    }
    
    // MARK: - Action Methods
    
    @IBAction func share(_ sender: AnyObject) {
        
        // Get the selected row
        let buttonPosition = sender.convert(CGPoint.zero, to: tableView)
        
        guard let indexPath = tableView.indexPathForRow(at: buttonPosition) else {
            return
        }
        
        // Display the share menu
        let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .actionSheet)
        let twitterAction = UIAlertAction(title: "Twitter", style: .default, handler: nil)
        let facebookAction = UIAlertAction(title: "Facebook", style: .default) { action in
            let selectedImageName = self.restaurantImages[indexPath.row]
            
            guard let selectedImage = UIImage(named: selectedImageName) else { return }
            
            let photo = SharePhoto(image: selectedImage, userGenerated: false)
            let content = SharePhotoContent()
            content.photos = [photo]
            
            let sharingDialog = ShareDialog(fromViewController: self, content: content, delegate: nil)
            
            sharingDialog.show()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        shareMenu.addAction(twitterAction)
        shareMenu.addAction(facebookAction)
        shareMenu.addAction(cancelAction)
        
        self.present(shareMenu, animated: true, completion: nil)
        
    }
    

}
