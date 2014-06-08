package movieapp

/**
 * Service to create a movie quote.
 */

class MovieQuoteService {

	// MovieQuoteController
	MovieQuote createMovieQuote(String quote, String movie) {
		def movieQuote = new MovieQuote(quote: quote, movie: movie)
		movieQuote.save()
		movieQuote
	}
}