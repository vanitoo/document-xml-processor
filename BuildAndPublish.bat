START /W docker build -t file_watcher -f file_watcher .
START /W docker build -t pdf_processor -f pdf_processor .
START /W docker build -t xslt_processor -f xslt_processor .
START /W docker build -t api_processor -f api_processor .

ECHO "Start build"

START /W docker tag file_watcher 192.168.12.104:5050/build-old-file-watcher-new
START /W docker tag pdf_processor 192.168.12.104:5050/build-pdf-processing-new
START /W docker tag xslt_processor 192.168.12.104:5050/build-xslt-processing-new5
START /W docker tag api_processor 192.168.12.104:5050/build-document-xml-processor-api-new

ECHO "Complete generate tag"

START /W docker push 192.168.12.104:5050/build-old-file-watcher-new
START /W docker push 192.168.12.104:5050/build-pdf-processing-new
START /W docker push 192.168.12.104:5050/build-xslt-processing-new5
START /W docker push 192.168.12.104:5050/build-document-xml-processor-api-new

ECHO "Complete pushing"
PAUSE