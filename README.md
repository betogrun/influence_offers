# Influence Offers

This project is a full stack rails application that allows players to check the offers available and claim the ones they are interested in.

## Prerequisites

Before you begin, ensure you have the following installed for local development:
- Ruby 3.3.0
- Rails 7.1.3
- PostgreSQL (latest version)

For development inside a DevContainer, you'll need:
- Docker
- Visual Studio Code
- Remote - Containers extension for VSCode

## Getting started

### DevContainer Setup

1. **Open in VSCode** - Open the project folder in Visual Studio Code.
2. **Start DevContainer** - With the Remote - Containers extension installed, a pop-up will ask if you want to reopen the project in a container. Click "Reopen in Container". Alternatively, you can open the Command Palette (`Ctrl+Shift+P`) on Windows/Linux or (`Shif+Command+P`) on Mac, and select "Remote-Containers: Open Folder in Container..."

### Local Setup

1. **Install Ruby** - Install Ruby 3.3.0 using your preferred method e.g. asdf, rbenv, rvm.
2. **Install bundler** - Install the bundler gem using `gem install bundler`.
3. **Install PostgreSQL** - Install the latest version of PostgreSQL using your preferred method e.g. Homebrew, apt-get, Docker.

Run `bundle install` to install the required gems.

### Setting Up the Database

```
rails db:create db:migrate db:seed
```

### Running the application

```
./bin/dev
```

## Running the tests

```
rpsec
```

## Contact

Please, feel free to reach out to me!

Name: Alberto Rocha
Email: [betogrun@gmail.com](mailto:betogrun@gmail.com)
