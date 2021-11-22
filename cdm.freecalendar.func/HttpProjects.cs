using System.Net;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;

namespace cdm.freecalendar;

/// <summary>
/// Implements the actions to read and write project data.
/// </summary>
public class HttpProjects
{
    private readonly ILogger _logger;

    public HttpProjects(ILoggerFactory loggerFactory)
    {
        _logger = loggerFactory.CreateLogger<HttpProjects>();
    }

    [Function(nameof(HttpProjects) + nameof(Get))]
    public HttpResponseData Get([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post")] HttpRequestData req)
    {
        _logger.LogInformation("C# HTTP trigger function processed a request.");

        var response = req.CreateResponse(HttpStatusCode.OK);

        response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

        response.WriteString("Welcome to Azure Functions!");

        return response;
    }
}
