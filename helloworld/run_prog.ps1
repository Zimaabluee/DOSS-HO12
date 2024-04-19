# Run StyleCopAnalyzers
Write-Host "Running StyleCopAnalyzers..."

# 使用 dotnet 命令执行 StyleCopAnalyzers，假设你已经将 StyleCop.Analyzers 包添加到项目中
dotnet build helloworld.csproj /p:RunAnalyzersDuringBuild=true /p:Configuration=Release

# Check if StyleCopAnalyzers produced any warnings or errors
# You can implement this logic based on the output of the above command
# For example:
if ($LASTEXITCODE -ne 0) {
     Write-Host "StyleCopAnalyzers found issues. Please check the output for details."
     # Notify user or take appropriate action
} else {
    Write-Host "StyleCopAnalyzers completed without issues."
}

# Compile C# code using MSBuild
Write-Host "Compiling C# code..."
$projectFile = "helloworld.csproj"  # 请将 "Project.csproj" 替换为你的项目文件的路径
$buildCommand = "msbuild $projectFile /p:Configuration=Release"

# 运行 MSBuild 命令
Invoke-Expression $buildCommand

# 检查编译是否成功
if ($LASTEXITCODE -eq 0) {
    Write-Host "Compilation successful!"
    # 运行生成的可执行文件
    Write-Host "Running the application..."
    Start-Process ".\Program.exe" -NoNewWindow -Wait  # 请将 "Project.exe" 替换为你的生成的可执行文件的路径
} else {
    Write-Host "Compilation failed. Please check for any errors in the code."
}

# Run unit tests using dotnet test command
Write-Host "Running unit tests..."
dotnet test "A:\c#sources\helloworld\unit test\unit test.csproj" --configuration Release

# Check if unit tests passed or failed
# You can implement this logic based on the output of the above command
# For example:
if ($LASTEXITCODE -eq 0) {
    Write-Host "All unit tests passed."
} else {
    Write-Host "Some unit tests failed. Please check the test output for details."
    # Notify user or take appropriate action
}
