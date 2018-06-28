# README

This application is a back-end API that serves up data for a JavaScript front end, found [here](https://github.com/turingschool/qs-frontend-starter)

This API has been deployed to both heroku and AWS. The links for the application accessing each of those can be found below:

[Heroku](http://elderly-order.surge.sh/)
[AWS](http://adjoining-transport.surge.sh/)

This API has the following end-points:

<h1>Foods</h1>
```
GET /api/v1/foods
```
Returns all foods

```
GET /api/v1/foods/:id
```
Returns a single food

```
POST /api/v1/foods
```
Creates a new food

```
DELETE /api/v1/foods/:id
```
Deletes a food

```
PATCH /api/v1/foods/:id
```
Updates a food


<h1>Meal Endpoints</h1>
```
GET /api/v1/meals
```
Returns all meals (and foods)

```
GET /api/v1/meals/:meal_id/foods
```
Returns all foods for a single meal

```
POST /api/v1/meals/:meal_id/foods/:id
```
Adds a food to a meal

```
DELETE /api/v1/meals/:meal_id/foods/:id
```
Removes a food from a meal
