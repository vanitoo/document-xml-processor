using DocumentXmlProcessorContext.Entity;
using FluentAssertions;
using Xunit;

namespace DocumentXmlProcessorContext.Tests.Entity;

public class ProcessingFileTests
{
    [Fact]
    public void ProcessingFile_DefaultValues_ShouldBeCorrect()
    {
        // Arrange & Act
        var file = new ProcessingFile();

        // Assert
        file.Id.Should().Be(Guid.Empty);
        file.DateCreated.Should().BeCloseTo(DateTime.Now, TimeSpan.FromSeconds(5));
        file.DateCompleteProcessing.Should().BeNull();
        file.AdditionalData.Should().BeNull();
        file.CallbackUrl.Should().BeNull();
        file.CallbackParams.Should().BeNull();
    }

    [Fact]
    public void ProcessingFile_SetProperties_ShouldWork()
    {
        // Arrange
        var id = Guid.NewGuid();
        var dateCreated = DateTime.Now.AddDays(-1);
        var callbackUrl = "https://example.com/callback";

        // Act
        var file = new ProcessingFile
        {
            Id = id,
            DateCreated = dateCreated,
            CallbackUrl = callbackUrl
        };

        // Assert
        file.Id.Should().Be(id);
        file.DateCreated.Should().Be(dateCreated);
        file.CallbackUrl.Should().Be(callbackUrl);
    }

    [Fact]
    public void ProcessingFile_IsComplete_WithEmptyPaths_ShouldBeFalse()
    {
        // Arrange
        var file = new ProcessingFile
        {
            ProcessingFileData = new ProcessingFileData()
        };

        // Act
        var isComplete = file.IsComplete;

        // Assert
        isComplete.Should().BeFalse();
    }

    [Fact]
    public void ProcessingFile_IsCompleteHtml_WithHtmlPath_ShouldBeTrue()
    {
        // Arrange
        var file = new ProcessingFile
        {
            ProcessingFileData = new ProcessingFileData
            {
                HtmlPath = "/path/to/html"
            }
        };

        // Act
        var isCompleteHtml = file.IsCompleteHtml;

        // Assert
        isCompleteHtml.Should().BeTrue();
    }

    [Fact]
    public void ProcessingFile_IsCompletePdf_WithPdfPath_ShouldBeTrue()
    {
        // Arrange
        var file = new ProcessingFile
        {
            ProcessingFileData = new ProcessingFileData
            {
                PdfPath = "/path/to/pdf"
            }
        };

        // Act
        var isCompletePdf = file.IsCompletePdf;

        // Assert
        isCompletePdf.Should().BeTrue();
    }
}
