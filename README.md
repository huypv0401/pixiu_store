

## High level architecture

https://raw.githubusercontent.com/simplcommerce/SimplCommerce/master/modular-architecture.png


## Docker

For testing purpose only `docker run -p 5000:80 simplcommerce/ci-build`

Continuous deployment: https://ci.simplcommerce.com

## Visual Studio 2019 and SQL Server

#### Prerequisites

- SQL Server
- [Visual Studio 2019 version >= 16.8 with .NET Core SDK 5.0.100](https://www.microsoft.com/net/download/all)

#### Steps to run

- Update the connection string in appsettings.json in SimplCommerce.WebHost
- Build whole solution.
- In Solution Explorer, make sure that SimplCommerce.WebHost is selected as the Startup Project
- Open Package Manager Console Window and make sure that SimplCommerce.WebHost is selected as Default project. Then type "Update-Database" then press "Enter". This action will create database schema.
- In Visual Studio, press "Control + F5".
- The back-office can access via /Admin using the pre-created account: admin@simplcommerce.com, 1qazZAQ!

## Mac/Linux with PostgreSQL

#### Prerequisite

- PostgreSQL
- [.NET Core SDK 5.0.100](https://www.microsoft.com/net/download/all)

#### Steps to run

- Update the connection string in appsettings.json in SimplCommerce.WebHost.
- Run file simpl-build.sh by "sudo ./simpl-build.sh". For ubuntu 18 "sudo bash simpl-build.sh"
- In the terminal, navigate to the "src/SimplCommerce.WebHost" type "dotnet run" and hit "Enter".
- Open browser, open http://localhost:5000. The back-office can access via /Admin using the pre-created account: admin@simplcommerce.com, 1qazZAQ!

## Technologies and frameworks used:

- ASP.NET MVC Core 5.0
- Entity Framework Core 5.0
- ASP.NET Identity Core 5.0
- Angular 1.6.3
- MediatR 7.0.0 for domain event

- Star this project on GitHub.
- Report bugs or suggest features by create new issues or add comments to issues
- Submit pull requests
- Spread the word by blogging about SimplCommerce or sharing it on social networks
- Donate us

=======
# pixiu_store
Pixiu Store website
