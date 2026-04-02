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

        // Act
        var action = () => processing.Processing(message);

        // Assert - должен вернуть список (может быть пустой при отсутствии XSLT файлов)
        action.Should().NotThrow();
    }
}
