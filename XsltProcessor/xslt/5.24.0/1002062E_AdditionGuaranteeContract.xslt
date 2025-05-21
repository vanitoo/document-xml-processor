<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:agc="urn:customs.ru:Information:CommercialFinanceDocuments:AdditionGuaranteeContract:5.24.0">
  <!-- Шаблон для типа AdditionGuaranteeContractType -->
  <xsl:template match="agc:AdditionGuaranteeContract">
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
                    <b>Дополнение к договору поручительства (для реестровой деятельности)</b>
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
          <xsl:if test="cat_ru:INNSign">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="cat_ru:INNSign" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="cat_ru:MCD_ID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Единый регистрационный номер доверенности в формате МЧД</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="cat_ru:MCD_ID" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Вид договора</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="agc:GuaranteeContractKind='1'">
                    <xsl:text>договор поручительства, обеспечивающий в отношении нескольких лиц исполнение обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, и (или) исполнение обязанностей уполномоченного экономического оператора, согласно приложению № 3</xsl:text>
                  </xsl:when>
                  <xsl:when test="agc:GuaranteeContractKind='2'">
                    <xsl:text>договор поручительства, обеспечивающий в отношении нескольких лиц исполнение обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, согласно приложению № 4</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="agc:GuaranteeContractKind" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <xsl:if test="agc:StatusDetails">
            <div class="title marg-top">Статус договора</div>
            <div>
              <xsl:apply-templates select="agc:StatusDetails">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="agc:AdditionGuaranteeContractDate">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Дата подписания дополнения к договору поручительства</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="agc:AdditionGuaranteeContractDate" mode="russian_date" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="agc:RelatedContract">
            <div class="title marg-top">Связанный договор</div>
            <div>
              <xsl:apply-templates select="agc:RelatedContract">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="agc:Guarantor">
            <div class="title marg-top">Сведения о поручителе</div>
            <div>
              <xsl:apply-templates select="agc:Guarantor">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="agc:Creditor">
            <div class="title marg-top">Сведения о кредиторе</div>
            <div>
              <xsl:apply-templates select="agc:Creditor">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="agc:Debtor">
            <div class="title marg-top">Сведения о должнике</div>
            <div>
              <xsl:apply-templates select="agc:Debtor">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Сумма обязанности</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="agc:ObligationAmount" mode="translate_number" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Сумма обязанности прописью</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="agc:ObligationAmountText" />
              </td>
            </tr>
          </table>
          <xsl:if test="agc:DateBegin">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Дата вступления в силу Дополнения к договору поручительства</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="agc:DateBegin" mode="russian_date" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата окончания действия Дополнения к договору поручительства</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="agc:DateEnd" mode="russian_date" />
              </td>
            </tr>
          </table>
          <xsl:if test="agc:Contents">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Содержание Дополнения к договора поручительства</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="agc:Contents" />
                </td>
              </tr>
            </table>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:BankInformationType -->
  <xsl:template match="RUScat_ru:BankInformation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:for-each select="cat_ru:BankAccount">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="cat_ru:BankAccountDescription">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:BankName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:BankMFO" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:OKPOID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:BICID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:SWIFTID" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:CorrAccount" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="cat_ru:TransitCurrencyAccount">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
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
  <xsl:template match="agc:AddressDetailsActivitiesKind | RUScat_ru:SubjectAddressDetails">
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
        <!--td class="graphMain bordered">
          <xsl:apply-templates select="RUScat_ru:CountryCode" />
        </td-->
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
        <!--td class="graphMain bordered">
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
        </td-->
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
  <!-- Шаблон для типа cat_ru:PersonBaseType -->
  <xsl:template match="agc:AuthorizedPerson">
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
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="agc:ConfirmingDocument">
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
  <!-- Шаблон для типа agc:CreditorType -->
  <xsl:template match="agc:Creditor">
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
      <xsl:if test="cat_ru:OKPOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код организации по ОКПО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OKPOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OKATOCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКАТО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OKATOCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Address">
        <div class="title marg-top">Адрес </div>
        <div>
          <xsl:apply-templates select="cat_ru:Address">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:Contact">
        <div class="title marg-top">Контактная информация</div>
        <div>
          <xsl:apply-templates select="cat_ru:Contact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="agc:CustomsDetails">
        <div class="title marg-top">Таможенный орган</div>
        <div>
          <xsl:apply-templates select="agc:CustomsDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="agc:AuthorizedPerson">
        <div class="title marg-top">ФИО лица, уполномоченного на подписание Дополнения к договору поручительства</div>
        <div>
          <xsl:apply-templates select="agc:AuthorizedPerson">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="agc:ConfirmingDocument">
        <div class="title marg-top">Документ, подтверждающий полномочия лица</div>
        <div>
          <xsl:apply-templates select="agc:ConfirmingDocument">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="agc:CustomsDetails">
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
  <!-- Шаблон для типа agc:DebtorType -->
  <xsl:template match="agc:Debtor">
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
              <td class="graphMain bordered">Вид адреса</td>
              <td class="graphMain bordered">Почтовый индекс</td>
              <!--td class="graphMain bordered">Буквенный код страны в соответствии с классификатором стран мира</td-->
              <td class="graphMain bordered">Краткое название страны в соответствии с классификатором стран мира</td>
              <td class="graphMain bordered">Регион</td>
              <td class="graphMain bordered">Район</td>
              <td class="graphMain bordered">Город</td>
              <td class="graphMain bordered">Населенный пункт</td>
              <td class="graphMain bordered">Улица</td>
              <td class="graphMain bordered">Обозначение дома, корпуса, строения</td>
              <td class="graphMain bordered">Обозначение офиса или квартиры</td>
              <td class="graphMain bordered">Набор элементов адреса, представленных в свободной форме в виде текста</td>
              <!--td class="graphMain bordered">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
              <td class="graphMain bordered">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
              <td class="graphMain bordered">Код КЛАДР</td>
              <td class="graphMain bordered">Глобальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Уникальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Код единицы административно-территориального деления</td>
              <td class="graphMain bordered">Номер абонентского ящика на предприятии почтовой связи</td-->
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
      <xsl:if test="RUScat_ru:BankInformation">
        <div class="title marg-top">Информация о банковских счетах</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Номер банковского счета</td>
              <td class="graphMain bordered">Описание типа счета: расчетный, валютный</td>
              <td class="graphMain bordered">Название банка</td>
              <td class="graphMain bordered">МФО банка</td>
              <td class="graphMain bordered">Код банка по ОКПО</td>
              <td class="graphMain bordered">БИК банка</td>
              <td class="graphMain bordered">SWIFT код банка</td>
              <td class="graphMain bordered">Номер корреспондентского счета банка</td>
              <td class="graphMain bordered">Валютный счет организации (транзитный)</td>
              <td class="graphMain bordered">Валютный счет организации (специальный транзитный)</td>
            </tr>
            <xsl:for-each select="RUScat_ru:BankInformation">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="agc:AddressDetailsActivitiesKind">
        <div class="title marg-top">Адрес в зависимости от вида осуществляемой (планируемой к осуществлению) деятельности</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Вид адреса</td>
              <td class="graphMain bordered">Почтовый индекс</td>
              <!--td class="graphMain bordered">Буквенный код страны в соответствии с классификатором стран мира</td-->
              <td class="graphMain bordered">Краткое название страны в соответствии с классификатором стран мира</td>
              <td class="graphMain bordered">Регион</td>
              <td class="graphMain bordered">Район</td>
              <td class="graphMain bordered">Город</td>
              <td class="graphMain bordered">Населенный пункт</td>
              <td class="graphMain bordered">Улица</td>
              <td class="graphMain bordered">Обозначение дома, корпуса, строения</td>
              <td class="graphMain bordered">Обозначение офиса или квартиры</td>
              <td class="graphMain bordered">Набор элементов адреса, представленных в свободной форме в виде текста</td>
              <!--td class="graphMain bordered">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
              <td class="graphMain bordered">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
              <td class="graphMain bordered">Код КЛАДР</td>
              <td class="graphMain bordered">Глобальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Уникальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Код единицы административно-территориального деления</td>
              <td class="graphMain bordered">Номер абонентского ящика на предприятии почтовой связи</td-->
            </tr>
            <xsl:for-each select="agc:AddressDetailsActivitiesKind">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="agc:DocKind">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Вид документа, по которому может возникнуть обязанность по уплате: 1 - транзитная декларация, 2 - декларация на товары</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="agc:DocKind='1'">
                  <xsl:text>транзитная декларация</xsl:text>
                </xsl:when>
                <xsl:when test="agc:DocKind='2'">
                  <xsl:text>декларация на товары</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="agc:DocKind" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="agc:RegNumberDT">
        <div class="title marg-top">Регистрационный номер таможенной декларации</div>
        <div>
          <xsl:apply-templates select="agc:RegNumberDT">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="agc:ActivitiesKind">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Вид осуществляемой (планируемой к осуществлению) деятельности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="agc:ActivitiesKind='1'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного представителя</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='2'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного перевозчика</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='3'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного представителя и таможенного перевозчика</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='4'">
                  <xsl:text>обязанности уполномоченного экономического оператора</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='5'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного представителя, и обязанности уполномоченного экономического оператора</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='6'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного перевозчика,и обязанности уполномоченного экономического оператора</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='7'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного представителя, таможенного перевозчика,и обязанности уполномоченного экономического оператора</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='8'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве владельца свободного склада</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='9'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве владельца склада временного хранения</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='10'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве владельца таможенного склада</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKind='11'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве владельца</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="agc:ActivitiesKind" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="agc:ActivitiesKindDetails and agc:GuaranteeContractKind='2'">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уточнение вида осуществляемой (планируемой к осуществлению) деятельности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="agc:ActivitiesKindDetails='1'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного представителя</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='2'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного перевозчика</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='3'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного представителя и таможенного перевозчика</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='4'">
                  <xsl:text>обязанности уполномоченного экономического оператора</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='5'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного представителя, и обязанности уполномоченного экономического оператора</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='6'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного перевозчика, и обязанности уполномоченного экономического оператора</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='7'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного представителя, таможенного перевозчика, и обязанности уполномоченного экономического оператора</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='8'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве владельца свободного склада</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='9'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве владельца склада временного хранения</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='10'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве владельца таможенного склада</xsl:text>
                </xsl:when>
                <xsl:when test="agc:ActivitiesKindDetails='11'">
                  <xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве владельца магазина беспошлинной торговли</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="agc:ActivitiesKindDetails" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="agc:DocumentCode">
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
  <!-- Шаблон для типа agc:GuarantorType -->
  <xsl:template match="agc:Guarantor">
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
              <td class="graphMain bordered">Вид адреса</td>
              <td class="graphMain bordered">Почтовый индекс</td>
              <!--td class="graphMain bordered">Буквенный код страны в соответствии с классификатором стран мира</td-->
              <td class="graphMain bordered">Краткое название страны в соответствии с классификатором стран мира</td>
              <td class="graphMain bordered">Регион</td>
              <td class="graphMain bordered">Район</td>
              <td class="graphMain bordered">Город</td>
              <td class="graphMain bordered">Населенный пункт</td>
              <td class="graphMain bordered">Улица</td>
              <td class="graphMain bordered">Обозначение дома, корпуса, строения</td>
              <td class="graphMain bordered">Обозначение офиса или квартиры</td>
              <td class="graphMain bordered">Набор элементов адреса, представленных в свободной форме в виде текста</td>
              <!--td class="graphMain bordered">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
              <td class="graphMain bordered">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
              <td class="graphMain bordered">Код КЛАДР</td>
              <td class="graphMain bordered">Глобальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Уникальный идентификатор адресного объекта по ФИАС</td>
              <td class="graphMain bordered">Код единицы административно-территориального деления</td>
              <td class="graphMain bordered">Номер абонентского ящика на предприятии почтовой связи</td-->
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
      <xsl:if test="RUScat_ru:BankInformation">
        <div class="title marg-top">Информация о банковских счетах</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Номер банковского счета</td>
              <td class="graphMain bordered">Описание типа счета: расчетный, валютный</td>
              <td class="graphMain bordered">Название банка</td>
              <td class="graphMain bordered">МФО банка</td>
              <td class="graphMain bordered">Код банка по ОКПО</td>
              <td class="graphMain bordered">БИК банка</td>
              <td class="graphMain bordered">SWIFT код банка</td>
              <td class="graphMain bordered">Номер корреспондентского счета банка</td>
              <td class="graphMain bordered">Валютный счет организации (транзитный)</td>
              <td class="graphMain bordered">Валютный счет организации (специальный транзитный)</td>
            </tr>
            <xsl:for-each select="RUScat_ru:BankInformation">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="agc:AuthorizedPerson">
        <div class="title marg-top">ФИО лица, уполномоченного на подписание договора поручительства</div>
        <div>
          <xsl:apply-templates select="agc:AuthorizedPerson">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="agc:ConfirmingDocument">
        <div class="title marg-top">Документ, подтверждающий полномочия лица</div>
        <div>
          <xsl:apply-templates select="agc:ConfirmingDocument">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
  <xsl:template match="agc:RegNumberDT">
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
  <xsl:template match="agc:RelatedContract">
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
  <!-- Шаблон для типа agc:StatusDetailsType -->
  <xsl:template match="agc:StatusDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Статус договора</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="agc:Status='0'">
                <xsl:text>новый</xsl:text>
              </xsl:when>
              <xsl:when test="agc:Status='1'">
                <xsl:text>заключен</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="agc:Status" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="agc:Date" mode="russian_date" />
          </td>
        </tr>
      </table>
      <xsl:if test="agc:DocumentCode">
        <div class="title marg-top">Связанный договор</div>
        <div>
          <xsl:apply-templates select="agc:DocumentCode">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:AddressType -->
  <xsl:template match="cat_ru:Address">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="cat_ru:Contact">
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
            <td class="annot graphMain" style="width:50%">ИНН / ПИН</td>
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
  <xsl:template match="//*[local-name()='AdditionGuaranteeContract']//*" priority="-1">
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