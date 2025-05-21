using NetCoreHTMLToPDF;
using ProcessingCommon.Interfaces;

namespace PdfProcessor.Processing;

public class PdfProcessing : IProcessing<byte[], string>
{
    public byte[] Processing(string data)
    {
        var converter = new HtmlConverter();
        return converter.FromHtmlString(data);
    }
}