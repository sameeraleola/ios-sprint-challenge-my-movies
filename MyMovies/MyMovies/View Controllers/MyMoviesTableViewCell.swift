//
//  MyMoviesTableViewCell.swift
//  MyMovies
//
//  Created by Sameera Roussi on 6/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MyMoviesTableViewCell: UITableViewCell {
    
    // MARK: - Watched button action
    @IBAction func watchedButtonTapped(_ sender: Any) {
       // Make sure we have a movie or, outtie!
        guard let movie = movie else { return }
        
        // Toggle hasWatched
        movie.hasWatched = !movie.hasWatched
        
        //pdate the button title
        watcedButton  = movie.hasWatched ? "Watched" : "Unwatched"
        watchedButton.setTitle(watcedButton, for: .normal)
        
        // Execute the update
        movieController?.updateMovie(movie: movie, hasWatched: movie.hasWatched)
    }
    
    // MARK: - Private functions
    private func updateViews() {
        guard let title = movie?.title,
            let hasWatched = movie?.hasWatched
        else { return }
        
        movieTitleLabel.text = title
        
        // Update the watched button title
        watcedButton  = hasWatched ? "Watched" : "Unwatched"
        watchedButton.setTitle(watcedButton, for: .normal)
    }
    
    // MARK: - Properties
    var movieController: MyMoviesController?
    var movie: Movie? { didSet {updateViews()}}
    var watcedButton: String = ""
    
    // MARK: - Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var watchedButton: UIButton!

}
