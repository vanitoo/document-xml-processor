<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.16.0" xmlns:vtstek="urn:customs.ru:Information:SQDocuments:FsVtsTekLicense:5.16.0">
  <!-- Шаблон для типа FsVtsTekLicenseType -->
  <xsl:template match="vtstek:FsVtsTekLicense">
    <xsl:param name="w" select="190" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
      </head>
      <body>
        <div class="page" style="width: {$w}mm;">
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                    <b>Лицензия ФСТЭК России на ввоз-вывоз продукции/ Лицензия ФСВТС</b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="vtstek:BDRDID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Идентификатор документа по БД РД</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="vtstek:BDRDID" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="vtstek:KindLicense">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Вид лицензии:1 - Лицензия ФСВТС, 2 - Лицензия ФСТЭК</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:choose>
                    <xsl:when test="vtstek:KindLicense='1'">
                      <xsl:text>Лицензия ФСВТС</xsl:text>
                    </xsl:when>
                    <xsl:when test="vtstek:KindLicense='2'">
                      <xsl:text>Лицензия ФСТЭК</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="vtstek:KindLicense" />
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Страна отправления/назначения (продавца/покупателя)</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="vtstek:CountryDeparture" />
              </td>
            </tr>
          </table>
          <xsl:if test="vtstek:ImpExp">
            <div class="title marg-top">Продавец / Покупатель</div>
            <div>
              <xsl:apply-templates select="vtstek:ImpExp">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:CountryOrigin">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Страна происхождения</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="vtstek:CountryOrigin" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="vtstek:CountryEndUse">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Страна конечного использования</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="vtstek:CountryEndUse" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="vtstek:EndUser">
            <div class="title marg-top">Конечный пользователь товара</div>
            <div>
              <xsl:apply-templates select="vtstek:EndUser">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Основание для выдачи лицензии</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="vtstek:LisenceIssue" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дополнительная информация</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="vtstek:AdditionalInfo" />
              </td>
            </tr>
          </table>
          <xsl:if test="vtstek:ContractCurrency">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Валюта контракта</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="vtstek:ContractCurrency" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="vtstek:License">
            <div class="title marg-top">Сведения о лицензии</div>
            <div>
              <xsl:apply-templates select="vtstek:License">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:LicenseOwner">
            <div class="title marg-top">Сведения о владельце лицензии</div>
            <div>
              <xsl:apply-templates select="vtstek:LicenseOwner">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:ContractDetails">
            <div class="title marg-top">Реквизиты контракта</div>
            <div>
              <xsl:apply-templates select="vtstek:ContractDetails">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:GoodsDescription">
            <div class="title marg-top">Сведения о товарах</div>
            <div>
              <xsl:apply-templates select="vtstek:GoodsDescription">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:Expertise">
            <div class="title marg-top">Сведения о государственной экспертизе</div>
            <div>
              <xsl:apply-templates select="vtstek:Expertise">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:AuthorizedPerson">
            <div class="title marg-top">Уполномоченное лицо, подписавшее лицензию</div>
            <div>
              <xsl:apply-templates select="vtstek:AuthorizedPerson">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:NoticeOfCancellation">
            <div class="title marg-top">Уведомление об аннулировании</div>
            <div>
              <xsl:apply-templates select="vtstek:NoticeOfCancellation">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:NoticeOfSuspension">
            <div class="title marg-top">Уведомление о приостановлении</div>
            <div>
              <xsl:apply-templates select="vtstek:NoticeOfSuspension">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:NoticeOfResume">
            <div class="title marg-top">Уведомление о возобновлении</div>
            <div>
              <xsl:apply-templates select="vtstek:NoticeOfResume">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="vtstek:ConslusionsDocument">
            <div class="title marg-top">Электронные документы, прикрепленные к Лицензии</div>
            <table class="bordered">
              <tbody>
                <tr class="title">
                  <td class="graphMain bordered">Наименование документа</td>
                  <td class="graphMain bordered">Дата добавления документа</td>
                  <td class="graphMain bordered">Оригинальное наименование файла в БД</td>
                  <td class="graphMain bordered">Наименование файла в выгрузке</td>
                  <td class="graphMain bordered">Данные файла  в кодировке BASE64</td>
                </tr>
                <xsl:for-each select="vtstek:ConslusionsDocument">
                  <xsl:apply-templates select=".">
                    <xsl:with-param name="wdth" select="$w" />
                  </xsl:apply-templates>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:KGOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:KGINN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="cat_ru:KGINN='ИНН'">
                  <xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
                </xsl:when>
                <xsl:when test="cat_ru:KGINN='ПИН'">
                  <xsl:text>персональный идентификационный номер</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="cat_ru:KGINN" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KGOKPO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:KGOKPO" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:RAOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:UNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SocialServiceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SocialServiceCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:RBOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:UNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:RBIdentificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:RFOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:RKOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:BIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:BIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:IIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITN">
        <div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
        <div>
          <xsl:apply-templates select="cat_ru:ITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ITNKZType -->
  <xsl:template match="cat_ru:ITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:CategoryCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:KATOCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:RNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:RNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITNReserv">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:ITNReserv" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:AuthorizedPersonType -->
  <xsl:template match="vtstek:AuthorizedPerson">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ФИО</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="vtstek:FIO" />
          </td>
        </tr>
      </table>
      <xsl:if test="vtstek:PersonPost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Должность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="vtstek:PersonPost" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа Российской Федерации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="vtstek:CustomsCode" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:ConslusionsDocumentType -->
  <xsl:template match="vtstek:ConslusionsDocument">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="vtstek:DocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="vtstek:DocumentDate" />
          </xsl:call-template>
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="vtstek:DocumentNameBD" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="vtstek:FileName" />
        </td>
        <td class="graphMain bordered">
          <!--<xsl:value-of select="vtstek:FileData" />-->
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="vtstek:Contact">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Fax">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер факса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Telex" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:E_mail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:E_mail">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:DocumentType -->
  <xsl:template match="vtstek:ContractDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="vtstek:Number" />
          </td>
        </tr>
      </table>
      <xsl:if test="vtstek:Date">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="vtstek:Date" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:ExpirationDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Срок действия</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="vtstek:ExpirationDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUOrganizationNameAddrType -->
  <xsl:template match="vtstek:EndUser">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="RUScat_ru:OrganizationName">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:Address">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Юридический адрес</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:Address" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:DocumentWithoutEndDateType -->
  <xsl:template match="vtstek:Expertise">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="vtstek:Number" />
          </td>
        </tr>
      </table>
      <xsl:if test="vtstek:Date">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="vtstek:Date" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:GoodsDescriptionType -->
  <xsl:template match="vtstek:GoodsDescription">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Описание товара</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="vtstek:GoodsDescription">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
      <xsl:if test="vtstek:ProductDetail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Характеристика продукции</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="vtstek:ProductDetail" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:GoodsTNVEDCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код товара по ТН ВЭД ЕАЭС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="vtstek:GoodsTNVEDCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:CustomsCost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Стоимость товара</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="translate(vtstek:CustomsCost, '.', ',')" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:StatisticalCost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Статистическая стоимость товара</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="translate(vtstek:StatisticalCost, '.', ',')" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:Quantity">
        <div class="title marg-top">Количество товара</div>
        <div>
          <xsl:apply-templates select="vtstek:Quantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="vtstek:SupplementaryQuantity">
        <div class="title marg-top">Количество товара в дополнительной единице измерения</div>
        <div>
          <xsl:apply-templates select="vtstek:SupplementaryQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
  <xsl:template match="vtstek:IdentityCard">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:IdentityCardCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность, в соответствии с классификатором видов документов, удостоверяющих личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IdentityCardCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:FullIdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полное наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:FullIdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IdentityCardSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IdentityCardNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:DocValidityDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="RUScat_ru:DocValidityDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IssuerCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IssuerCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AuthorityId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:AuthorityId" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUOrganizationNameAddrType -->
  <xsl:template match="vtstek:ImpExp">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="RUScat_ru:OrganizationName">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:Address">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Юридический адрес</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:Address" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:LicenseType -->
  <xsl:template match="vtstek:License">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:BeginDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Начальная дата периода действия лицензии</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="vtstek:BeginDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Конечная дата периода действия лицензии</td>
          <td class="value graphMain" style="width:50%">
            <xsl:call-template name="russian_date">
              <xsl:with-param name="dateIn" select="vtstek:EndDate" />
            </xsl:call-template>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Информация о текущем статусе лицензии: 1 - действует, 2 - аннулирована, 3 - действие приостановлено, 4 - действие возобновлено, 5 - действие завершено)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="vtstek:Status='1'">
                <xsl:text>действует</xsl:text>
              </xsl:when>
              <xsl:when test="vtstek:Status='2'">
                <xsl:text>аннулирована</xsl:text>
              </xsl:when>
              <xsl:when test="vtstek:Status='3'">
                <xsl:text>действие приостановлено</xsl:text>
              </xsl:when>
              <xsl:when test="vtstek:Status='4'">
                <xsl:text>действие возобновлено</xsl:text>
              </xsl:when>
              <xsl:when test="vtstek:Status='5'">
                <xsl:text>действие завершено</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="vtstek:Status" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
      <xsl:if test="vtstek:LastDateChange">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Информация о дате и времени последнего изменения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="vtstek:LastDateChange" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код типа лицензии: 0 - разовая экспорт; 1 - разовая импорт; 2 - генеральная</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="vtstek:LicenseTypeKod='0'">
                <xsl:text>разовая экспорт</xsl:text>
              </xsl:when>
              <xsl:when test="vtstek:LicenseTypeKod='1'">
                <xsl:text>разовая импорт</xsl:text>
              </xsl:when>
              <xsl:when test="vtstek:LicenseTypeKod='2'">
                <xsl:text>генеральная</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="vtstek:LicenseTypeKod" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:LicenseOwnerType -->
  <xsl:template match="vtstek:LicenseOwner">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="RUScat_ru:OrganizationName">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:Address">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Юридический адрес</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:Address" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:IdentityCard">
        <div class="title marg-top">Документ, удостоверяющий личность</div>
        <div>
          <xsl:apply-templates select="vtstek:IdentityCard">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="vtstek:Contact">
        <div class="title marg-top">Контактная информация</div>
        <div>
          <xsl:apply-templates select="vtstek:Contact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="vtstek:Status">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Статус: 0 - физическое лицо, 1 - юридическое лицо</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="vtstek:Status='0'">
                  <xsl:text>физическое лицо</xsl:text>
                </xsl:when>
                <xsl:when test="vtstek:Status='1'">
                  <xsl:text>юридическое лицо</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="vtstek:Status" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:OKPOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код организации по ОКПО.</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="vtstek:OKPOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:DocumentWithoutEndDateType -->
  <xsl:template match="vtstek:NoticeOfCancellation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="vtstek:Number" />
          </td>
        </tr>
      </table>
      <xsl:if test="vtstek:Date">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="vtstek:Date" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:DocumentWithoutEndDateType -->
  <xsl:template match="vtstek:NoticeOfResume">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="vtstek:Number" />
          </td>
        </tr>
      </table>
      <xsl:if test="vtstek:Date">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="vtstek:Date" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа vtstek:DocumentType -->
  <xsl:template match="vtstek:NoticeOfSuspension">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="vtstek:Number" />
          </td>
        </tr>
      </table>
      <xsl:if test="vtstek:Date">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="vtstek:Date" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="vtstek:ExpirationDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Срок действия</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="vtstek:ExpirationDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:SupplementaryQuantity24point8Type -->
  <xsl:template match="vtstek:Quantity">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="translate(RUScat_ru:GoodsQuantity, '.', ',')" />
          </td>
        </tr>
      </table>
      <xsl:if test="RUScat_ru:MeasureUnitQualifierName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:MeasureUnitQualifierName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:MeasureUnitQualifierCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:MeasureUnitQualifierCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:SupplementaryQuantity24point8Type -->
  <xsl:template match="vtstek:SupplementaryQuantity">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="translate(RUScat_ru:GoodsQuantity, '.', ',')" />
          </td>
        </tr>
      </table>
      <xsl:if test="RUScat_ru:MeasureUnitQualifierName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:MeasureUnitQualifierName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:MeasureUnitQualifierCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:MeasureUnitQualifierCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>