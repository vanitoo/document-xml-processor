<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.20.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.20.0" xmlns:pccg_stz="urn:customs.ru:Information:CustomsDocuments:PermitCloseConsumedGoodsSTZ:5.20.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.20.0">
  <!-- Шаблон для типа PermitCloseConsumedGoodsSTZType -->
  <xsl:template match="pccg_stz:PermitCloseConsumedGoodsSTZ">
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
                    <b>Решение о завершении таможенной процедуры свободной таможенной зоны в отношении товаров, которые были потреблены при совершении операций по переработке</b>
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
                <xsl:apply-templates select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="pccg_stz:Customs">
            <div class="title marg-top">Сведения о таможенном органе</div>
            <div>
              <xsl:apply-templates select="pccg_stz:Customs">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="pccg_stz:Resident">
            <div class="title marg-top">Сведения о резиденте СТЗ</div>
            <div>
              <xsl:apply-templates select="pccg_stz:Resident">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="pccg_stz:PermissionRegNumber">
            <div class="title marg-top">Регистрационный номер Разрешения</div>
            <div>
              <xsl:apply-templates select="pccg_stz:PermissionRegNumber">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="pccg_stz:AppInfo">
            <div class="title marg-top">Сведения о Заявлении</div>
            <div>
              <xsl:apply-templates select="pccg_stz:AppInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="pccg_stz:SheetsNumber">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Количество листов</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="pccg_stz:SheetsNumber" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="pccg_stz:CustomsSignature">
            <div class="title marg-top">Подпись начальника таможенного органа</div>
            <div>
              <xsl:apply-templates select="pccg_stz:CustomsSignature">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
  <xsl:template match="RUScat_ru:BusinessEntityTypeCode">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код объекта в соответсвии со справочником (классификатором) </td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="RUScat_ru:UnifiedCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="RUScat_ru:CodeListId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение справочника (классификатора), в соответствии с которым указан код</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CodeListId" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="RUScat_ru:CommunicationDetails">
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
              <xsl:apply-templates select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Telex" />
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
  <!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
  <xsl:template match="RUScat_ru:IdentityCard">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:IdentityCardCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность, в соответствии с классификатором видов документов, удостоверяющих личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:FullIdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полное наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:FullIdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:DocValidityDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IssuerCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IssuerCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AuthorityId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AuthorityId" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUAddressType -->
  <xsl:template match="RUScat_ru:SubjectAddressDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:choose>
            <xsl:when test="RUScat_ru:AddressKindCode='1'">
              <xsl:text>адрес регистрации</xsl:text>
            </xsl:when>
            <xsl:when test="RUScat_ru:AddressKindCode='2'">
              <xsl:text>фактический адрес</xsl:text>
            </xsl:when>
            <xsl:when test="RUScat_ru:AddressKindCode='3'">
              <xsl:text>почтовый адрес</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="RUScat_ru:AddressKindCode" />
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:PostalCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:CountryCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:CounryName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:Region" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:District" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:Town" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:City" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:StreetHouse" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:House" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:Room" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:AddressText" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:OKTMO" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:OKATO" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:KLADR" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:AOGUID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:AOID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:TerritoryCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:PostOfficeBoxId" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:UITN40Type -->
  <xsl:template match="RUScat_ru:UITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код. Универсальный идентификационный таможенный номер. Строка не более 40 символов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="RUScat_ru:UITNCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны, по правилам которой сформирован указанный идентификатор</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:SupplementaryQuantityType -->
  <xsl:template match="catProc_ru:GoodsQuantity">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catESAD_cu:GoodsQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode" />
        </td>
      </tr>
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
            <xsl:apply-templates select="cat_ru:CategoryCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:KATOCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:RNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:RNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITNReserv">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:ITNReserv" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="cat_ru:KGOrganizationFeatures">
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
              <xsl:apply-templates select="cat_ru:KGOKPO" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RAOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:UNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SocialServiceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SocialServiceCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RBOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:UNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:RBIdentificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RFOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RKOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:BIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:BIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:IIN" />
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
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:AcceptanceWork">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catProc_ru:AccountDocType -->
  <xsl:template match="pccg_stz:AccountDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catProc_ru:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catProc_ru:GoodsNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catProc_ru:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:AppCloseSTZType -->
  <xsl:template match="pccg_stz:AppCloseSTZ">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="pccg_stz:Customs">
        <div class="title marg-top">Сведения о таможенном органе</div>
        <div>
          <xsl:apply-templates select="pccg_stz:Customs">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="pccg_stz:Resident">
        <div class="title marg-top">Сведения о резиденте СТЗ</div>
        <div>
          <xsl:apply-templates select="pccg_stz:Resident">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="pccg_stz:SheetsNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Количество листов</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="pccg_stz:SheetsNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Начало периода предоставления отчетности</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:StartReportDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Окончание периода предоставления отчетности</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:EndReportDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <xsl:if test="pccg_stz:GoodsInfo">
        <div class="title marg-top">Сведения о потребленных товарах</div>
        <div>
          <xsl:apply-templates select="pccg_stz:GoodsInfo">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="pccg_stz:PresentedDoc">
        <div class="title marg-top">Представленные документаы</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Наименование документа</td>
              <td class="graphMain bordered">Номер документа</td>
              <td class="graphMain bordered">Дата документа</td>
              <td class="graphMain bordered">Код вида представленного документа в соответствии с классификатором документов и сведений (РК ТС №378)</td>
              <td class="graphMain bordered">Идентификатор документа, присвоенный информационной системой таможенных органов при представлении документа в электронном виде</td>
              <td class="graphMain bordered">Идентификатор хранилища электронных документов при представлении документа в электронном виде</td>
              <td class="graphMain bordered">Код вида представленного документа в соответствии с альбомом форматов электронных форм документов</td>
              <td class="graphMain bordered">Порядковый номер позиции</td>
              <td class="graphMain bordered">Количество листов </td>
            </tr>
            <xsl:for-each select="pccg_stz:PresentedDoc">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="pccg_stz:PreviousDoc">
        <div class="title marg-top">Предшествующие документы</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Порядковый номер записи</td>
              <td class="graphMain bordered">Регистрационный номер ДТ</td>
              <td class="graphMain bordered">Порядковый номер товара в ДТ</td>
              <td class="graphMain bordered">Количество товара</td>
              <td class="graphMain bordered">Технические идентификаторы</td>
            </tr>
            <xsl:for-each select="pccg_stz:PreviousDoc">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="pccg_stz:ResidentSignature">
        <div class="title marg-top">Подпись представителя резидента</div>
        <div>
          <xsl:apply-templates select="pccg_stz:ResidentSignature">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:AppInfoType -->
  <xsl:template match="pccg_stz:AppInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="pccg_stz:AppRegNum">
        <div class="title marg-top">Регистрационный номер Заявления</div>
        <div>
          <xsl:apply-templates select="pccg_stz:AppRegNum">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="pccg_stz:AppCloseSTZ">
        <div class="title marg-top">Сведения, указанные в Заявлении</div>
        <div>
          <xsl:apply-templates select="pccg_stz:AppCloseSTZ">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:AppRegNumType -->
  <xsl:template match="pccg_stz:AppRegNum">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего Заявление</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации Заявления</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:RegistrationDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Порядковый номер Заявления</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:Number" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">4-ая часть номера "ЗВП"</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:AddNumber" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:CommissioningDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="pccg_stz:Customs">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:Code" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:OfficeName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OfficeName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:CustomsDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:PersonSignatureType -->
  <xsl:template match="pccg_stz:CustomsSignature">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonSurname" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:PersonMiddleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonMiddleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PersonPost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Должность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonPost" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IssueDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата подписания</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
  <xsl:template match="pccg_stz:DeclRegNum">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:GTDNumber" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:EndResearchDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:EquipmentExplGoodsType -->
  <xsl:template match="pccg_stz:EquipmentExplGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:EquipmentName">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:EquipmentType">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:GoodsDeclType -->
  <xsl:template match="pccg_stz:EquipmentGoodsDecl">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:DeclRegNum">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CustomsDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsDeclnfo">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:EquipmentGoodsSTZType -->
  <xsl:template match="pccg_stz:EquipmentGoodsSTZ">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:EquipmentGoodsDecl">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsWeightQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:OperationsDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:ExploitationProcessingGoodsType -->
  <xsl:template match="pccg_stz:EquipmentProcessingGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ProcessingOperations">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:ExpluatationDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:UsedGoods">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:EquipmentType -->
  <xsl:template match="pccg_stz:EquipmentType">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:DeclRegNum">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CustomsDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:PropertyBalanceSheet">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CommissioningDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:Comment">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:EquipmentGoodsSTZ">
            <xsl:apply-templates select="pccg_stz:EquipmentGoodsSTZ">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:EquipmentProcessingGoods">
            <xsl:apply-templates select="pccg_stz:EquipmentProcessingGoods">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:GoodsDeclType -->
  <xsl:template match="pccg_stz:ExploitationGoodsDecl">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:DeclRegNum">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CustomsDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsDeclnfo">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:ExploitationGoodsSTZType -->
  <xsl:template match="pccg_stz:ExploitationGoodsSTZ">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:ExploitationGoodsDecl">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsWeightQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:RegulatingDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:ExploitationProcessingGoodsType -->
  <xsl:template match="pccg_stz:ExploitationProcessingGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ProcessingOperations">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:ExpluatationDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:UsedGoods">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:ExpluatationDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
  <xsl:template match="pccg_stz:GTDID">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:GTDNumber" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:PropertyCreateGoodsDeclType -->
  <xsl:template match="pccg_stz:GoodsDecl">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:DeclRegNum">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CustomsDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsWeightQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон с дублирующимся match закомментирован -->
  <!--
