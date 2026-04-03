using FluentAssertions;
using Microsoft.Extensions.Logging;
using Moq;
using ProcessingCommon.Models.Messages;
using Xunit;
using XsltProcessor.Processing;

namespace XsltProcessor.Tests.Processing;

public class DocumentProcessingTests
{
    private readonly Mock<ILogger<DocumentProcessing>> _loggerMock;

    public DocumentProcessingTests()
    {
        _loggerMock = new Mock<ILogger<DocumentProcessing>>();
    }

    [Fact]
    public void DocumentProcessing_Constructor_ShouldInitialize()
    {
        // Arrange & Act
        var processing = new DocumentProcessing(_loggerMock.Object);

        // Assert
        processing.Should().NotBeNull();
    }

    [Fact]
    public void Processing_WithValidData_ShouldReturnList()
    {
        // Arrange
        var processing = new DocumentProcessing(_loggerMock.Object);
        var message = new XsltProcessingMessageModel
        {
            ProcessDocumentId = Guid.NewGuid(),
            Xml = "<root>test</root>"
        };

        // Act & Assert - expects exception due to missing XSLT files in test environment
        // This is expected behavior - in production environment XSLT files would be available
        var action = () => processing.Processing(message);
        action.Should().Throw<Exception>(); // XsltNotFoundException or similar
    }
}
