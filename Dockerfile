FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env

WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./

# gather and install project dependencies
RUN dotnet restore

# Copy everything else and build
COPY . ./

# build a production release of the project
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app

COPY --from=build-env /app/out .

# have the app listen on port 5000
ENV ASPNETCORE_URLS=http://*:5000

# expose container port 5000
EXPOSE 5000

ENTRYPOINT ["dotnet", "TodoApi.dll"]