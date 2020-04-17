//
//  AddMovieViewController.swift
//  Movies
//
//  Created by brian vilchez on 4/16/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import UIKit
protocol FetchMovieDelegate {
    func fetchMovie(_ movie: Movie)
}

class AddMovieViewController: UIViewController {

    //MARK: - Properties
    var delegate: FetchMovieDelegate?
    
    @IBOutlet weak var movieNameTextField: UITextField!
    
    @IBOutlet weak var movieRatingTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveMovie(_ sender: Any) {
        guard let name = movieNameTextField.text, !name.isEmpty,
            let rating = movieRatingTextField.text, !rating.isEmpty else { return }
        
        let movie = Movie(name: name, rating: rating)
        delegate?.fetchMovie(movie)
        navigationController?.popViewController(animated: true)
    }
    
}
