# Publishing Helper Script for Windows
# This script helps you prepare and publish your custom fork

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Custom Fork Publishing Helper" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Function to check if npm is logged in
function Test-NpmLogin {
    $result = npm whoami 2>&1
    return $LASTEXITCODE -eq 0
}

# Function to check package name availability
function Test-PackageNameAvailable {
    param([string]$packageName)
    $result = npm view $packageName 2>&1
    return $LASTEXITCODE -ne 0
}

# Main Menu
function Show-Menu {
    Write-Host "What would you like to do?" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Check package name availability"
    Write-Host "2. Test build"
    Write-Host "3. Run tests"
    Write-Host "4. Check NPM login status"
    Write-Host "5. Login to NPM"
    Write-Host "6. Publish to NPM (requires steps 1-4 complete)"
    Write-Host "7. Update version (patch/minor/major)"
    Write-Host "8. Setup Git repository"
    Write-Host "9. Exit"
    Write-Host ""
}

# Main loop
$continue = $true
while ($continue) {
    Show-Menu
    $choice = Read-Host "Enter your choice (1-9)"
    
    switch ($choice) {
        "1" {
            Write-Host "`nChecking if 'myown-node-telegram-bot-api' is available..." -ForegroundColor Cyan
            if (Test-PackageNameAvailable "myown-node-telegram-bot-api") {
                Write-Host "✓ Package name is available!" -ForegroundColor Green
            } else {
                Write-Host "✗ Package name is already taken. Please choose a different name in package.json" -ForegroundColor Red
            }
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        
        "2" {
            Write-Host "`nBuilding project..." -ForegroundColor Cyan
            npm run build
            if ($LASTEXITCODE -eq 0) {
                Write-Host "✓ Build successful!" -ForegroundColor Green
            } else {
                Write-Host "✗ Build failed!" -ForegroundColor Red
            }
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        
        "3" {
            Write-Host "`nRunning tests..." -ForegroundColor Cyan
            npm test
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        
        "4" {
            Write-Host "`nChecking NPM login status..." -ForegroundColor Cyan
            if (Test-NpmLogin) {
                $username = npm whoami
                Write-Host "✓ Logged in as: $username" -ForegroundColor Green
            } else {
                Write-Host "✗ Not logged in to NPM" -ForegroundColor Red
                Write-Host "Run option 5 to login" -ForegroundColor Yellow
            }
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        
        "5" {
            Write-Host "`nLogging in to NPM..." -ForegroundColor Cyan
            npm login
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        
        "6" {
            Write-Host "`nPublishing to NPM..." -ForegroundColor Cyan
            Write-Host "This will publish your package publicly!" -ForegroundColor Yellow
            $confirm = Read-Host "Are you sure? (yes/no)"
            
            if ($confirm -eq "yes") {
                # Build first
                Write-Host "Building..." -ForegroundColor Cyan
                npm run build
                
                if ($LASTEXITCODE -eq 0) {
                    # Publish
                    Write-Host "Publishing..." -ForegroundColor Cyan
                    npm publish --access public
                    
                    if ($LASTEXITCODE -eq 0) {
                        Write-Host "✓ Successfully published!" -ForegroundColor Green
                        Write-Host "Your package is now available: npm install myown-node-telegram-bot-api" -ForegroundColor Green
                    } else {
                        Write-Host "✗ Publishing failed!" -ForegroundColor Red
                    }
                } else {
                    Write-Host "✗ Build failed! Fix errors before publishing." -ForegroundColor Red
                }
            } else {
                Write-Host "Publishing cancelled." -ForegroundColor Yellow
            }
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        
        "7" {
            Write-Host "`nUpdate version:" -ForegroundColor Cyan
            Write-Host "1. Patch (bug fixes: 1.0.0 -> 1.0.1)"
            Write-Host "2. Minor (new features: 1.0.0 -> 1.1.0)"
            Write-Host "3. Major (breaking changes: 1.0.0 -> 2.0.0)"
            $versionChoice = Read-Host "Choose version type (1-3)"
            
            switch ($versionChoice) {
                "1" { npm version patch }
                "2" { npm version minor }
                "3" { npm version major }
                default { Write-Host "Invalid choice" -ForegroundColor Red }
            }
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        
        "8" {
            Write-Host "`nGit Repository Setup" -ForegroundColor Cyan
            Write-Host "Make sure you've created a repository on GitHub first!" -ForegroundColor Yellow
            Write-Host ""
            $username = Read-Host "Enter your GitHub username"
            
            if ($username) {
                Write-Host "Updating git remote..." -ForegroundColor Cyan
                git remote remove origin 2>$null
                git remote add origin "https://github.com/$username/myown-node-telegram-bot-api.git"
                
                Write-Host "✓ Remote updated!" -ForegroundColor Green
                Write-Host ""
                Write-Host "Next steps:" -ForegroundColor Yellow
                Write-Host "  git add ."
                Write-Host "  git commit -m `"Initial commit of custom fork`""
                Write-Host "  git push -u origin master"
            }
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
        
        "9" {
            Write-Host "`nGoodbye!" -ForegroundColor Cyan
            $continue = $false
        }
        
        default {
            Write-Host "Invalid choice. Please select 1-9." -ForegroundColor Red
            Write-Host ""
            Read-Host "Press Enter to continue"
        }
    }
    
    Clear-Host
}

