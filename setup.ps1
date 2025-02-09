# Tools to install
$tools = @(
    @{ Name = "Git"; ID = "git.git" },
    @{ Name = "Mise"; ID = "jdx.mise" },
    @{ Name = "Starship"; ID = "starship.starship" },
    @{ Name = "Neovim"; ID = "neovim.neovim" },
    @{ Name = "Neovide"; ID = "Neovide.Neovide" }
    @{ Name = "Ripgrep"; ID = "BurntSushi.ripgrep.MSVC" },
    @{ Name = "fd"; ID = "sharkdp.fd" },
    @{ Name = "fzf"; ID = "junegunn.fzf" },
    @{ Name = "lazygit"; ID = "JesseDuffield.lazygit" },
    @{ Name = "7zip"; ID = "7zip.7zip" },
    @{ Name = "Make"; ID = "GnuWin32.Make" }
    # @{ Name = "Google Chrome"; ID = "Google.Chrome" },
    # @{ Name = "Node.js (LTS)"; ID = "OpenJS.NodeJS.LTS" },
)

# Function to check if a tool is installed
function Is-ToolInstalled {
    param (
        [string]$ID
    )
    try {
        winget list -q $ID | Out-Null
        return $?
    }
    catch {
        return $false
    }
}

# Function to install certain tool
function Install-Tool {
    param (
        [string]$Name,
        [string]$ID
    )
    Write-Host "Installing $Name..."
    try {
        winget install --id $ID --silent --accept-source-agreements --accept-package-agreements
        Write-Host "$Name installed successfully."
    }
    catch {
        Write-Error "Error installing $Name : $($_.Exception.Message)"
    }
}

# Iterate over all needed tools
Write-Host "Installing tools..."
foreach ($tool in $tools) {
    if (-not (Is-ToolInstalled -ID $tool.ID)) {
        Install-Tool -Name $tool.Name -ID $tool.ID
    } else {
        Write-Host "$($tool.Name) is already installed."
    }
}
Write-Host "Tools installation completed."

# Setup Neovim configuration
$nvimPath = Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim"

Write-Host "Configuring Neovim..."
if (-not (Test-Path -Path $nvimPath)) {
    try {
        git clone https://github.com/Juangr4/nvim.git $nvimPath
        Write-Host "Successfully cloned Neovim configuration."
    }
    catch {
        Write-Error "Error cloning nvim repository: $($_.Exception.Message)"
    }
} else {
    try {
        Write-Host "Pulling latest changes from Neovim configuration."
        git -C $nvimPath pull
    }
    catch {
        Write-Error "Error pulling configuration: $($_.Exception.Message)"
    }
}

# Setup Starship configuration
$starshipConfigPath = Join-Path -Path $HOME -ChildPath "starship.toml"
$starshipConfigUrl = "https://raw.githubusercontent.com/Juangr4/dotdev/refs/heads/master/roles/starship/files/starship.toml"

Write-Host "Configuring Starship..."
if (-not (Test-Path -Path $starshipConfigPath)) {
    try {
        Invoke-WebRequest -Uri $starshipConfigUrl -OutFile $starshipConfigPath
        Write-Host "Successfully downloaded Starship configuration."
    }
    catch {
        Write-Error "Error downloading Starship configuration: $($_.Exception.Message)"
    }
} else {
    Write-Host "Starship configuration already exists."
}

# Setup Powershell Profile Configuration
$profileUrl = "https://raw.githubusercontent.com/Juangr4/dotdev/refs/heads/master/profile.ps1"

Write-Host "Configuring Powershell Profile..."
if (-not (Test-Path -Path $profile)) {
    try {
        Invoke-WebRequest -Uri $profileUrl -OutFile $profile
        Write-Host "Successfully downloaded Powershell Profile."
    }
    catch {
        Write-Error "Error downloading Powershell Profile: $($_.Exception.Message)"
    }
} else {
    Write-Host "Powershell Profile already exists."
}

Write-Host "Setup completed."

