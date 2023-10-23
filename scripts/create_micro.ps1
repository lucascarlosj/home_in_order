$esc = [char]27
$reset = "${esc}[0m"
$red = "${esc}[31m"
$green = "${esc}[32m"
$yellow = "${esc}[33m"
$info_icon = "🫡"  
$error_icon = "❌"  
$loading_icon = "⏳"  

$novo_package_name = Read-Host "Digite o nome do novo package"

if ([string]::IsNullOrEmpty($novo_package_name)) {
  Write-Host "${red}${error_icon} O nome do novo package não pode ser vazio. Saindo.${reset}"
  Exit 1
}

$packages_dir = "..\packages"
$json_file_path = "..\.vscode\create_micro_script.json"  

if (-not (Test-Path -Path $json_file_path -PathType Leaf)) {
  Write-Host "${red}${error_icon} O arquivo JSON não foi encontrado em $json_file_path.${reset}"
  Exit 1
}

$novo_package_dir = Join-Path $packages_dir $novo_package_name
if (Test-Path -Path $novo_package_dir -PathType Container) {
  Write-Host "${red}${error_icon} O novo package '$novo_package_name' já existe.${reset}"
  Exit 1
}

New-Item -Path $novo_package_dir -ItemType Directory | Out-Null  

$json_content = Get-Content -Path $json_file_path | ConvertFrom-Json

$loading_text = "${loading_icon} ${yellow}Criando o novo package '$novo_package_name'..."
Write-Host "$loading_text"

foreach ($file in $json_content.files) {
  $file_relative_path = $file.path  

  
  $file_relative_path = $file_relative_path -replace "package_name", $novo_package_name

  $file_path = Join-Path $novo_package_dir $file_relative_path
  $file_content = $file.content

  $file_directory = [System.IO.Path]::GetDirectoryName($file_path)

  if (-not (Test-Path -Path $file_directory -PathType Container)) {
    New-Item -Path $file_directory -ItemType Directory | Out-Null
  }

  $file_content = $file_content -replace "package_name", $novo_package_name

  Set-Content -Path $file_path -Value $file_content
}

$test_dir = Join-Path $novo_package_dir "test"
if (-not (Test-Path -Path $test_dir -PathType Container)) {
  New-Item -Path $test_dir -ItemType Directory | Out-Null
}

$success_text = "${info_icon} ${green}Novo package '$novo_package_name' criado com sucesso.${reset}"
Write-Host "$success_text"

Start-Sleep -Seconds 5
