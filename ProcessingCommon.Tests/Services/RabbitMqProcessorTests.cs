using FluentAssertions;
using Xunit;

namespace ProcessingCommon.Tests.Services;

public class RabbitMqProcessorTests
{
    [Fact]
    public void RabbitMqProcessor_ShouldImplementIBrockerProcessor()
    {
        // Arrange & Act
        var type = typeof(ProcessingCommon.Services.RabbitMqProcessor);

        // Assert
        type.Should().Implement<ProcessingCommon.Services.IBrockerProcessor>();
    }

    [Fact]
    public void IBrockerProcessor_ShouldHaveRequiredMethods()
    {
        // Arrange & Act
        var type = typeof(ProcessingCommon.Services.IBrockerProcessor);

        // Assert
        type.GetMethod("SendMessage").Should().NotBeNull();
        type.GetMethod("StartRecived").Should().NotBeNull();
    }
}
