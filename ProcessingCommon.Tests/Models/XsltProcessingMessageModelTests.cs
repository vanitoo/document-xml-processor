using FluentAssertions;
using ProcessingCommon.Models.Messages;
using Xunit;

namespace ProcessingCommon.Tests.Models;

public class XsltProcessingMessageModelTests
{
    [Fact]
    public void XsltProcessingMessageModel_DefaultValues_ShouldBeCorrect()
    {
        // Arrange & Act
        var model = new XsltProcessingMessageModel();

        // Assert
        model.ProcessDocumentId.Should().Be(Guid.Empty);
        model.Xml.Should().BeNull();
        model.AdditionalData.Should().BeNull();
    }

    [Fact]
    public void XsltProcessingMessageModel_SetProperties_ShouldWork()
    {
        // Arrange
        var id = Guid.NewGuid();
        var xml = "<root>test</root>";
        var additionalData = "{'type': 'test'}";

        // Act
        var model = new XsltProcessingMessageModel
        {
            ProcessDocumentId = id,
            Xml = xml,
            AdditionalData = additionalData
        };

        // Assert
        model.ProcessDocumentId.Should().Be(id);
        model.Xml.Should().Be(xml);
        model.AdditionalData.Should().Be(additionalData);
    }
}
