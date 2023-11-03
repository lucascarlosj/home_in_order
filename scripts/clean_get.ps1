$packages = "micro_auth", "micro_core", "micro_dependencies", "micro_design_system", "micro_home"

$packages_path = "../packages"

function Write-Color([String]$Text, [ConsoleColor]$Color) {
    $previousColor = $Host.UI.RawUI.ForegroundColor
    $Host.UI.RawUI.ForegroundColor = $Color
    Write-Host $Text
    $Host.UI.RawUI.ForegroundColor = $previousColor
}

foreach ($package in $packages)
{
  Write-Color "🔄 Limpando e obtendo dependências para o pacote $package..." -Color Yellow
  Set-Location -Path $packages_path/$package
  
  flutter clean
  flutter pub get
  
  Set-Location -Path ../../scripts
  Write-Color "✅ Pacote $package limpo e dependências obtidas." -Color Green
}

Write-Color "🎉 Todos os pacotes foram limpos e as dependências foram obtidas." -Color Green
