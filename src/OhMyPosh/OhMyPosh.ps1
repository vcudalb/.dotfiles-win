function Install {
    choco install oh-my-posh -y
    choco upgrade oh-my-posh -y --force
}

Export-ModuleMember -Function Install