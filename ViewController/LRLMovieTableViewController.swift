//
//  LRLMovieTableViewController.swift
//  MovieDataBaseC
//
//  Created by Levi Linchenko on 14/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit
import SafariServices


class LRLMovieTableViewController: UITableViewController, UISearchBarDelegate, SFSafariViewControllerDelegate {
    
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
        fetchMovie(movie: "Jack reacher")
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movies = movies else {return}
        let movie = movies[indexPath.row]
        let parcedTitle = movie.title.replacingOccurrences(of: " ", with: "-")
        guard let url: URL = URL(string: "https://www.themoviedb.org/movie/\(movie.identification!)-\(parcedTitle)") else {return}
        let safari = SFSafariViewController(url: url)
        safari.delegate = self
        present(safari, animated: true, completion: nil)
        print(url)
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
        searchBarOutlet.resignFirstResponder()
        
    }
    
    
    
}
