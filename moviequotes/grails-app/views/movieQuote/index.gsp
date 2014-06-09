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
	<div data-role="page" id="main" data-theme="c" data-ajax="false">
		
		<!-- Header Area -->
		<div data-role="header" data-position="fixed" class="header">
			<g:img dir="images" file="logo.png" class="ui-btn-left"/>
			<h1></h1>
			<a href="#popupAdd" id="addButton" data-rel="popup" data-position-to="window" data-icon="plus" data-transition="slidedown" class="ui-btn-right">Add</a>
		</div>

		<!-- Dynamic List -->
		<ul data-role="listview" id="listArea">
			<g:each var="movieQuote" in="${movieQuotes}">
			<li class="ui-li-has-alt" id="listId_${movieQuote.id}">
				<a href="#" class="ui-btn">
					<h2 class="moviequote" id="moviequote">"${movieQuote.quote}"</h2>
					<p class="movietitle" id="movietitle">${movieQuote.movie}</p>
				</a>
				<a href="#popupDelete" data-rel="popup" data-position-to="window" data-transition="slidedown" class="ui-btn ui-btn-icon-notext ui-icon-delete" onclick="setDeleteId(${movieQuote.id})"></a>
			</li>
		</g:each>
	</ul>

	<!-- Add Movie Quotes Popup -->
	<div data-role="popup" id="popupAdd" data-theme="c">
		<div data-role="header" data-theme="c">
			<h1>Add Movie Quote</h1>
		</div>
		<div class="ui-content">
			<form id="addQuoteForm" name="addQuoteForm">
				<h4 class="ui-title">Please add your movie quote below.</h4>
				<textarea type="text" name="quote" id="quote" value="" placeholder="Insert movie quote"></textarea>
				<input type="text" name="movie" id="movie" value="" placeholder="Insert movie title">
				<div class="addButtonContainer">
					<button type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-icon-left ui-icon-check" data-transition="flow" data-rel="back" id="addQuoteButton">Add</button>
					<a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-rel="back">Cancel</a>
				</div>
			</form>
		</div>
	</div>

	<!-- Delete Movie Quotes Popup -->
	<div data-role="popup" id="popupDelete" data-theme="c">
		<div data-role="header" data-theme="c">
			<h1>Delete Movie Quote</h1>
		</div>
		<div class="ui-content">
			<form id="deleteQuoteForm" name="deleteQuoteForm">
				<input type="hidden" name="quoteId" id="quoteId">
				<h4 class="ui-title">Are you sure you want to delete this movie quote?</h4>
				<button type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-rel="back" data-transition="flow" id="deleteQuoteButton">Delete</button>
				<a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-rel="back">Cancel</a>
			</form>
		</div>
	</div>


	<script type="text/javascript">
		//validation for add dialog
		$(document).ready(function (){
			validate();
			$('#quote, #movie').change(validate);
		});
		function validate(){
			if ($('#quote').val().length > 0 && $('#movie').val().length > 0 ) {
				$("#addQuoteButton").prop("disabled", false);
			}
			else {
				$("#addQuoteButton").prop("disabled", true);
			}
		}

		//ajax call to add a quote
		$("#addQuoteButton").on("click", function() {
			$.ajax({
				type: 'GET',
				cache: false,
				url: "${createLink(controller:'movieQuote',action:'add')}",
				data: {
					quote: $('#quote').val(),
					movie: $('#movie').val()
				},
				success: function(data) {
					addNewListItem(data.id, data.quote, data.movie);
					$('#quote').val('');
					$('#movie').val('');
					validate();
				},
				error: function() {alert("error")},
				timeout: 60000 //ms
			});
			$("#popupAdd").popup("close");
			return false;
		});

		//function that adds a new movie quote to list
		function addNewListItem (id, quote, movie)
		{
			$('#listArea').append('<li class="ui-li-has-alt" id="listId_'+id+'"><a href="#" class="ui-btn"><h2 class="moviequote">"'+quote+'"</h2><p class="movietitle">'+movie+'</p></a><a href="#popupDelete" data-rel="popup" data-position-to="window" data-transition="slidedown" class="ui-btn ui-btn-icon-notext ui-icon-delete" onclick="setDeleteId('+id+')"></a></li>')
			$('#listArea').listview('refresh');
		}

		//function that sets the correct quote ID into the form submitted to delete a quote
		function setDeleteId(quoteId) {
			$("#quoteId").val(quoteId);
		}

		//ajax call to delete a quote
		$("#deleteQuoteButton").on("click", function() {
			$.ajax({
				type: 'GET',
				cache: false,
				url: "${createLink(controller:'movieQuote',action:'remove')}",
				data: {
					quoteId: $('#quoteId').val()
				},
				success: function(data) {
					deleteListItem(data.id)
				},
				error: function() {alert("error")},
				timeout: 60000 //ms
			});
			$("#popupDelete").popup("close");
			return false;
		});

		//function that removes a movie quote from list
		function deleteListItem (id)
		{
			$("#listId_"+id).remove();
			$("#listArea").listview('refresh');
		}
	</script>

</div>
</body>


