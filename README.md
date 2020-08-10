# Cinephile
Cinephile is a movie review application in which users can search for entertainment content through the OMDB (Open Movie Database) API, review content, and add content to watch lists.

## Prerequisites

The setup steps expect the following tools to be installed on the system.

- Github
- Ruby 2.4.0
- Rails 5.0.2

## Install
Clone the repository
```
git clone https://github.com/jordles113/cinephile
```
cd cinephile

## Set up the Database

Run the following commands to create and setup the database: 

```
  bundle exec rake db:create
  bundle exec rake db:setup
```
## Set up .env file 

`bundle add dotenv` and `bundle install` 

Visit the [OMDb API](http://www.omdbapi.com/) to get your API key and add it to you .env file. 

## Starting the Server
You can start the rails server using the following command: 
```
  rails s
```

Visit the site at: http://localhost:3000

## License 

Distributed under the MIT License. See LICENSE for more information.

## Contributing 

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated.

- Fork the Project
- Create your Feature Branch `git checkout -b feature/AmazingFeature`
- Commit your Changes `git commit -m 'Add some AmazingFeature'`
- Push to the Branch `git push origin feature/AmazingFeature`
- Open a Pull Request

## Acknowledgements 

- Flatiron School 
- @MMcClure11 