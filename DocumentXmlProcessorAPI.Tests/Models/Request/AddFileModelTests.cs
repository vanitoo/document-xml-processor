using DocumentXmlProcessorAPI.Models.Request;
using FluentAssertions;
using Xunit;

namespace DocumentXmlProcessorAPI.Tests.Models.Request;

public class AddFileModelTests
{
    [Fact]
    public void AddFileModel_DefaultValues_ShouldBeNull()
    {
        // Arrange & Act
        var model = new AddFileModel();

        // Assert
        model.Xml.Should().BeNull();
        model.AdditionalData.Should().BeNull();
        model.CallbackUrl.Should().BeNull();
        model.CallbackParams.Should().BeNull();
    }

    [Fact]
    public void AddFileModel_SetProperties_ShouldWork()
    {
        // Arrange
        var xml = "<root>test</root>";
        var additionalData = "{'type': 'test'}";
        var callbackUrl = "https://example.com/callback";
        var callbackParams = "param1=value1";

        // Act
        var model = new AddFileModel
        {
            Xml = xml,
            AdditionalData = additionalData,
            CallbackUrl = callbackUrl,
            CallbackParams = callbackParams
        };

        // Assert
        model.Xml.Should().Be(xml);
        model.AdditionalData.Should().Be(additionalData);
        model.CallbackUrl.Should().Be(callbackUrl);
        model.CallbackParams.Should().Be(callbackParams);
    }

    [Fact]
    public void AddFileModel_OptionalProperties_CanBeNull()
    {
        // Arrange & Act
        var model = new AddFileModel
        {
            Xml = "<root>test</root>"
        };

        // Assert
        model.Xml.Should().NotBeNull();
        model.AdditionalData.Should().BeNull();
        model.CallbackUrl.Should().BeNull();
        model.CallbackParams.Should().BeNull();
    }
}
