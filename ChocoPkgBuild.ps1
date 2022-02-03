#Path to your installers; will navigate subdirectories
$path = "\\company.file.server\installers"

#Generate packages over supported types of files
$supportedTypes = @(".exe", ".msi", ".7z", ".zip", ".msu", ".msp")
Get-ChildItem -Path $path -Recurse | ?{
    $extension = [System.IO.Path]::GetExtension($_.Name)
    $supportedTypes.Contains($extension)
    } | %{
    Write-Host "$($_.FullName)"
    #Run choco new against the installer
    & choco new --file "$($_.FullName)" --build-package --outputdirectory $pwd
}