request handling
handleGetRequest: request
	^ (request uri queryAt: #raw ifAbsent: [ nil ])
		ifNil: [ ZnResponse ok: (ZnEntity html: self html) ]
		ifNotNil: [ ZnResponse ok: self image ]