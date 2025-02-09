function loadenv {
    get-content ./.env* | foreach-object { 
        $name, $value = $_ -split '=', 2
        # Check that name is not empty and that it is not a comment
        if ($name -and $name -notmatch '^\s*#') {
            # Write-Output "Setting $name to $value"
            set-item -path env:\$name -value $value
        }
    }
}

function title {
    $Host.UI.RawUI.WindowTitle = $args -join ' '
}

Function gig {
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$list
  )
  $params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ","
  Invoke-WebRequest -Uri "https://www.toptal.com/developers/gitignore/api/$params" | select -ExpandProperty content | Out-File -FilePath $(Join-Path -path $pwd -ChildPath ".gitignore") -Encoding ascii
}

$shimPath = "$env:USERPROFILE\AppData\Local\mise\shims"
$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User')

if (-not $currentPath.Contains($shimPath)) {
    $newPath = $currentPath + ";" + $shimPath
    [Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
    # Write-Host "Added $shimPath to User's Path."
}

$ENV:STARSHIP_CONFIG = "$HOME\starship.toml"
$ENV:STARSHIP_DISTRO = " xcad"
Invoke-Expression (&starship init powershell)
