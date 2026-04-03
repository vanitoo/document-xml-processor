using FluentAssertions;
using PdfProcessor.Processing;
using Xunit;

namespace PdfProcessor.Tests.Processing;

public class PdfProcessingTests
{
    [Fact]
    public void PdfProcessing_Constructor_ShouldInitialize()
    {
        // Act
        var processing = new PdfProcessing();

        // Assert
        processing.Should().NotBeNull();
    }

    [Fact]
    public void PdfProcessing_Processing_WithValidHtml_ShouldReturnBytes()
    {
        // Arrange
        var processing = new PdfProcessing();
        var html = "<html><body><h1>Test</h1></body></html>";

        // Act
        var result = processing.Processing(html);

        // Assert
        result.Should().NotBeNull();
        result.Should().NotBeEmpty();
        // PDF files start with %PDF
        result.Take(4).Should().Equal(new byte[] { 0x25, 0x50, 0x44, 0x46 });
    }

    [Fact]
    public void PdfProcessing_Processing_WithEmptyHtml_ShouldReturnBytes()
    {
        // Arrange
        var processing = new PdfProcessing();
        var html = "<html><body></body></html>";

        // Act
        var result = processing.Processing(html);

        // Assert
        result.Should().NotBeNull();
        result.Should().NotBeEmpty();
    }

    [Fact]
    public void PdfProcessing_Processing_WithComplexHtml_ShouldReturnBytes()
    {
        // Arrange
        var processing = new PdfProcessing();
        var html = @"<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: Arial; }
        .header { color: blue; }
    </style>
</head>
<body>
    <div class='header'>
        <h1>Document Title</h1>
        <p>Paragraph with some text.</p>
        <table>
            <tr><td>Cell 1</td><td>Cell 2</td></tr>
        </table>
    </div>
</body>
</html>";

        // Act
        var result = processing.Processing(html);

        // Assert
        result.Should().NotBeNull();
        result.Should().NotBeEmpty();
        result.Take(4).Should().Equal(new byte[] { 0x25, 0x50, 0x44, 0x46 });
    }
}
