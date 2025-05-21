<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:stz_apeg="urn:customs.ru:Information:ExchangeDocuments:STZ_AppProcessingOrRepairGoods:5.24.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа STZ_AppProcessingOrRepairGoodsType -->
	<xsl:template match="stz_apeg:STZ_AppProcessingOrRepairGoods">
		<xsl:param name="w" select="190"/>
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
										<b>Заявление на вывоз товаров, помещенных под таможенную процедуру свободной таможенной зоны, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру
свободной таможенной зоны, без завершения таможенной процедуры свободной таможенной зоны в случаях, установленных подпунктами 1, 2 и 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="stz_apeg:Customs">
						<div class="title marg-top">Сведения о таможенном органе</div>
						<div>
							<xsl:apply-templates select="stz_apeg:Customs">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="stz_apeg:Resident">
						<div class="title marg-top">Лицо, обладающее правами владения, пользования и (или) распоряжения товарами и осуществляющее вывоз товаров</div>
						<div>
							<xsl:apply-templates select="stz_apeg:Resident">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Вид завления: 1 - на основании пп.1, 2 пункта 4 статьи 205 ТК ЕАЭС; 2 - на основании пп.5 пункта 4 статьи 205 ТК ЕАЭС</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="stz_apeg:DocKind='1'">
										<xsl:text>на основании пп</xsl:text>
									</xsl:when>
									<xsl:when test="stz_apeg:DocKind='2'">
										<xsl:text>на основании пп</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="stz_apeg:DocKind"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="stz_apeg:SheetsNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Количество листов</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="stz_apeg:SheetsNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование особой экономической зоны</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="stz_apeg:NameOfTerritory"/>
							</td>
						</tr>
					</table>
					<xsl:if test="stz_apeg:AddressOfTerritory">
						<div class="title marg-top">Адрес места нахождения товаров</div>
						<div>
							<xsl:apply-templates select="stz_apeg:AddressOfTerritory">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="stz_apeg:GoodsForRepair">
						<div class="title marg-top">Раздел I.Товары, вывозимые для совершения операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 ТК ЕАЭС</div>
						<!--div>
							<xsl:apply-templates select="stz_apeg:GoodsForRepair">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div-->
					</xsl:if>
					<xsl:if test="stz_apeg:GoodsForProcessing">
						<div class="title marg-top">Раздел II, Товары, вывозимые для совершения операций, предусмотренных подпунктом 5 пункта 4 статьи 205 ТК ЕАЭС </div>
						<!--div>
							<xsl:apply-templates select="stz_apeg:GoodsForProcessing">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div-->
					</xsl:if>
					<xsl:if test="stz_apeg:PresentedDoc">
						<div class="title marg-top">Представленные документы</div>
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
								<xsl:for-each select="stz_apeg:PresentedDoc">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="stz_apeg:ConfirmDoc">
						<div class="title marg-top">Реквизиты документа, подтверждающего полномочия лица</div>
						<div>
							<xsl:apply-templates select="stz_apeg:ConfirmDoc">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="stz_apeg:ResidentSignature">
						<div class="title marg-top">Подпись уполномоченного представителя Заявителя </div>
						<div>
							<xsl:apply-templates select="stz_apeg:ResidentSignature">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код объекта в соответсвии со справочником (классификатором) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CodeListId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение справочника (классификатора), в соответствии с которым указан код</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CodeListId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:Phone">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телефона</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:Phone">
								<xsl:value-of select="."/>
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
							<xsl:apply-templates select="cat_ru:Fax"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Telex">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телекса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:Telex"/>
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
								<xsl:value-of select="."/>
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
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:IdentityCardCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность, в соответствии с классификатором видов документов, удостоверяющих личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:FullIdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полное наименование документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:DocValidityDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IssuerCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IssuerCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AuthorityId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AuthorityId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
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
									<xsl:value-of select="RUScat_ru:AddressKindCode"/>
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
							<xsl:apply-templates select="RUScat_ru:PostalCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:District"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Town"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:House"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Room"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AddressText">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AddressText"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKTMO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKATO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:KLADR"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOGUID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон с дублирующимся match закомментирован -->
	<!--
