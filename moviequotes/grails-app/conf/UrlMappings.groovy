class UrlMappings {

	static mappings = {
        // "/$controller/$action?/$id?(.$format)?"{
        //     constraints {
        //         // apply constraints here
        //     }
        // }

        "/"(controller: 'movieQuote')
        "/movieQuote/add"(controller: 'movieQuote', action: 'add')
        "/movieQuote/remove"(controller: 'movieQuote', action: 'remove')
        "500"(view:'/error')
	}
}