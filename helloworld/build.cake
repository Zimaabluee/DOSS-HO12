#addin "nuget:?package=Cake"
#addin "nuget:?package=Cake.Common.Tools.DotNetCore"

Task("Build")
    .Does(() =>
{
    DotNetCoreBuild("./Program.cs");
});

Task("Test")
    .IsDependentOn("Build")
    .Does(() =>
{
    DotNetCoreTest("A:\c#sources\helloworld\unit test\unit test.csproj");
});

Task("Run")
    .IsDependentOn("Test")
    .Does(() =>
{
    DotNetCoreExec("./bin/Debug/Program.dll");
});

RunTarget(target);
