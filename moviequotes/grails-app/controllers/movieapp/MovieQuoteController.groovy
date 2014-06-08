package movieapp

class MovieQuoteController {

	def movieQuoteService

	def index() {
		def movieQuotes = MovieQuote.list()
		render view: 'index', model: [movieQuotes: movieQuotes]
	}

	def add() {
		def movieQuote = movieQuoteService.createMovieQuote(params.quote, params.movie)

		if (movieQuote.hasErrors()) {
			return [movieQuoteBean: movieQuote]
		}

		redirect action: 'index'
		//redirect(action: "index")
	}
}