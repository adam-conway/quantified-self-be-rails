# README

This application is a back-end API that serves up data for a JavaScript front end, found [here](https://github.com/turingschool/qs-frontend-starter).

This API has been deployed to both heroku [here](https://salty-reef-31480.herokuapp.com) and AWS [here](http://quantified-self-be-rails-dev2.us-west-2.elasticbeanstalk.com). The links for the application accessing each of those can be found below:

[Heroku](http://elderly-order.surge.sh/)<br>
[AWS](http://adjoining-transport.surge.sh/)

This API has the following end-points:

## Foods
`GET /api/v1/foods`<br>
Returns all foods

`GET /api/v1/foods/:id`<br>
Returns a single food

`POST /api/v1/foods`<br>
Creates a new food

`DELETE /api/v1/foods/:id`<br>
Deletes a food

`PATCH /api/v1/foods/:id`<br>
Updates a food

## Meal Endpoints
`GET /api/v1/meals`<br>
Returns all meals (and foods)

`GET /api/v1/meals/:meal_id/foods`<br>
Returns all foods for a single meal

`POST /api/v1/meals/:meal_id/foods/:id`<br>
Adds a food to a meal

`DELETE /api/v1/meals/:meal_id/foods/:id`<br>
Removes a food from a meal
