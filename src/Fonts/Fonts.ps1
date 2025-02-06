function Install {
    choco install -y "nerdfont-hack"
    choco upgrade "nerdfont-hack" -y --force
}

Export-ModuleMember -Function Install