<!DOCTYPE html>
<html>
<head>
	<title>Johnny's Movie Quotes</title>
	<meta name="viewport" content="initial-scale=1.0">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'movieapp.css')}" />
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'themes/theme-johnny.min.css')}" />
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'themes/jquery.mobile.icons.min.css')}" />
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile.structure-1.4.2.min.css" />
	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
</head>
<body>
	<div data-role="page" id="main" data-theme="c">
		<!-- Header Area -->
		<div data-role="header" data-position="fixed" class="header">
			<g:img dir="images" file="logo.png" class="ui-btn-left"/>
			<h1></h1>
			<a href="#popupAdd" id="addButton" data-rel="popup" data-position-to="window" data-icon="plus" data-transition="slidedown" class="ui-btn-right">Add</a>
		</div>

		<!-- List Area -->
		<ul data-role="listview">
			<g:each var="movieQuote" in="${movieQuotes}">
			<li class="ui-li-has-alt">
				<a href="#" class="ui-btn">
					<h2 class="moviequote">"${movieQuote.quote}"</h2>
					<p class="movietitle">${movieQuote.movie}</p>
				</a>
				<a href="#popupDelete" data-rel="popup" data-position-to="window" data-transition="slidedown" class="ui-btn ui-btn-icon-notext ui-icon-delete"></a>
			</g:each>
		</ul>

		<!-- Add Movie Quotes Popup -->
		<div data-role="popup" id="popupAdd" data-theme="c">
			<div data-role="header" data-theme="c">
				<h1>Add Movie Quote</h1>
			</div>
			<div class="ui-content">
				<g:form action="add">
					<h4 class="ui-title">Please add your movie quote below.</h4>
					<textarea type="text" name="quote" id="quote" value="" placeholder="Insert movie quote"></textarea>
					<input type="text" name="movie" id="movie" value="" placeholder="Insert movie title">
					<div class="addButtonContainer">
						<button type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-icon-left ui-icon-check" data-rel="back" data-transition="flow">Add</button>
						<a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-rel="back">Cancel</a>
					</div>
				</g:form>
			</div>
		</div>

	<!-- Delete Movie Quotes Popup -->
	<div data-role="popup" id="popupDelete" data-theme="c">
		<div data-role="header" data-theme="c">
			<h1>Delete Movie Quote</h1>
		</div>
		<div class="ui-content">
			<h4 class="ui-title">Are you sure you want to delete this movie quote?</h4>
			<a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-rel="back" data-transition="flow">Delete</a>
			<a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-rel="back">Cancel</a>
		</div>
	</div>

</div>
</body>