<xsl:template match="pccg_stz:GoodsDecl">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><tr><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:DeclRegNum" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></td><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:CustomsDoc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></td><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:GoodsDeclnfo" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></td></tr></div></xsl:template>
-->
  <!-- Шаблон для типа pccg_stz:GoodsDeclnfoType -->
  <xsl:template match="pccg_stz:GoodsDeclnfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:GoodsCousumedType -->
  <xsl:template match="pccg_stz:GoodsInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="pccg_stz:PropertyCreateGoods">
        <div class="title marg-top">Товары, потребленные при создании объекта недвижимости</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Порядковый номер позиции</td>
              <td class="graphMain bordered">Наименование объекта недвижимости</td>
              <td class="graphMain bordered">Местонахождение объекта недвижимости</td>
              <td class="graphMain bordered">Техническая документация (технический паспорт), проектная документация</td>
              <td class="graphMain bordered">Сведения о постановке объекта недвижимости на баланс </td>
              <td class="graphMain bordered">Дата ввода в эксплуатацию</td>
              <td class="graphMain bordered">Сведения о внесении записи о праве собственности</td>
              <td class="graphMain bordered">Примечание</td>
              <td class="graphMain bordered">Товары, помещенные под СТЗ и потребленные при создании объекта недвижимости</td>
              <td class="graphMain bordered">Товары, изготовленные (полученные) из товаров, помещенных под СТЗ и потребленные при создании объекта недвижимости</td>
            </tr>
            <xsl:for-each select="pccg_stz:PropertyCreateGoods">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="pccg_stz:PropertyExplGoods">
        <div class="title marg-top">Товары, потребленные при эксплуатации (содержании) объекта недвижимости</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Порядковый номер позиции</td>
              <td class="graphMain bordered">Наименование объекта недвижимости</td>
              <td class="graphMain bordered">Местонахождение объекта недвижимости</td>
              <td class="graphMain bordered">Сведения о документах, подтверждающих право собственности</td>
              <td class="graphMain bordered">Примечание</td>
              <td class="graphMain bordered">Товары, помещенные под СТЗ и потребленные при эксплуатации объекта недвижимости</td>
              <td class="graphMain bordered">Товары, изготовленные (полученные) из товаров, помещенных под СТЗ, и потребленные при эксплуатации объекта недвижимости </td>
            </tr>
            <xsl:for-each select="pccg_stz:PropertyExplGoods">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="pccg_stz:PropertyRepairGoods">
        <div class="title marg-top">Товары, потребленные при ремонте (реконструкции, модернизации) объекта недвижимости</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Порядковый номер позиции</td>
              <td class="graphMain bordered">Наименование объекта недвижимости</td>
              <td class="graphMain bordered">Местонахождение объекта недвижимости</td>
              <td class="graphMain bordered">Операции по ремонту (реконструкции, модернизации) объекта недвижимости, при совершении которых были потреблены товары </td>
              <td class="graphMain bordered">Сведения о технической документации</td>
              <td class="graphMain bordered">Сведения о документах, свидетельствующих о приеме-сдаче отремонтированного объекта недвижимости</td>
              <td class="graphMain bordered">Примечание</td>
              <td class="graphMain bordered">Товары, помещенные под СТЗ и потребленные при ремонте объекта недвижимости</td>
              <td class="graphMain bordered">Товары, изготовленные (полученные) из товаров, помещенных под СТЗ, потребленные при ремонте объекта недвижимости</td>
            </tr>
            <xsl:for-each select="pccg_stz:PropertyRepairGoods">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="pccg_stz:EquipmentExplGoods">
        <div class="title marg-top">Товары, потребленные при эксплуатации/техническом обслуживании оборудования, машин и агрегатов</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Порядковый номер позиции</td>
              <td class="graphMain bordered">Наименование оборудования (машины, агрегата) </td>
              <td class="graphMain bordered">Сведения об оборудовании</td>
            </tr>
            <xsl:for-each select="pccg_stz:EquipmentExplGoods">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="pccg_stz:ResearchGoods">
        <div class="title marg-top">Товары, потребленные при проведении исследований, испытаний</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Порядковый номер позиции</td>
              <td class="graphMain bordered">Описание проведенного исследования</td>
              <td class="graphMain bordered">Сведения о документах, регламентирующих проведение исследования</td>
              <td class="graphMain bordered">Сведения о документах, свидетельствующих о завершении исследования</td>
              <td class="graphMain bordered">Примечание</td>
              <td class="graphMain bordered">Товары, помещенные под СТЗ, потребленные при проведении исследований, испытаний</td>
              <td class="graphMain bordered">Товары, изготовленные (полученные) из товаров, помещенных СТЗ, потребленные при проведении исследований, испытаний</td>
            </tr>
            <xsl:for-each select="pccg_stz:ResearchGoods">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:SupplementaryQuantityType -->
  <xsl:template match="pccg_stz:GoodsQuantity">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catESAD_cu:GoodsQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:OperationsDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:OwnershipDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:RegNumType -->
  <xsl:template match="pccg_stz:PermissionRegNumber">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:RegistrationDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Порядковый номер </td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:Number" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">4-ая часть номера "РЗПТ"</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:AddNumber" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:PresentedDocType -->
  <xsl:template match="pccg_stz:PresentedDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catProc_ru:CustomsDocumentCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catProc_ru:ElectronicDocumentID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catProc_ru:ElectronicArchID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="catProc_ru:DocumentModeID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:SheetsNumber" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:PreviousDocType -->
  <xsl:template match="pccg_stz:PreviousDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:NumPP" />
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:GTDID">
            <xsl:apply-templates select="pccg_stz:GTDID">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsNumeric" />
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:SupplementaryQuantity">
            <xsl:apply-templates select="pccg_stz:SupplementaryQuantity">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:PrevTechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:PropertyBalanceSheet">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:PropertyCreateGoodsType -->
  <xsl:template match="pccg_stz:PropertyCreateGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:PropertyName">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:PropertyLocation">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:TechDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:PropertyBalanceSheet">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CommissioningDate" mode="russian_date" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:OwnershipDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:Comment">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:PropertyGoodsSTZ">
            <xsl:apply-templates select="pccg_stz:PropertyGoodsSTZ">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:PropertyProcessingGoods">
            <xsl:apply-templates select="pccg_stz:PropertyProcessingGoods">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:PropertyExplGoodsType -->
  <xsl:template match="pccg_stz:PropertyExplGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:PropertyName">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:PropertyLocation">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:OwnershipDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:Comment">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:ExploitationGoodsSTZ">
            <xsl:apply-templates select="pccg_stz:ExploitationGoodsSTZ">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:ExploitationProcessingGoods">
            <xsl:apply-templates select="pccg_stz:ExploitationProcessingGoods">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:GoodsDeclType -->
  <xsl:template match="pccg_stz:PropertyGoodsDecl">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:DeclRegNum">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CustomsDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsDeclnfo">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:PropertyCreateGoodsSTZType -->
  <xsl:template match="pccg_stz:PropertyGoodsSTZ">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:PropertyGoodsDecl">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsWeightQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ComponentUseName">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUAddressType -->
  <xsl:template match="pccg_stz:PropertyLocation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:AddressKindCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение вида адреса: "1" - адрес регистрации; "2" - фактический адрес; "3" - почтовый адрес</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="RUScat_ru:AddressKindCode='1'">
                  <xsl:text>адрес регистрации</xsl:text>
                </xsl:when>
                <xsl:when test="RUScat_ru:AddressKindCode='2'">
                  <xsl:text>фактический адрес</xsl:text>
                </xsl:when>
                <xsl:when test="RUScat_ru:AddressKindCode='3'">
                  <xsl:text>почтовый адрес</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="RUScat_ru:AddressKindCode" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:District">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:District" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Town">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Город</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Town" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:House">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:House" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Room">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Room" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AddressText">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AddressText" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKTMO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OKTMO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKATO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OKATO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:KLADR">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код КЛАДР</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:KLADR" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOGUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AOGUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostOfficeBoxId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PostOfficeBoxId" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:PropertyProcessingGoodsType -->
  <xsl:template match="pccg_stz:PropertyProcessingGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ProcessingOperations">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ComponentName">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:UsedGoods">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:PropertyRepairGoodsType -->
  <xsl:template match="pccg_stz:PropertyRepairGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:PropertyName">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:PropertyLocation">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ProcessingOperations">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:TechDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AcceptanceWork">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:Comment">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:RepairGoodsSTZ">
            <xsl:apply-templates select="pccg_stz:RepairGoodsSTZ">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:RepairProceccingGoods">
            <xsl:apply-templates select="pccg_stz:RepairProceccingGoods">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:ReglamentDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:RegulatingDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:GoodsDeclType -->
  <xsl:template match="pccg_stz:RepairGoodsDecl">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:DeclRegNum">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CustomsDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsDeclnfo">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:RepairGoodsSTZType -->
  <xsl:template match="pccg_stz:RepairGoodsSTZ">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:RepairGoodsDecl">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsWeightQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:RepairProceccingGoodsType -->
  <xsl:template match="pccg_stz:RepairProceccingGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ProcessingOperations">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:UsedGoods">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:ResearchGoodsType -->
  <xsl:template match="pccg_stz:ResearchGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ResearchInfo">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:ReglamentDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:EndResearchDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:Comment">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:ResearchGoods">
            <xsl:apply-templates select="pccg_stz:ResearchGoods">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="pccg_stz:ResearchProcessingGoods">
            <xsl:apply-templates select="pccg_stz:ResearchProcessingGoods">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон с дублирующимся match закомментирован -->
  <!--
