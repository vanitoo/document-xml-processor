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

    [Fact]
    public async Task DocumentProcessorContext_CanAddAndRetrieveProcessingFile()
    {
        // Arrange
        using var context = CreateContext();
        var fileId = Guid.NewGuid();
        var file = new ProcessingFile
        {
            Id = fileId,
            CallbackUrl = "https://test.com"
        };
        file.ProcessingFileData = new ProcessingFileData
        {
            Id = fileId,
            XmlPath = "/path/to/xml"
        };

        // Act
        context.ProcessingFiles.Add(file);
        await context.SaveChangesAsync();

        // Assert
        var retrieved = await context.ProcessingFiles.FindAsync(fileId);
        retrieved.Should().NotBeNull();
        retrieved!.CallbackUrl.Should().Be("https://test.com");
    }

    [Fact]
    public async Task DocumentProcessorContext_CanAddProcessingFileWithErrors()
    {
        // Arrange
        using var context = CreateContext();
        var fileId = Guid.NewGuid();
        var file = new ProcessingFile
        {
            Id = fileId,
            CallbackUrl = "https://test.com"
        };
        file.ProcessingFileData = new ProcessingFileData
        {
            Id = fileId,
            XmlPath = "/path/to/xml"
        };
        file.ProcessingFileErrors.Add(new ProcessingFileError
        {
            Id = Guid.NewGuid(),
            ProcessingFileId = fileId,
            Message = "Test error"
        });

        // Act
        context.ProcessingFiles.Add(file);
        await context.SaveChangesAsync();

        // Assert
        var retrieved = await context.ProcessingFiles
            .Include(f => f.ProcessingFileErrors)
            .FirstOrDefaultAsync(f => f.Id == fileId);
        
        retrieved.Should().NotBeNull();
        retrieved!.ProcessingFileErrors.Should().HaveCount(1);
    }
}
