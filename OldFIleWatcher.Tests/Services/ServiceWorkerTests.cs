using FluentAssertions;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Moq;
using OldFIleWatcher.Models;
using OldFIleWatcher.Services;
using Xunit;

namespace OldFIleWatcher.Tests.Services;

public class ServiceWorkerTests
{
    private readonly Mock<ILogger<ServiceWorker>> _loggerMock;
    private readonly Mock<IOptions<ApiSettings>> _settingsMock;
    private readonly ApiSettings _apiSettings;
    private readonly Mock<IServiceScopeFactory> _scopeFactoryMock;

    public ServiceWorkerTests()
    {
        _loggerMock = new Mock<ILogger<ServiceWorker>>();
        _scopeFactoryMock = new Mock<IServiceScopeFactory>();
        
        _apiSettings = new ApiSettings
        {
            Url = "https://test.com",
            DeleteRequest = "/api/delete",
            CountDelete = 10
        };
        _settingsMock = Mock.Of<IOptions<ApiSettings>>(x => x.Value == _apiSettings);
    }

    [Fact]
    public void ServiceWorker_Constructor_ShouldInitialize()
    {
        // Arrange & Act
        var worker = new ServiceWorker(
            _loggerMock.Object,
            _settingsMock,
            _scopeFactoryMock.Object
        );

        // Assert
        worker.Should().NotBeNull();
    }
}