<xsl:template match="pccg_stz:ResearchGoods">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><tr><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:Position" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:for-each select="pccg_stz:GoodsDescription" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:if test="position()!=1"><br /></xsl:if><xsl:apply-templates select="." /></xsl:for-each></td><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:ResearchGoodsDecl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></td><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:GoodsWeightQuantity" mode="translate_number" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:GoodsQuantity" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></td><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:AccountDoc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></td><td class="graphMain bordered"><xsl:for-each select="pccg_stz:TechID" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:if test="position()!=1"><br /></xsl:if><xsl:apply-templates select="." /></xsl:for-each></td></tr></div></xsl:template>
-->
  <!-- Шаблон для типа pccg_stz:GoodsDeclType -->
  <xsl:template match="pccg_stz:ResearchGoodsDecl">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:DeclRegNum">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:CustomsDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsDeclnfo">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:RepairProceccingGoodsType -->
  <xsl:template match="pccg_stz:ResearchProcessingGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:ProcessingOperations">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:AccountDoc">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:UsedGoods">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:ResidentType -->
  <xsl:template match="pccg_stz:Resident">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryA2Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryA2Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:BusinessEntityTypeCode">
        <div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:BusinessEntityTypeName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:UITN">
        <div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:UITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:PersonId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PersonId" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
        <div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:IdentityCard">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:SubjectAddressDetails">
        <div class="title marg-top">Адрес</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Кодовое обозначение вида адреса: "1" - адрес регистрации; "2" - фактический адрес; "3" - почтовый адрес</td>
              <td class="graphMain bordered">Почтовый индекс</td>
              <td class="graphMain bordered">Буквенный код страны в соответствии с классификатором стран мира</td>
              <td class="graphMain bordered">Краткое название страны в соответствии с классификатором стран мира</td>
              <td class="graphMain bordered">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
              <td class="graphMain bordered">Район (Наименование единицы административно-территориального деления второго уровня)</td>
              <td class="graphMain bordered">Город</td>
              <td class="graphMain bordered">Населенный пункт</td>
              <td class="graphMain bordered">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
              <td class="graphMain bordered">Обозначение дома, корпуса, строения</td>
              <td class="graphMain bordered">Обозначение офиса или квартиры</td>
              <td class="graphMain bordered">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
              <td class="graphMain bordered">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
              <td class="graphMain bordered">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
              <td class="graphMain bordered">Код КЛАДР</td>
              <td class="graphMain bordered">Глобальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Уникальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Код единицы административно-территориального деления</td>
              <td class="graphMain bordered">Номер абонентского ящика на предприятии почтовой связи</td>
            </tr>
            <xsl:for-each select="RUScat_ru:SubjectAddressDetails">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CommunicationDetails">
        <div class="title marg-top">Контактный реквизит субъекта</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:CommunicationDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="pccg_stz:ResidentCertificate">
        <div class="title marg-top">Cвидетельство о включении в реестр резидентов</div>
        <div>
          <xsl:apply-templates select="pccg_stz:ResidentCertificate">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:ResidentCertificateType -->
  <xsl:template match="pccg_stz:ResidentCertificate">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер свидетельства</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:CertificateNumber" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата выдачи свидетельства</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="pccg_stz:CertificateDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <xsl:if test="pccg_stz:CertificateValidity">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Срок действия</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="pccg_stz:CertificateValidity" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="pccg_stz:CertificateAgency">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование органа, выдавшего свидетельство</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="pccg_stz:CertificateAgency" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:PersonSignatureType -->
  <xsl:template match="pccg_stz:ResidentSignature">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonSurname" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:PersonMiddleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonMiddleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PersonPost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Должность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonPost" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IssueDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата подписания</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
  <xsl:template match="pccg_stz:SupplementaryQuantity">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:MeasureUnitQualifierName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="pccg_stz:TechDoc">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа pccg_stz:UsedGoodsDeclType -->
  <xsl:template match="pccg_stz:UsedGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:Position" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:GoodsDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsDecl">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsWeightQuantity" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="pccg_stz:GoodsQuantity">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="pccg_stz:TechID">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон с дублирующимся match закомментирован -->
  <!--
