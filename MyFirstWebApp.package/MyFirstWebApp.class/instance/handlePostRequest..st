request handling
handlePostRequest: request
	| part newImage badRequest |
	badRequest := [ ^ ZnResponse badRequest: request ].
	(request hasEntity
		and: [ request contentType matches: ZnMimeType multiPartFormData ])
		ifFalse: badRequest.
	part := request entity partNamed: #file ifNone: badRequest.
	newImage := part entity.
	(newImage notNil
		and: [ newImage contentType matches: 'image/*' asZnMimeType ])
		ifFalse: badRequest.
	[ self formForImageEntity: newImage ]
		on: Error
		do: badRequest.
	image := newImage.
	^ ZnResponse redirect: #image