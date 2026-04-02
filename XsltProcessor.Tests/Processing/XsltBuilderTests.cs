using FluentAssertions;
using Microsoft.Extensions.Logging;
using Moq;
using Xunit;
using XsltProcessor.Processing;

namespace XsltProcessor.Tests.Processing;

public class XsltBuilderTests
{
    private readonly Mock<ILogger> _loggerMock;

    public XsltBuilderTests()
    {
        _loggerMock = new Mock<ILogger>();
    }

    [Fact]
    public void XsltBuilder_Constructor_ShouldInitialize()
    {
        // Arrange
        var xml = "<root>test</root>";

        // Act
        var builder = new XsltBuilder(xml, _loggerMock.Object);

        // Assert
        builder.Should().NotBeNull();
    }

    [Fact]
    public void GetResultHtmls_ShouldReturnEmptyListInitially()
    {
        // Arrange
        var xml = "<root>test</root>";
        var builder = new XsltBuilder(xml, _loggerMock.Object);

        // Act
        var result = builder.GetResultHtmls;

        // Assert
        result.Should().BeEmpty();
    }

    [Fact]
    public void XsltBuilder_WithInvalidXml_ShouldThrowException()
    {
        // Arrange
        var invalidXml = "<root><unclosed>";

        // Act
        var action = () => new XsltBuilder(invalidXml, _loggerMock.Object);

        // Assert
        action.Should().Throw<System.Xml.XmlException>();
    }
}
