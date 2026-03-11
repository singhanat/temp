param (
    [Parameter(Mandatory = $true)]
    [string]$Path
)

# Check if the path exists
if (-not (Test-Path -Path $Path)) {
    Write-Error "The specified path does not exist: $Path"
    return
}

# Define the regex pattern for " (number)" at the end of the filename (before extension)
# This pattern matches one or more spaces followed by parentheses containing one or more digits at the end of the base name.
$regex = "\s+\(\d+\)$"

# Get all files in the directory
$files = Get-ChildItem -Path $Path -File

foreach ($file in $files) {
    # Check if the BaseName (filename without extension) matches the pattern
    if ($file.BaseName -match $regex) {
        # Create the new name by removing the matched pattern
        $newName = ($file.BaseName -replace $regex, "") + $file.Extension
        $newPath = Join-Path -Path $file.DirectoryName -ChildPath $newName

        # Check if a file with the new name already exists
        if (Test-Path -Path $newPath) {
            Write-Warning "Skipped: '$($file.Name)' -> New name '$newName' already exists."
        } else {
            Write-Host "Renaming: '$($file.Name)' -> '$newName'"
            Rename-Item -Path $file.FullName -NewName $newName
        }
    }
}
