# README

Lunch and Learn is a back end app that uses data from multiple API's to expose endpoints that can be utilized to deliver recipes, images, videos and even tourist locations related to a country that a user searches. 

## Author
- Nick Spencer (https://github.com/deadbert)

## System dependencies
- ruby 3.2.2
- rails 7.1.1
- postresql 1.1
- bcrypt 3.1.7
- faraday
- jsonapi-serializer

## Configuration
- fork and clone repo
- run bundle install to install all dependencies from Gemfile
- run `rails s` to run in a local environment to test the application

## Database creation
- `rails db:create`

## How to run the test suite
- run `bundle exec rspec` to run the full test suite

## API's in use
- REST countries API https://restcountries.com/#api-endpoints-v3-all - no API key required
- Edamam for recipes https://developer.edamam.com/edamam-recipe-api - get your key and app id here
- Youtube Search:list endpoint https://developers.google.com/youtube/v3/docs/search/list - get your key and app id with google
- Unsplash for images https://unsplash.com/documentation - https://unsplash.com/documentation#creating-a-developer-account - follow this guide to set up your app and key

## Endpoints
### get "/api/v1/recipes" <br>
- this endpoint requires a parameter {country}, and searches for recipe results related to the country passed as a parameter. passing a value of 'random' for country will select a random country to pull recipes from <br>
#### Example:
<img width="200" alt="Screenshot 2023-11-14 at 7 57 23 AM" src="https://user-images.githubusercontent.com/47225798/282818928-f5874ce3-fe8b-4c69-a6d3-0131838c94ac.png"> <br>
#### Response:
<img width="350" alt="Screenshot 2023-11-14 at 7 59 13 AM" src="https://user-images.githubusercontent.com/47225798/282819783-a054d932-5131-44c3-9c39-d0dcee66b120.png"><br>

### get "/api/v1/learning_resources" <br>
- this endpoint requires the param {country}, and delivers a video as well as images related to the country passed as a parameter.
#### Example:
<img width="350" alt="Screenshot 2023-11-14 at 8 59 21 AM" src="https://user-images.githubusercontent.com/47225798/282840579-efd80998-6ee7-4853-b644-ee34e07093dd.png"> <br>
#### Response:
<img width="500" alt="Screenshot 2023-11-14 at 9 00 29 AM" src="https://user-images.githubusercontent.com/47225798/282840929-72208032-0ea5-4dab-bc72-aee6b288f632.png"> <br>

### post "/api/v1/users" <br>
- this endpoint requires params {name, email, password, password_confirmation} passed in the body of the request. It will create a new user so long as email address is not already in use and passwords match. The password is salted and hashed into a password digest to avoid plain text password logging. This will also auto generate an API key for the user.
#### Example:
<img width="350" alt="Screenshot 2023-11-14 at 9 06 06 AM" src="https://user-images.githubusercontent.com/47225798/282842759-4fe4c02e-4d75-4c81-bba9-6327b031dfd2.png"><br>
#### Response:
<img width="350" alt="Screenshot 2023-11-14 at 9 07 07 AM" src="https://user-images.githubusercontent.com/47225798/282843156-a44b17d2-eaf9-4f2c-b162-5177081a75f5.png"><br>

### post "/api/v1/sessions" <br>
- this endpoint requires params {email, password}, and it will check the that the users credentials are valid and match the credentials after hashing the password. 
#### Example:
<img width="350" alt="Screenshot 2023-11-14 at 9 10 19 AM" src="https://user-images.githubusercontent.com/47225798/282844357-eafa57d7-2a3a-4d72-b7d8-32a25da91a23.png"><br>
#### Reponse:
<img width="350" alt="Screenshot 2023-11-14 at 9 11 08 AM" src="https://user-images.githubusercontent.com/47225798/282844577-31b805a8-ad8b-4938-b02f-775ad12a2e30.png"><br>

### post "/api/v1/favorites" <br>
- this endpoint requires params {api_key, country, recipe_link, recipe_title}, and it will save the recipe as a favorite for the user that matches the provided api_key
#### Example:
<img width="350" alt="Screenshot 2023-11-14 at 9 14 27 AM" src="https://user-images.githubusercontent.com/47225798/282846009-b9d99fb2-6914-4872-a7d9-b2618cbe9bfd.png"><br>
#### Response:
<img width="350" alt="Screenshot 2023-11-14 at 9 15 09 AM" src="https://user-images.githubusercontent.com/47225798/282846354-9317722a-3b29-4261-82d2-f78f0ff11764.png"><br>

### get "/api/v1/favorites" <br>
- this endpoint requires params {api_key}, and it will return a list of all recipes favorited by the user associated with the api_key
#### Example:
<img width="350" alt="Screenshot 2023-11-14 at 9 17 30 AM" src="https://user-images.githubusercontent.com/47225798/282847386-6a92d5f7-d037-4b97-a0f9-6e2c88baac6b.png"><br>
#### Response:
<img width="350" alt="Screenshot 2023-11-14 at 9 18 16 AM" src="https://user-images.githubusercontent.com/47225798/282847645-242b9e0e-f319-439f-bc21-8bcd04d8aec5.png"><br>







