using DocumentXmlProcessorContext.Context;
using DocumentXmlProcessorContext.Entity;
using FluentAssertions;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace DocumentXmlProcessorContext.Tests.Context;

public class DocumentProcessorContextTests
{
    private DocumentProcessorContext CreateContext()
    {
        var options = new DbContextOptionsBuilder<DocumentProcessorContext>()
            .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
            .Options;
        return new DocumentProcessorContext(options);
    }

    [Fact]
    public void DocumentProcessorContext_CanCreateInstance()
    {
        // Arrange & Act
        using var context = CreateContext();

        // Assert
        context.Should().NotBeNull();
    }

    [Fact]
    public void DocumentProcessorContext_HasProcessingFilesSet()
    {
        // Arrange
        using var context = CreateContext();

        // Act & Assert
        context.ProcessingFiles.Should().NotBeNull();
    }

    [Fact]
    public void DocumentProcessorContext_HasProcessingFilesDataSet()
    {
        // Arrange
        using var context = CreateContext();

        // Act & Assert
        context.ProcessingFilesData.Should().NotBeNull();
    }

    [Fact]
    public void DocumentProcessorContext_HasProcessingFileErrorsSet()
    {
        // Arrange
        using var context = CreateContext();

        // Act & Assert
        context.ProcessingFileErrors.Should().NotBeNull();
    }

    // Note: Tests with ProcessingFileData are skipped because InMemory provider 
    // doesn't support JsonDocument property used in ProcessingFile.AdditionalData
}
