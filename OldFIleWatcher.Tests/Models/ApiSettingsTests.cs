using FluentAssertions;
using OldFIleWatcher.Models;
using Xunit;

namespace OldFIleWatcher.Tests.Models;

public class ApiSettingsTests
{
    [Fact]
    public void ApiSettings_DefaultValues_ShouldBeNullOrZero()
    {
        // Arrange & Act
        var settings = new ApiSettings();

        // Assert
        settings.Url.Should().BeNull();
        settings.DeleteRequest.Should().BeNull();
        settings.CountDelete.Should().Be(0);
    }

    [Fact]
    public void ApiSettings_SetProperties_ShouldWork()
    {
        // Arrange
        var url = "https://api.example.com";
        var deleteRequest = "/api/documents/delete";
        var countDelete = 50;

        // Act
        var settings = new ApiSettings
        {
            Url = url,
            DeleteRequest = deleteRequest,
            CountDelete = countDelete
        };

        // Assert
        settings.Url.Should().Be(url);
        settings.DeleteRequest.Should().Be(deleteRequest);
        settings.CountDelete.Should().Be(countDelete);
    }
}
