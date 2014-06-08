import movieapp.MovieQuote


class BootStrap {

	// Check if any data exist, and if not add a few movie quotes.
	def init = { servletContext ->

		if (!MovieQuote.count()) {
			new MovieQuote(quote: "I'll be back.", movie: "Terminator").save(failOnError: true)
			new MovieQuote(quote: "You can't handle the truth!", movie: "A Few Good Men").save(failOnError: true)
		}
	}
	def destroy = {
	}
}