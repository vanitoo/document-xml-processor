START /W docker-compose build
ECHO "Complete build"

START /W docker tag build-old-file-watcher 192.168.12.104:5050/build-old-file-watcher-latest
START /W docker tag build-pdf-processing 192.168.12.104:5050/build-pdf-processing-latest
START /W docker tag build-xslt-processing 192.168.12.104:5050/build-xslt-processing-latest
START /W docker tag build-document-xml-processor-api 192.168.12.104:5050/build-document-xml-processor-api-latest

ECHO "Complete generate tag"

START /W docker push 192.168.12.104:5050/build-old-file-watcher-latest
START /W docker push 192.168.12.104:5050/build-pdf-processing-latest
START /W docker push 192.168.12.104:5050/build-xslt-processing-latest
START /W docker push 192.168.12.104:5050/build-document-xml-processor-api-latest

ECHO "Complete pushing"
PAUSE