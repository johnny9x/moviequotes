package movieapp

/**
 * Controller with actions for displaying, adding, and deleting movie quotes
 */

class MovieQuoteController {

	def movieQuoteService

	def index() {
		//return list of all movie quotes to main index view
		def movieQuotes = MovieQuote.list()
		render view: 'index', model: [movieQuotes: movieQuotes]
	}

	def add() {
		//call service to create movie quote
		def movieQuote = movieQuoteService.createMovieQuote(params.quote, params.movie)

		//return json object of added quote
		render(contentType:'text/json'){
			movieQuote
		}
	}

	def remove() {
		Integer paramValue = params.int('quoteId')
		def movieQuote = MovieQuote.get(paramValue)

		//call service to delete movie quote
		def quoteDeleted = movieQuoteService.deleteMovieQuote(paramValue)

		if (!quoteDeleted) {
			response.sendError 500
			return
		}

		//return json object of deleted quote
		render(contentType:'text/json'){
			movieQuote
		}
	}
}