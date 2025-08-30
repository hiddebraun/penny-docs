# API specification


## Registration
as-is


## Assets
**NOT MVP**
**for now, everything is static**

GET
/api/v1/assets/app/{id}
header{ AUTH=key }

/api/v1/assets/user/{id}
AUTH=token

## Profile
POST

* **/api/v1/user/profile**

Json payload - as of old


## Onboarding
**NOT MVP**
**FOR NOW IMPLEMENTED STATICALLY**


## PennyBox
The penny box is populated by the backend based on the context

POST
/api/v1/page/pennybox
```json
{
    "page": {
        "type" : "stock-detail",
        "ticker": "APPL"

        ...
    }
}
```

OR

```json
{
    "page": {
        "type" : "products",
        "subtype" :"for-you",
        "ticker": "APPL"

        ...
    }
}
```

Return
```json
{
    "pennybox" : {
        "preset questions": []
        "open box": BOOLEAN
    },
    "leermodules": [],
    "ontdek" : []

}
```


## Chat


/api/v1/chat/
POST
```json
{
    "message" :"..."
    "context": "some representation of history"
}
```

RETURN
```json
{
    "response": 
    [
        {
            "type": "text",
            "content": "lorum ipsum"
        },
        {
            "type": "stock-card",
            "content": "AAPL"
        },
        {
            "type": "leermodule",
            "content": "ll",
            "link": "kk"
        }
    ]

    "MARKDOWN TEXT"
    "actions": 
    "keywords": DOEN WE NIET MEER
    "elements": 

}


```json

{
    "pages": [
        {
            "id" : "#1",
            "page": {
                "type": "slider"
                "question": "",
                "values": ""
            }
        },
        {
            "id" : "#2",
            "page": {
                "type": "MCQ",

                    "question": "Wat is de betekenis van het leven",
                    "options": [ 
                        {
                            "answer": "42",
                        },
                        { 
                            "answer": "hoeren neuken nooit meer werken"
                        }
                    ]
            }
        }
    ]
}
```
