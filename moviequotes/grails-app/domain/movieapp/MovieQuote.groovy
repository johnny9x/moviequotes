package movieapp

/**
 * Domain object representing a movie quote.
 */

class MovieQuote {

	String quote
	String movie

	static constraints = {
		quote blank:false
	}
}