FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

COPY HelloKubernetesDotNet.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["./HelloKubernetesDotNet"]