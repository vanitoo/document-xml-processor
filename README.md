# Инструкция по сборке:
Сначала выполняете сборку проекта через compound BuildAll.
Далее копируете docker-compose.yml в папку с собранными проектами.

Выполняете Build.bat, после чего дожидаетесь завершения и 
после этого обновляете images на сервере через pull.

Или в ручную следующим образом:

Сборка исходников в изображения:

<ul>
<li>docker-compose build</li>
</ul>

Добавление тега изображениям:

<ul>
<li>docker tag build-old-file-watcher 192.168.12.104:5050/build-old-file-watcher-latest</li>
<li>docker tag build-pdf-processing 192.168.12.104:5050/build-pdf-processing-latest</li>
<li>docker tag build-xslt-processing 192.168.12.104:5050/build-xslt-processing-latest</li>
<li>docker tag build-document-xml-processor-api 192.168.12.104:5050/build-document-xml-processor-api-latest</li>
</ul>

Заливка изображений в приватный registry:

<ul>
<li>docker push 192.168.12.104:5050/build-old-file-watcher-latest</li>
<li>docker push 192.168.12.104:5050/build-pdf-processing-latest</li>
<li>docker push 192.168.12.104:5050/build-xslt-processing-latest</li>
<li>docker push 192.168.12.104:5050/build-document-xml-processor-api-latest</li>
</ul>


