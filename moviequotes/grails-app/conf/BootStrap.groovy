import movieapp.MovieQuote


class BootStrap {

	// Check if any data exist, and if not add a few movie quotes.
	def init = { servletContext ->

		if (!MovieQuote.count()) {
			new MovieQuote(quote: "I'll be back.", movie: "Terminator").save(failOnError: true)
			new MovieQuote(quote: "You can't handle the truth!", movie: "A Few Good Men").save(failOnError: true)
			new MovieQuote(quote: "Keep your friends close, but your enemies closer", movie: "The Godfather Part II").save(failOnError: true)
			new MovieQuote(quote: "This is Sparta.", movie: "300").save(failOnError: true)
			new MovieQuote(quote: "Houston, we have a problem.", movie: "Apollo 13").save(failOnError: true)
			new MovieQuote(quote: "Dodge this.", movie: "The Matrix").save(failOnError: true)
			new MovieQuote(quote: "I'm your huckleberry.", movie: "Tombstone").save(failOnError: true)
			new MovieQuote(quote: "Are you going to bark all day little doggie, or are you going to bite?", movie: "Reservoir Dogs").save(failOnError: true)
			new MovieQuote(quote: "I find your lack of faith disturbing.", movie: "Star Wars:Episode IV").save(failOnError: true)
			new MovieQuote(quote: "Say hello to my little friend.", movie: "Scarface").save(failOnError: true)
			new MovieQuote(quote: "I am McLovin.", movie: "Superbad").save(failOnError: true)
			new MovieQuote(quote: "I'm going to miss you monkey. I wish monkeys could Skype. Maybe one day.", movie: "The Hangover Part II").save(failOnError: true)
		}
	}
	def destroy = {
	}
}