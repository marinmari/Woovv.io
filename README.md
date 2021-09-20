# README

This README would normally document whatever steps are necessary to get the
application up and running.

## General Info about WOOVV

Woovv is a platform to find the best workspaces all around you. Once you suscribed, you just need to specifiate the place you want to work and Woovv will display the closest coworking locations to the entered position. Then, you can directly book a place for the period you choosed.

## Useful 

* Production        https://woovv.io/

* GitHub            https://github.com/marinmari/Woovv.io

* Services (job queues, cache servers, search engines, etc.)

app/db/scrapper.rb is a scrapper we developed to collect data from the website https://www.coworking-france.com/. 
We recover a csv file that we used in seed to create Coworkings in the database.
It allows Woovv to propose +2500 reals coworkings in France. 

## Technologies

A list of technologies used within the project:

* Ruby version :                ruby '2.7.4'

* Rails version :               rails '5.2.6'

* PostgreSQL version :          PostgreSQL 13.3


## Installation

$ git clone https://github.com/marinmari/Woovv.io \
$ bundle install \
$ rails db:create \
$ rails db:migrate \
$ rails db:seed

## Contributors

* Amélie Loulergue https://github.com/AmelieLoulergue \
* Jonathan Justman https://github.com/justmanovic \
* David Guetta https://github.com/davguetta \
* Marin Chrétien https://github.com/marinmari \
* Ambroise Bréant https://github.com/Ambizance

### R&D

We decided to do all of our commits in falafel•case, much more vegan, ecological, inclusive and performant for the planet than the kebab-case!
Be good with the Falafel, it will give it back to you
