//
//  LRLMovieTableViewCell.swift
//  MovieDataBaseC
//
//  Created by Levi Linchenko on 14/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class LRLMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var releaseDateOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    var movie: LRLMovie?{
        didSet{
            
            updateViews()
        }
    }
    
    func updateViews(){
        guard let movie = movie else {return}
        titleOutlet.text = "Title: " + movie.title
        releaseDateOutlet.text = "Released: " + movie.releaseDate
        descriptionOutlet.text = movie.movieDescription
        
        LRLMovieClient.fetchImage(movie) { (image) in
            
            DispatchQueue.main.async {
                
                self.imageOutlet.image = image
                
            }
        }
        
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
