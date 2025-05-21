FROM mcr.microsoft.com/dotnet/runtime:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["../XsltTester/XsltTester.csproj", "../XsltTester/"]
RUN dotnet restore "../XsltTester/XsltTester.csproj"
COPY . .
WORKDIR "/src/../XsltTester"
RUN dotnet build "XsltTester.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "XsltTester.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "XsltTester.dll"]
