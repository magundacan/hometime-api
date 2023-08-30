# Hometime - Ruby on Rails Engineer Skill Assessment

The main objective of the project is to create 1 API endpoint that is able to parse and save 2 different payloads.

## My Solution

I considered different approaches in implementing the project, but ultimately decided to perform the parsing on a per-column basis using Service Objects.

The main idea is that I have one dedicated parser per column, which contains the possible formats or patterns of the payload for that column. These dedicated parsers are then called by a generic parser to assemble the attributes of the resource.

Scaling the 1 API endpoint to handle 20+ different types of payload would mean adding the new patterns to each dedicated field parser, requiring no additional files and leaving the rest of the code untouched (indication of a clear Separation of Concerns).

## Getting Started

### Dependencies

* ruby 3.2.2
* rails 7.0.7.2
* postgres 14.9

### Setup

General steps:
```
git clone git@github.com:magundacan/hometime-api.git
bundle install
rails db:create
rails db:migrate
rails s
```

Run the specs:
```
bundle exec rspec
```

The endpoint:
```
POST /api/v1/reservations
```
