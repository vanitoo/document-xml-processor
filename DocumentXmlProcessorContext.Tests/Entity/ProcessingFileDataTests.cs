using DocumentXmlProcessorContext.Entity;
using FluentAssertions;
using Xunit;

namespace DocumentXmlProcessorContext.Tests.Entity;

public class ProcessingFileDataTests
{
    [Fact]
    public void ProcessingFileData_DefaultValues_ShouldBeCorrect()
    {
        // Arrange & Act
        var data = new ProcessingFileData();

        // Assert
        data.Id.Should().Be(Guid.Empty);
        data.XmlPath.Should().BeNull();
        data.HtmlPath.Should().BeNull();
        data.HtmlTimeProcessing.Should().BeNull();
        data.PdfPath.Should().BeNull();
        data.PdfTimeProcessing.Should().BeNull();
    }

    [Fact]
    public void ProcessingFileData_SetProperties_ShouldWork()
    {
        // Arrange
        var id = Guid.NewGuid();
        var xmlPath = "/path/to/xml";
        var htmlPath = "/path/to/html";
        var pdfPath = "/path/to/pdf";

        // Act
        var data = new ProcessingFileData
        {
            Id = id,
            XmlPath = xmlPath,
            HtmlPath = htmlPath,
            PdfPath = pdfPath,
            HtmlTimeProcessing = 1.5,
            PdfTimeProcessing = 2.5
        };

        // Assert
        data.Id.Should().Be(id);
        data.XmlPath.Should().Be(xmlPath);
        data.HtmlPath.Should().Be(htmlPath);
        data.PdfPath.Should().Be(pdfPath);
        data.HtmlTimeProcessing.Should().Be(1.5);
        data.PdfTimeProcessing.Should().Be(2.5);
    }
}
