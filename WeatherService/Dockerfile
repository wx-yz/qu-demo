FROM mcr.microsoft.com/dotnet/sdk:7.0-jammy AS build

WORKDIR /source
COPY *.csproj .
RUN dotnet restore -r linux-x64 

COPY . .
RUN dotnet publish -c Release -o weatherservice 

FROM mcr.microsoft.com/dotnet/aspnet:7.0-jammy-amd64
WORKDIR /weatherservice
COPY --from=build /source/weatherservice .

#ARG USERNAME=appuser
#ARG USER_UID=10001
#ARG USER_GID=$USER_UID

#RUN groupadd --gid $USER_GID $USERNAME \
#    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# RUN useradd -u 10001 10001


ENTRYPOINT ["dotnet", "WeatherService.dll"]

USER 10001
