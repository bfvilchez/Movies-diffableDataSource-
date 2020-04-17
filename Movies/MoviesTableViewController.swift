//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by brian vilchez on 4/16/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    //MARK: - Properties
    private var movies: [Movie] = []
    private var diffableDataSource: UITableViewDiffableDataSource<Section,Movie>?
    
    var collectionDataSource: UICollectionViewDiffableDataSource<Section,Movie>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
    }
    
    //MARK: - Methods
    
    private func configureDataSource() {
        diffableDataSource = UITableViewDiffableDataSource<Section,Movie>(tableView: tableView, cellProvider: { (tableView, indexPath, movie) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
            cell.textLabel?.text = movie.name
            return cell
        })
    }
    
    private func populateWithSnapShots() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Movie>()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        diffableDataSource?.apply(snapshot)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMovieSegue" {
            guard let destinationVC = segue.destination as? AddMovieViewController else { return }
            destinationVC.delegate = self
        }
    }
    

}

extension MoviesTableViewController {
    enum Section {
        case main
    }
}

extension MoviesTableViewController: FetchMovieDelegate {
    func fetchMovie(_ movie: Movie) {
        self.movies.append(movie)
        populateWithSnapShots()
    }
    
    
}
