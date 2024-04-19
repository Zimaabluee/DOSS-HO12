using System;
using System.IO;
using Xunit;
using ConsoleApp;

namespace ConsoleApp.Tests
{
    public class ProgramTests
    {
        [Fact]
        public void PrintHelloWorld_PrintsHelloWorld()
        {
            // Arrange
            using (StringWriter sw = new StringWriter())
            {
                Console.SetOut(sw);
                var expected = "Hello, World!";

                // Act
                Program.PrintHelloWorld();
                var actual = sw.ToString().Trim();

                // Assert
                Assert.Equal(expected, actual);
            }
        }
    }
}
