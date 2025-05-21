rem @ECHO OFF
SETLOCAL

SET VERSION=v8.5
SET REGISTRY=192.168.12.104:5050

ECHO === Build ===
#docker build -t file_watcher:%VERSION%   -f Dockerfile-file_watcher .
#docker build -t pdf_processor:%VERSION%  -f Dockerfile-pdf_processor .
#docker build -t xslt_processor:%VERSION% -f Dockerfile-xslt_processor .
#docker build -t api_processor:%VERSION%  -f Dockerfile-api_processor .

ECHO === Tag VERSION ===
docker tag file_watcher:%VERSION% %REGISTRY%/file_watcher:%VERSION%
docker tag pdf_processor:%VERSION% %REGISTRY%/pdf_processor:%VERSION%
docker tag xslt_processor:%VERSION% %REGISTRY%/xslt_processor:%VERSION%
docker tag api_processor:%VERSION% %REGISTRY%/api_processor:%VERSION%

ECHO === Tag latest ===
docker tag file_watcher:%VERSION% %REGISTRY%/file_watcher:latest
docker tag pdf_processor:%VERSION% %REGISTRY%/pdf_processor:latest
docker tag xslt_processor:%VERSION% %REGISTRY%/xslt_processor:latest
docker tag api_processor:%VERSION% %REGISTRY%/api_processor:latest

ECHO === Push VERSION ===
docker push %REGISTRY%/file_watcher:%VERSION%
docker push %REGISTRY%/pdf_processor:%VERSION%
docker push %REGISTRY%/xslt_processor:%VERSION%
docker push %REGISTRY%/api_processor:%VERSION%

ECHO === Push latest ===
docker push %REGISTRY%/file_watcher:latest
docker push %REGISTRY%/pdf_processor:latest
docker push %REGISTRY%/xslt_processor:latest
docker push %REGISTRY%/api_processor:latest

ECHO === Finish ===
PAUSE