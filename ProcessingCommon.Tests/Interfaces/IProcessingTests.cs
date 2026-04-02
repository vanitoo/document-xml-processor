using FluentAssertions;
using ProcessingCommon.Interfaces;
using Xunit;

namespace ProcessingCommon.Tests;

public class IProcessingTests
{
    [Fact]
    public void Processing_GenericInterface_ShouldExist()
    {
        // Arrange
        var sut = new TestProcessing();

        // Act
        var result = sut.Processing("test input");

        // Assert
        result.Should().Be("test input-processed");
    }

    [Fact]
    public void Processing_WithDifferentTypes_ShouldWork()
    {
        // Arrange
        var sut = new IntToStringProcessing();

        // Act
        var result = sut.Processing(42);

        // Assert
        result.Should().Be("42");
    }

    private class TestProcessing : IProcessing<string, string>
    {
        public string Processing(string data) => $"{data}-processed";
    }

    private class IntToStringProcessing : IProcessing<string, int>
    {
        public string Processing(int data) => data.ToString();
    }
}