<xsl:template match="RUScat_ru:SubjectAddressDetails">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><tr><td class="graphMain bordered"><xsl:choose xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:when test="RUScat_ru:AddressKindCode='1'"><xsl:text>адрес регистрации</xsl:text></xsl:when><xsl:when test="RUScat_ru:AddressKindCode='2'"><xsl:text>фактический адрес</xsl:text></xsl:when><xsl:when test="RUScat_ru:AddressKindCode='3'"><xsl:text>почтовый адрес</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="RUScat_ru:AddressKindCode" /></xsl:otherwise></xsl:choose></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:PostalCode" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:CountryCode" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:CounryName" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:Region" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:District" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:Town" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:City" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:StreetHouse" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:House" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:Room" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:AddressText" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:OKTMO" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:OKATO" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:KLADR" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:AOGUID" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:AOID" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:TerritoryCode" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td><td class="graphMain bordered"><xsl:apply-templates select="RUScat_ru:PostOfficeBoxId" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></div></xsl:template>
-->
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код. Универсальный идентификационный таможенный номер. Строка не более 40 символов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UITNCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны, по правилам которой сформирован указанный идентификатор</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType -->
	<xsl:template match="catESAD_cu:AllowanceDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<div class="title marg-top">Линейный размер объекта в продольном направлении </div>
				<div>
					<xsl:apply-templates select="catESAD_cu:LengthMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:WidthMeasure">
				<div class="title marg-top">Линейный размер объекта в поперечном направлении</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:WidthMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:HeightMeasure">
				<div class="title marg-top">Линейный размер объекта в вертикальном направлении</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:HeightMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="catESAD_cu:ContractVolumeMeasure">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType -->
	<xsl:template match="catESAD_cu:DeviationDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<div class="title marg-top">Линейный размер объекта в продольном направлении </div>
				<div>
					<xsl:apply-templates select="catESAD_cu:LengthMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:WidthMeasure">
				<div class="title marg-top">Линейный размер объекта в поперечном направлении</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:WidthMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:HeightMeasure">
				<div class="title marg-top">Линейный размер объекта в вертикальном направлении</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:HeightMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:RangeMeasureType -->
	<xsl:template match="catESAD_cu:DiameterRangeDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:if test="catESAD_cu:MinRangeMeasure">
						<xsl:apply-templates select="catESAD_cu:MinRangeMeasure">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catESAD_cu:MaxRangeMeasure">
						<xsl:apply-templates select="catESAD_cu:MaxRangeMeasure">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType -->
	<xsl:template match="catESAD_cu:Dimensions">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<div class="title marg-top">Линейный размер объекта в продольном направлении </div>
				<div>
					<xsl:apply-templates select="catESAD_cu:LengthMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:WidthMeasure">
				<div class="title marg-top">Линейный размер объекта в поперечном направлении</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:WidthMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:HeightMeasure">
				<div class="title marg-top">Линейный размер объекта в вертикальном направлении</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:HeightMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="catESAD_cu:FactVolumeMeasure">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:SupplementaryQuantityType -->
	<xsl:template match="catESAD_cu:GoodsGroupQuantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catESAD_cu:GoodsQuantity" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catESAD_cu:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код по классификатору единиц измерения и счета Евразийского экономического союза</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:UnifiedPhysicalMeasureType -->
	<xsl:template match="catESAD_cu:HeightMeasure">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catESAD_cu:MeasuredAmount" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catESAD_cu:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:UnifiedPhysicalMeasureType -->
	<xsl:template match="catESAD_cu:LengthMeasure">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catESAD_cu:MeasuredAmount" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catESAD_cu:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="catESAD_cu:LicDocument">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:LicenseGroupType -->
	<xsl:template match="catESAD_cu:LicenseGroup">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:if test="catESAD_cu:LicDocument">
						<xsl:apply-templates select="catESAD_cu:LicDocument">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:RecordId"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:GoodsNumericLic"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="catESAD_cu:MaxRangeMeasure">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="catESAD_cu:MinRangeMeasure">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:UnifiedPhysicalMeasureType -->
	<xsl:template match="catESAD_cu:WidthMeasure">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catESAD_cu:MeasuredAmount" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catESAD_cu:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template match="catESAD_cu:WoodDescriptionDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_cu:WoodSortiment">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование сортимента (для лесоматериалов товарной позиции 4403)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:WoodSortiment"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodKind">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Порода древесины</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:WoodKind"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:ProductSortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование сорта (группы сортов) продукта (товара)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:ProductSortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:AllowanceDetails">
				<div class="title marg-top">Сведения о величине припуска по длине, ширине и высоте</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:AllowanceDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:DeviationDetails">
				<div class="title marg-top">Сведения о величине отклонений по длине, ширине и высоте</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:DeviationDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:DiameterRangeDetails">
				<div class="title marg-top">Сведения о диапазоне диаметров</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Минимальная величина диапазона величин (с указанием единиц измерения)</td>
							<td class="graphMain bordered">Максимальная величина диапазона величин (с указанием единиц измерения)</td>
						</tr>
						<xsl:for-each select="catESAD_cu:DiameterRangeDetails">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:ContractVolumeMeasure">
				<div class="title marg-top">Номинальный объем товара (в соответствии с договором (контрактом), без учета коры, припусков и др.)</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:ContractVolumeMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="catESAD_cu:FactVolumeMeasure">
				<div class="title marg-top">Фактический объем товара (c учетом коры, отклонений, припусков и др.)</div>
				<div>
					<xsl:apply-templates select="catESAD_cu:FactVolumeMeasure">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:SupplementaryQuantityType -->
	<xsl:template match="catProc_ru:GoodsQuantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:GoodsQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
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
									<xsl:value-of select="cat_ru:KGINN"/>
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
							<xsl:apply-templates select="cat_ru:KGOKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:UNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:UNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OGRN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:BIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:BIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:AccountDocType -->
	<xsl:template match="stz_apeg:AccountDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:GoodsNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catProc_ru:GoodsQuantity">
						<xsl:apply-templates select="catProc_ru:GoodsQuantity">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="stz_apeg:AddressOfTerritory">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
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
									<xsl:value-of select="RUScat_ru:AddressKindCode"/>
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
							<xsl:apply-templates select="RUScat_ru:PostalCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:District"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Town"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:House"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Room"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AddressText">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AddressText"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKTMO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKATO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:KLADR"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOGUID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="stz_apeg:ConfirmDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:DocExtendedType -->
	<xsl:template match="stz_apeg:ConfirmTransferDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:CustomsDocumentCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:ElectronicDocumentID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:ElectronicArchID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:DocumentModeID"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="stz_apeg:Customs">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:EAD_NumberType -->
	<xsl:template match="stz_apeg:EAD_Number">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН плательшика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:INN"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата составления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:EAD_Date" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:Number"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Признак товара, на который формируется ЭУД: СТЗ - товары помещенные, под процедуру СТЗ; ПП - товары, изготовленные (полученные) с использованием товаров, помещенных под процедуру СТЗ </td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="stz_apeg:GoodsKind='СТЗ'">
								<xsl:text>товары помещенные</xsl:text>
							</xsl:when>
							<xsl:when test="stz_apeg:GoodsKind='ПП'">
								<xsl:text>товары</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="stz_apeg:GoodsKind"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:EECGoodsType -->
	<xsl:template match="stz_apeg:EECGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Owner">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:AccountDoc">
						<xsl:apply-templates select="stz_apeg:AccountDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:TechID">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:EquipmentGoodsType -->
	<xsl:template match="stz_apeg:EquipmentGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsTNVEDCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsGroupInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsDecl">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsAccountDoc">
						<xsl:apply-templates select="stz_apeg:GoodsAccountDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:Comment">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:TechID">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:FinishedProductsType -->
	<xsl:template match="stz_apeg:FinishedProducts">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsTNVEDCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsGroupInformation">
						<xsl:apply-templates select="stz_apeg:GoodsGroupInformation">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:TechID">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:AccountDocType -->
	<xsl:template match="stz_apeg:GoodsAccountDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:GoodsNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catProc_ru:GoodsQuantity">
						<xsl:apply-templates select="catProc_ru:GoodsQuantity">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:DeclnfoType -->
	<xsl:template match="stz_apeg:GoodsDecl">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:GTDNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsDeclnfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:DeclnfoType -->
	<xsl:template match="stz_apeg:GoodsDeclaration">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:GTDNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsDeclnfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:GoodsDeclnfoType -->
	<xsl:template match="stz_apeg:GoodsDeclnfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsWeightQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsQuantity">
						<xsl:apply-templates select="stz_apeg:GoodsQuantity">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:TechID">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:EAD_Number">
						<xsl:apply-templates select="stz_apeg:EAD_Number">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:EAD_GoodsNumber"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:GoodsForProcessingType -->
	<xsl:template match="stz_apeg:GoodsForProcessing">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top">Операции по переработке, являющиеся составной частью производственного процесса и которые будут совершаться за пределами территории ОЭЗ, а также технологии их совершения  </div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Операция по переработке</td>
						<td class="graphMain bordered">Сведения о технологическом процессе совершения операции </td>
					</tr>
					<xsl:for-each select="stz_apeg:ProcessingOperations">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Причины, препятствующие совершению операций по переработке на территории ОЭЗ и которые будут совершаться за пределами ОЭЗ</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="stz_apeg:Reason">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<div class="title marg-top">Лицо, которое непосредственно будет совершать операции по переработке за пределами территории ОЭЗ</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование организации / ФИО физического лица</td>
						<td class="graphMain bordered">Краткое наименование организации</td>
						<td class="graphMain bordered">Код языка для заполнения наименования </td>
						<td class="graphMain bordered">Сведения об организации. Особенности Российской Федерации</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Республики Казахстан</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Республики Беларусь</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Республики Армения</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Кыргызской Республики</td>
						<td class="graphMain bordered">Кодовое обозначение страны</td>
						<td class="graphMain bordered">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="graphMain bordered">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="graphMain bordered">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
						<td class="graphMain bordered">Уникальный идентификатор физического лица</td>
						<td class="graphMain bordered">Сведения о документе, удостоверяющем личность физического лица</td>
						<td class="graphMain bordered">Адрес</td>
						<td class="graphMain bordered">Контактный реквизит субъекта</td>
					</tr>
					<xsl:for-each select="stz_apeg:ProcessingPerson">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="stz_apeg:ConfirmTransferDoc">
				<div class="title marg-top">Документы, подтверждающие передачу товаров организации переработчику</div>
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
						</tr>
						<xsl:for-each select="stz_apeg:ConfirmTransferDoc">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<div class="title marg-top">Адрес места нахождения производственных площадей организации переработчика, на которых будут совершаться операции по переработке</div>
				<xsl:for-each select="stz_apeg:ProcessingAddress">
					<xsl:apply-templates select=".">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:for-each>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Сроки вывоза и нахождения товаров за пределами территории ОЭЗ с учетом продолжительности производственного процесса, используемого организацией переработчиком, и времени перевозки товаров от территории ОЭЗ до места совершения таких операций и обратно</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:ProcessingTerm" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Способ идентификации товаров в товарах, изготовленных (полученных) из вывозимых товаров в результате совершения операций по переработке за пределами территории ОЭЗ, при последующем ввозе готовой продукции на территорию ОЭЗ</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="stz_apeg:MethodIdentify">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Норма расхода товаров на единицу готовой продукции или норма выхода готовой продукции в относительном (процентном) или абсолютном значении в соответствии с техническими документами</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="stz_apeg:YieldNorm">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<xsl:if test="stz_apeg:PlacedGoods">
				<div class="title marg-top">Товары, помещенные под таможенную процедуру СТЗ, вывозимые для совершения операций по переработке</div>
				<div>
					<xsl:apply-templates select="stz_apeg:PlacedGoods">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="stz_apeg:GoodsResult">
				<div class="title marg-top">Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру СТЗ, вывозимые для совершения операций по переработке</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Порядковый номер позиции</td>
							<td class="graphMain bordered">Описание товара</td>
							<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
							<td class="graphMain bordered">Идентификационные признаки товара </td>
							<td class="graphMain bordered">Реквизиты первичных документов, согласно которым товар принят к бухгалтерскому учету лица, обладающего правами владения, пользования и (или) распоряжения в отношении такого товара</td>
							<td class="graphMain bordered">Сведения о ДТ</td>
							<td class="graphMain bordered">Количество товара</td>
							<td class="graphMain bordered">Технические идентификаторы</td>
						</tr>
						<xsl:for-each select="stz_apeg:GoodsResult">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="stz_apeg:EECGoods">
				<div class="title marg-top">Товары ЕАЭС, которые будут использоваться при совершении операций по переработке</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Порядковый номер позиции</td>
							<td class="graphMain bordered">Описание товара</td>
							<td class="graphMain bordered">Количество вывозимого товара</td>
							<td class="graphMain bordered">Владелец товаров </td>
							<td class="graphMain bordered">Реквизиты документа бухгалтерского учета, согласно которому товары учтены резидентом </td>
							<td class="graphMain bordered">Технические идентификаторы</td>
						</tr>
						<xsl:for-each select="stz_apeg:EECGoods">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="stz_apeg:FinishedProducts">
				<div class="title marg-top">Сведения о готовой продукции, которая будет ввозиться на территорию ОЭЗ</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Порядковый номер позиции</td>
							<td class="graphMain bordered">Описание товара</td>
							<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
							<td class="graphMain bordered">Идентификационные признаки товара </td>
							<td class="graphMain bordered">Количество товара</td>
							<td class="graphMain bordered">Технические идентификаторы</td>
						</tr>
						<xsl:for-each select="stz_apeg:FinishedProducts">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="stz_apeg:GoodsUnchanged">
				<div class="title marg-top">Товары, которые остаются в неизменном состоянии в результате совершения операций по переработке </div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Порядковый номер позиции</td>
							<td class="graphMain bordered">Наименование товара</td>
							<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
							<td class="graphMain bordered">Идентификационные признаки товара </td>
							<td class="graphMain bordered">Сведения из ДТ, в соответствии с которой товар помещен под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered">Реквизиты документа бухгалтерского учета (наименование, дата, номер), в соответствии с которым вывозимый  товар, изготовленный (полученный) из товаров, помещенных под таможенную процедуру СТЗ,  учтен Заявителем</td>
							<td class="graphMain bordered">Количество вывозимого товара</td>
							<td class="graphMain bordered">Примечание</td>
							<td class="graphMain bordered">Технические идентификаторы, в том числе сведения о результате сверки с данными ЕАИС («Расхождений нет» или «Не соответствие по наименованию (количеству) с ДТ»)</td>
						</tr>
						<xsl:for-each select="stz_apeg:GoodsUnchanged">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:GoodsForRepairType -->
	<xsl:template match="stz_apeg:GoodsForRepair">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Цели вывоза товаров</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="stz_apeg:RepairAndTestingOperations">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<xsl:if test="stz_apeg:RepairOrTesting">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Операции, которые будут совершаться с товарами</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="stz_apeg:RepairOrTesting">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="stz_apeg:RepairAndTestingPlace">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Место совершения операций</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="stz_apeg:RepairAndTestingPlace"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<div class="title marg-top">Адрес места совершения операций</div>
			<xsl:for-each select="stz_apeg:RepairAndTestingAddress">
				<xsl:apply-templates select=".">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:for-each>
			<div class="title marg-top">Лицо, которое непосредственно будет совершать операции за пределами территории особой экономической зоны</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование организации / ФИО физического лица</td>
						<td class="graphMain bordered">Краткое наименование организации</td>
						<td class="graphMain bordered">Код языка для заполнения наименования </td>
						<td class="graphMain bordered">Сведения об организации. Особенности Российской Федерации</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Республики Казахстан</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Республики Беларусь</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Республики Армения</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Кыргызской Республики</td>
						<td class="graphMain bordered">Кодовое обозначение страны</td>
						<td class="graphMain bordered">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="graphMain bordered">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="graphMain bordered">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
						<td class="graphMain bordered">Уникальный идентификатор физического лица</td>
						<td class="graphMain bordered">Сведения о документе, удостоверяющем личность физического лица</td>
						<td class="graphMain bordered">Адрес</td>
						<td class="graphMain bordered">Контактный реквизит субъекта</td>
						<td class="graphMain bordered">Документ (документы), подтверждающий(ие) передачу вывозимых товаров лицу, которое будет непосредственно совершать операции</td>
					</tr>
					<xsl:for-each select="stz_apeg:RepairAndTestingPerson">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="stz_apeg:ConfirmTransferDoc">
				<div class="title marg-top">Документ, подтверждающий передачу товаров лицу, которое будет непосредственно совершать операции, предусмотренные подпунктами 1 и 2 пункта 4 статьи 205 ТК ЕАЭС</div>
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
						</tr>
						<xsl:for-each select="stz_apeg:ConfirmTransferDoc">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Срок обратного ввоза nоваров на территорию ОЭЗ с учетом целей и обстоятельств вывоза nоваров, в том числе с учетом способа транспортировки товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:EntryGoodsTerm" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="stz_apeg:RepTestGoodsInfo">
				<div class="title marg-top">Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны, и (или) товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, которые временно вывозятся без завершения таможенной процедуры свободной таможенной зоны</div>
				<div>
					<xsl:apply-templates select="stz_apeg:RepTestGoodsInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="stz_apeg:ExpCasesAndConditions">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Случаи и условия вывоза товаров</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="stz_apeg:ExpCasesAndConditions">
								<xsl:value-of select="."/>
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
	<!-- Шаблон для типа catESAD_cu:GoodsGroupInformationType -->
	<xsl:template match="stz_apeg:GoodsGroupInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:for-each select="catESAD_cu:InfoDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:Manufacturer"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:ManufacturerINN"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:ManufacturerKPP"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:ManufacturerOKATO"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:TradeMark"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:ProductionPlaceName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:GoodsMark"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:GoodsModel"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:GoodsMarking"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:GoodsStandard"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:GoodsSort"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catESAD_cu:WoodDescriptionDetails">
						<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catESAD_cu:Dimensions">
						<xsl:apply-templates select="catESAD_cu:Dimensions">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:DateIssue" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="catESAD_cu:SerialNumber">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catESAD_cu:GoodsGroupQuantity">
						<xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:ArticleWeight" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:RecordId"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:LineNum"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:InvoicedCost" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catESAD_cu:LicenseGroup">
						<xsl:apply-templates select="catESAD_cu:LicenseGroup">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:SupplementaryQuantityType -->
	<xsl:template match="stz_apeg:GoodsQuantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:GoodsQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:GoodsResultType -->
	<xsl:template match="stz_apeg:GoodsResult">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsTNVEDCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsGroupInformation">
						<xsl:apply-templates select="stz_apeg:GoodsGroupInformation">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsAccountDoc">
						<xsl:apply-templates select="stz_apeg:GoodsAccountDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsDeclaration">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:TechID">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:GoodsUnchangedType -->
	<xsl:template match="stz_apeg:GoodsUnchanged">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsTNVEDCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsGroupInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsDecl">
						<xsl:apply-templates select="stz_apeg:GoodsDecl">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsAccountDoc">
						<xsl:apply-templates select="stz_apeg:GoodsAccountDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:Comment">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:TechID">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:OrganizationType -->
	<xsl:template match="stz_apeg:Owner">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:OrganizationName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:UITN">
						<xsl:apply-templates select="RUScat_ru:UITN">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:SubjectAddressDetails">
						<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:CommunicationDetails">
						<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:PlacedGoodsType -->
	<xsl:template match="stz_apeg:PlacedGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер позиции</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:Position"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Описание товара</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="stz_apeg:GoodsDescription">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код товара по ТН ВЭД ЕАЭС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:GoodsTNVEDCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="stz_apeg:GoodsGroupInformation">
				<div class="title marg-top">Идентификационные признаки товара </div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование артикула</td>
							<td class="graphMain bordered">Наименование производителя (изготовителя) товара</td>
							<td class="graphMain bordered">ИНН производителя (изготовителя) товара</td>
							<td class="graphMain bordered">КПП производителя (изготовителя) товара</td>
							<td class="graphMain bordered">Код ОКАТО производителя (изготовителя) товара</td>
							<td class="graphMain bordered">Наименование товарного знака, объекта авторского права, смежных прав, патента  и т.д. </td>
							<td class="graphMain bordered">Наименование места происхождения</td>
							<td class="graphMain bordered">Наименование марки</td>
							<td class="graphMain bordered">Наименование модели продукта (товара)</td>
							<td class="graphMain bordered">Уникальный идентификатор вида продукта (товара) или артикул товара</td>
							<td class="graphMain bordered">Наименование стандарта (международного, межгосударственного, государственного, отраслевого или организации) или технических условий на товар </td>
							<td class="graphMain bordered">Наименование сорта / сорт или группа сортов (для лесо- и пиломатериалов)</td>
							<td class="graphMain bordered">Сведения о лесоматериалах</td>
							<td class="graphMain bordered">Линейные размеры объекта (длина, ширина и высота)</td>
							<td class="graphMain bordered">Дата производства (изготовления) товара</td>
							<td class="graphMain bordered">Уникальный идентификатор (серийный номер, код) экземпляра продукта (товара)</td>
							<td class="graphMain bordered">Количество товаров</td>
							<td class="graphMain bordered">Вес артикула</td>
							<td class="graphMain bordered">Уникальный идентификатор записи</td>
							<td class="graphMain bordered">Порядковый номер записи в группе</td>
							<td class="graphMain bordered">Цена/стоимость товарной позиции</td>
							<td class="graphMain bordered">Сведения о разрешительном документе к товарной группе</td>
						</tr>
						<xsl:for-each select="stz_apeg:GoodsGroupInformation">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<div class="title marg-top">Сведения о ДТ</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Код таможенного органа, зарегистрировавшего документ</td>
						<td class="graphMain bordered">Дата регистрации документа</td>
						<td class="graphMain bordered">Порядковый номер документа по журналу регистрации</td>
						<td class="graphMain bordered">Товары ДТ</td>
					</tr>
					<xsl:for-each select="stz_apeg:GoodsDeclaration">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="stz_apeg:GoodsAccountDoc">
				<div class="title marg-top">Реквизиты документа бухгалтерского учета (наименование, дата, номер), в соответствии с которым вывозимый  товар, изготовленный (полученный) из товаров, помещенных под таможенную процедуру СТЗ,  учтен Заявителем</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование документа</td>
							<td class="graphMain bordered">Номер документа</td>
							<td class="graphMain bordered">Дата документа</td>
							<td class="graphMain bordered">Порядковый номер позиции</td>
							<td class="graphMain bordered">Номер товара в бухгалтерском документе</td>
							<td class="graphMain bordered">Количество товара из бухгалтерского документа, вошедшего в позицию</td>
						</tr>
						<xsl:for-each select="stz_apeg:GoodsAccountDoc">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<div class="title marg-top">Количество товара</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Количество товара в единице измерения</td>
						<td class="graphMain bordered">Условное обозначение единицы измерения</td>
						<td class="graphMain bordered">Код по классификатору единиц измерения и счета Евразийского экономического союза</td>
					</tr>
					<xsl:for-each select="stz_apeg:GoodsQuantity">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="stz_apeg:TechID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Технические идентификаторы</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="stz_apeg:TechID">
								<xsl:value-of select="."/>
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
	<!-- Шаблон для типа stz_apeg:PresentedDocType -->
	<xsl:template match="stz_apeg:PresentedDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:CustomsDocumentCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:ElectronicDocumentID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:ElectronicArchID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:DocumentModeID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:SheetsNumber"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="stz_apeg:ProcessingAddress">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
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
							<xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:PostalCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CountryCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CounryName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Region"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:District"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Town"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:City"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:House"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Room"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AddressText"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:OKTMO"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:OKATO"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:KLADR"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AOGUID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AOID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:ProcessingOperationsType -->
	<xsl:template match="stz_apeg:ProcessingOperations">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:Operation">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:TechnologicalProcess">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="stz_apeg:ProcessingPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:OrganizationName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:UITN">
						<xsl:apply-templates select="RUScat_ru:UITN">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:PersonId"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:IdentityCard">
						<xsl:apply-templates select="RUScat_ru:IdentityCard">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:SubjectAddressDetails">
						<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:CommunicationDetails">
						<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:RepTestGoodsInfoType -->
	<xsl:template match="stz_apeg:RepTestGoodsInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="stz_apeg:RepairGoodsInfo">
				<div class="title marg-top">Товары, являющиеся оборудованием, иными основными производственными средствами, введенными в эксплуатацию (далее – оборудование), частями, узлами, агрегатами такого оборудования, и вывозимые в соответствии с подпунктом 1 пункта 4 статьи 205 ТК ЕАЭС</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Порядковый номер позиции</td>
							<td class="graphMain bordered">Наименование оборудования</td>
							<td class="graphMain bordered">Вид (класс) оборудования</td>
							<td class="graphMain bordered">Дата постановки оборудования на баланс владельца Товаров в качестве основных средств</td>
							<td class="graphMain bordered">Документ свидетельствующий о вводе оборудования в эксплуатацию</td>
							<td class="graphMain bordered">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
						</tr>
						<xsl:for-each select="stz_apeg:RepairGoodsInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="stz_apeg:TestingGoodsInfo">
				<div class="title marg-top">Товары, вывозимые в соответствии с подпунктом 2 пункта 4 статьи 205 ТК ЕАЭС</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Порядковый номер позиции</td>
							<td class="graphMain bordered">Наименование товара</td>
							<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
							<td class="graphMain bordered">Идентификационные признаки товара </td>
							<td class="graphMain bordered">Сведения из ДТ, в соответствии с которой товар помещен под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered">Реквизиты документа бухгалтерского учета (наименование, дата, номер), в соответствии с которым вывозимый  товар, изготовленный (полученный) из товаров, помещенных под таможенную процедуру СТЗ,  учтен Заявителем</td>
							<td class="graphMain bordered">Количество вывозимого товара</td>
							<td class="graphMain bordered">Примечание</td>
							<td class="graphMain bordered">Технические идентификаторы, в том числе сведения о результате сверки с данными ЕАИС («Расхождений нет» или «Не соответствие по наименованию (количеству) с ДТ»)</td>
						</tr>
						<xsl:for-each select="stz_apeg:TestingGoodsInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="stz_apeg:RepairAndTestingAddress">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
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
							<xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:PostalCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CountryCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CounryName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Region"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:District"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Town"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:City"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:House"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Room"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AddressText"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:OKTMO"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:OKATO"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:KLADR"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AOGUID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AOID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:RepairAndTestingPersonType -->
	<xsl:template match="stz_apeg:RepairAndTestingPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:OrganizationName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:UITN">
						<xsl:apply-templates select="RUScat_ru:UITN">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:PersonId"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:IdentityCard">
						<xsl:apply-templates select="RUScat_ru:IdentityCard">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:SubjectAddressDetails">
						<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="RUScat_ru:CommunicationDetails">
						<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:ConfirmTransferDoc">
						<xsl:apply-templates select="stz_apeg:ConfirmTransferDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:RepairGoodsInfoType -->
	<xsl:template match="stz_apeg:RepairGoodsInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:EquipmentName">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:EquipmentKind">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:AccountDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:AccountDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:EquipmentGoods">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:ResidentType -->
	<xsl:template match="stz_apeg:Resident">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
				<div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:UITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PersonId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<div class="title marg-top">Адрес</div>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<xsl:apply-templates select=".">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<div class="title marg-top">Контактный реквизит субъекта</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="stz_apeg:ResidentCertificate">
				<div class="title marg-top">Cвидетельство о включении в реестр резидентов</div>
				<div>
					<xsl:apply-templates select="stz_apeg:ResidentCertificate">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:ResidentCertificateType -->
	<xsl:template match="stz_apeg:ResidentCertificate">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер свидетельства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:CertificateNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи свидетельства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_apeg:CertificateDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="stz_apeg:CertificateValidity">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Срок действия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="stz_apeg:CertificateValidity" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="stz_apeg:CertificateAgency">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование органа, выдавшего свидетельство</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="stz_apeg:CertificateAgency"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="stz_apeg:ResidentSignature">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonSurname">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Фамилия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonSurname"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Имя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_apeg:TestingGoodsInfoType -->
	<xsl:template match="stz_apeg:TestingGoodsInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsTNVEDCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsGroupInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsDecl">
						<xsl:apply-templates select="stz_apeg:GoodsDecl">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="stz_apeg:GoodsAccountDoc">
						<xsl:apply-templates select="stz_apeg:GoodsAccountDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_apeg:GoodsQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:Comment">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="stz_apeg:TechID">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='STZ_AppProcessingOrRepairGoods']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
