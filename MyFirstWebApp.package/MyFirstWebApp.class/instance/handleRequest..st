public
handleRequest: request
	request uri path = #image
		ifTrue: [ request method = #GET
				ifTrue: [ ^ self handleGetRequest: request ].
			request method = #POST
				ifTrue: [ ^ self handlePostRequest: request ] ].
	^ ZnResponse notFound: request uri