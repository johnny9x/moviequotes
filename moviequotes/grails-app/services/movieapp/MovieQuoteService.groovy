package movieapp

/**
 * Service to create and delete movie quotes.
 */

 class MovieQuoteService {

	MovieQuote createMovieQuote(String quote, String movie) {
		def movieQuote = new MovieQuote(quote: quote, movie: movie)
		movieQuote.save()
		movieQuote
	}

	Boolean deleteMovieQuote(long quoteId) {
		def movieQuote = MovieQuote.get(quoteId)

		try{
			movieQuote.delete(failOnError:true)
		} 
		catch(e) {
			return false
		}

		return true
	}
}