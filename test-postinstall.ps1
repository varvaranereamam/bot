# Test script to verify postinstall will work
Write-Host "=== Testing Postinstall Flow ===" -ForegroundColor Cyan

# Test 1: Check if src/extract.js exists
Write-Host "`n[TEST 1] Checking if src/extract.js exists..."
if (Test-Path "src\extract.js") {
    Write-Host "  ✓ src\extract.js found" -ForegroundColor Green
} else {
    Write-Host "  ✗ src\extract.js NOT FOUND!" -ForegroundColor Red
    exit 1
}

# Test 2: Check if unzipper is in dependencies
Write-Host "`n[TEST 2] Checking if unzipper is in package.json..."
$packageJson = Get-Content "package.json" | ConvertFrom-Json
if ($packageJson.dependencies.unzipper) {
    Write-Host "  ✓ unzipper found in dependencies: $($packageJson.dependencies.unzipper)" -ForegroundColor Green
} else {
    Write-Host "  ✗ unzipper NOT in dependencies!" -ForegroundColor Red
    exit 1
}

# Test 3: Check if node_modules/unzipper exists
Write-Host "`n[TEST 3] Checking if unzipper is installed..."
if (Test-Path "node_modules\unzipper") {
    Write-Host "  ✓ unzipper installed in node_modules" -ForegroundColor Green
} else {
    Write-Host "  ⚠ unzipper not installed. Run 'npm install' first" -ForegroundColor Yellow
}

# Test 4: Try to run the extract script with dry-run
Write-Host "`n[TEST 4] Testing if Node.js can load the extract script..."
$output = node -e "try { require('./src/extract.js'); } catch(e) { console.error('Error:', e.message); process.exit(1); }" 2>&1
Write-Host "  Output from script:"
Write-Host "  $output"

# Test 5: Simulate the postinstall command
Write-Host "`n[TEST 5] Simulating postinstall command..."
Write-Host "  Would run: powershell -NoProfile -ExecutionPolicy Bypass -Command ..." -ForegroundColor Yellow

Write-Host "`n=== Test Complete ===" -ForegroundColor Cyan
Write-Host "If all tests passed, run: npm install" -ForegroundColor Green
Write-Host "Or manually test: npm run postinstall" -ForegroundColor Green

