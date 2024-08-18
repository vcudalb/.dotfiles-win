choco install -y dotnet-sdk --version=6.0.100;
choco install -y dotnet-sdk --version=7.0.100;
choco install -y dotnet-sdk --version=8.0.100;

refreshenv;

dotnet tool install --global dotnet-ef;
