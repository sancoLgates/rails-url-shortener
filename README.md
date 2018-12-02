Simple URL Shortener with Rails

Step test webapp:

* clone this repo
* run bundle install
* set username & password postgresql in config/database.yml
* run rails db:create, db:migrate, and db:seed
* run rails server default:localhost:3000

Step test API:
* Use Postman or curl to get JWT token
curl -H "Content-Type: application/json" -X POST -d '{"email":"sancolgates1@gmail.com","password":"test123"}' http://localhost:3000/authenticate

Respond example: {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDM4NjEwMjR9.8jeQl5I_WmICOjBgrYp5t89SFSjHuh6IpMCm5owuYPs"}

* Use Postman or curl to Create Url shortener 
curl -X POST \
  http://localhost:3000/api/v1/shortens \
  -H 'authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDM4NTk1NTl9.L00bsdCBY-vopgDw8wsmNAUsvaFQGXcACjPc97MGjBc' \
  -d '{
  "real_url": "test123.com"
}'