<xsl:template match="pccg_stz:UsedGoods">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><tr><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:Position" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:for-each select="pccg_stz:GoodsDescription" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:if test="position()!=1"><br /></xsl:if><xsl:apply-templates select="." /></xsl:for-each></td><td class="graphMain bordered"><xsl:apply-templates select="pccg_stz:GoodsDecl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></td><td class="graphMain bordered"><xsl:for-each select="pccg_stz:TechID" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:if test="position()!=1"><br /></xsl:if><xsl:apply-templates select="." /></xsl:for-each></td></tr></div></xsl:template>
-->
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
  <xsl:template match="//*[local-name()='PermitCloseConsumedGoodsSTZ']//*" priority="-1">
    <xsl:variable name="xpath">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="current()" />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath}">
      <xsl:apply-templates />
    </element>
  </xsl:template>
  <xsl:template name="get_xpath">
    <xsl:param name="node" select="." />
    <xsl:variable name="xpath">
      <xsl:for-each select="$node/ancestor-or-self::*">
        <xsl:variable name="name">
          <xsl:value-of select="name()" />
        </xsl:variable>
        <xsl:variable name="pos">
          <xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="position()=last()">
            <xsl:value-of select="concat($name,'[',$pos,']')" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($name,'[',$pos,']','/')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="$xpath" />
  </xsl:template>
  <xsl:template match="*" mode="date">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:call-template name="russian_date">
        <xsl:with-param name="dateIn" select="." />
      </xsl:call-template>
    </element>
  </xsl:template>
  <xsl:template match="*" mode="russian_date">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:call-template name="russian_date">
        <xsl:with-param name="dateIn" select="." />
      </xsl:call-template>
    </element>
  </xsl:template>
  <xsl:template match="*" mode="translate_number">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:value-of select="translate(.,'.', ',')" />
    </element>
  </xsl:template>
</xsl:stylesheet>