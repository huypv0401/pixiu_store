FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app
COPY . ./

RUN	cd src/SimplCommerce.WebHost && dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:5.0


WORKDIR /app	
COPY --from=build-env /app/src/SimplCommerce.WebHost/out ./
ENTRYPOINT ["dotnet", "SimplCommerce.WebHost.dll"]
