function Install {
    choco install oh-my-posh -y
    choco install -y "nerdfont-hack";
}

Export-ModuleMember -Function Install