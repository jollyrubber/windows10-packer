$isos = @{
            "10240.16384.150709-1700.TH1_CLIENTENTERPRISEEVAL_OEMRET_X64FRE_EN-US.ISO" `
                = "http://care.dlservice.microsoft.com/dl/download/C/3/9/C399EEA8-135D-4207-92C9-6AAB3259F6EF/10240.16384.150709-1700.TH1_CLIENTENTERPRISEEVAL_OEMRET_X64FRE_EN-US.ISO";
         }

Import-Module BitsTransfer

Push-Location
Split-Path -Parent $MyInvocation.MyCommand.Definition | Set-Location

foreach($iso in $isos.GetEnumerator()) {

    if(!(Test-Path -Path $iso.Key)) {
        Write-Host -BackgroundColor DarkGreen -ForegroundColor White `
                   "Downloading" $iso.Key
        Start-BitsTransfer `
            -Source $iso.Value `
            -Destination $iso.Key `
            -DisplayName $iso.Key
    }
    else {
        Write-Host -BackgroundColor DarkGreen -ForegroundColor White `
                   "Skipping" $iso.Key
    }
}

Pop-Location
