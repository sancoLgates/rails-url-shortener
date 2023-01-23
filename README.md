Simple URL Shortener with Rails

Step test webapp:

* clone this repo
* run: bundle install
* set username & password postgresql in config/database.yml
* run: rails db:create, db:migrate, and db:seed
* run: rails server 
* access http://localhost:3000

Step test API:
* Use Postman or curl to get JWT token
curl -H "Content-Type: application/json" -X POST -d '{"email":"sancolgates1@gmail.com","password":"test123"}' http://localhost:3000/authenticate

Respond example: {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDM4NjEwMjR9.8jeQl5I_WmICOjBgrYp5t89SFSjHuh6IpMCm5owuYPs"}

* Use Postman or curl to Create Url shortener (Use token as Authorization in Header) 

curl -X POST http://localhost:3000/api/v1/shortens -H 'authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDM4NTk1NTl9.L00bsdCBY-vopgDw8wsmNAUsvaFQGXcACjPc97MGjBc' -H 'content-type: application/json' -H 'postman-token: c9ee9726-5852-7414-9ff9-0f46e3aa2ca4' -d '{ "real_url": "test123.com" }'

POST /api/v1/shortens HTTP/1.1
Host: localhost:3000
Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDM4NTk1NTl9.L00bsdCBY-vopgDw8wsmNAUsvaFQGXcACjPc97MGjBc
Content-Type: application/json
Cache-Control: no-cache
Postman-Token: 4b993412-0455-6dc7-3ebc-ee10b16e1ab1

{
  "real_url": "test123.com"
}

Demo: https://secure-headland-42783.herokuapp.com/