using DocumentXmlProcessorAPI.Models;
using FluentAssertions;
using Xunit;

namespace DocumentXmlProcessorAPI.Tests.Models;

public class StandartResponseTests
{
    [Fact]
    public void StandartResponse_Ok_ShouldReturnSuccessStatus()
    {
        // Act
        var response = StandartResponseAnswer.Ok("test data");

        // Assert
        response.Status.Should().Be(200);
        response.Message.Should().Be("Запрос успешно обработан");
    }

    [Fact]
    public void StandartResponse_Ok_WithData_ShouldReturnData()
    {
        // Arrange
        var data = "test data";

        // Act
        var response = StandartResponseAnswer.Ok(data);

        // Assert
        response.Data.Should().Be(data);
    }

    [Fact]
    public void StandartResponse_Error_ShouldReturnErrorStatus()
    {
        // Act
        var response = StandartResponseAnswer.Error("Error message");

        // Assert
        response.Status.Should().Be(400);
        response.Message.Should().Be("Error message");
    }

    [Fact]
    public void StandartResponse_Error_WithCustomStatus_ShouldReturnCustomStatus()
    {
        // Act
        var response = StandartResponseAnswer.Error("Not found", 404);

        // Assert
        response.Status.Should().Be(404);
    }

    [Fact]
    public void StandartResponse_GenericOk_ShouldWork()
    {
        // Arrange
        var data = new List<string> { "item1", "item2" };

        // Act
        var response = StandartResponseAnswer.Ok(data);

        // Assert
        response.Data.Should().BeEquivalentTo(data);
        response.Status.Should().Be(200);
    }
}
