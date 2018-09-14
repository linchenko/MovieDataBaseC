//
//  LRLMovieTableViewController.swift
//  MovieDataBaseC
//
//  Created by Levi Linchenko on 14/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit


class LRLMovieTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
        fetchMovie(movie: "panda")
        
    }
    
    func fetchMovie(movie: String){
        LRLMovieClient.searchMovie(byTitle: movie) { (movies) in
            guard let movies = movies else {return}
            DispatchQueue.main.async {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    // MARK: - Table view data source
    
    var movies: [LRLMovie]?
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? LRLMovieTableViewCell
        let movies = self.movies?[indexPath.row]
        cell?.movie = movies
        
        
        return cell ?? UITableViewCell()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let movie = searchBarOutlet.text else {return}
        fetchMovie(movie: movie)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
