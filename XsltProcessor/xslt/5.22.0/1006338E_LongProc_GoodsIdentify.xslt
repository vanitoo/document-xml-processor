<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.22.0" xmlns:lp_gid="urn:customs.ru:Information:CustomsDocuments:LongProc_GoodsIdentify:5.22.0">
	<!-- Шаблон для типа LongProc_GoodsIdentifyType -->
	<xsl:template match="lp_gid:LongProc_GoodsIdentify">
		<xsl:param name="w" select="190" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Заявление о проведении идентификации товаров</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
					<xsl:if test="lp_gid:Customs">
						<div class="title marg-top">Сведения о таможенном органе, в который подается заявление</div>
						<div>
							<xsl:apply-templates select="lp_gid:Customs">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="lp_gid:Declarant">
						<div class="title marg-top">Сведения о декларанте (заявителе)</div>
						<div>
							<xsl:apply-templates select="lp_gid:Declarant">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="lp_gid:CustomsAuthorizedPerson">
						<div class="title marg-top">Сведения о таможенном представителе</div>
						<div>
							<xsl:apply-templates select="lp_gid:CustomsAuthorizedPerson">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Сведения о товарах и способах их идентификации</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Порядковый номер товара</td>
								<td class="graphMain bordered">Наименование (фирменное, коммерческое или иное традиционное наименование) товара</td>
								<td class="graphMain bordered">Наименование товарного знака, объекта авторского права, смежных прав, патента</td>
								<td class="graphMain bordered">Наименование марки</td>
								<td class="graphMain bordered">Наименование модели</td>
								<td class="graphMain bordered">Артикул товара</td>
								<td class="graphMain bordered">Наименование сорта</td>
								<td class="graphMain bordered">Наименование стандарта (международного, межгосударственного, государственного, отраслевого или организации) или технических условий на товар</td>
								<td class="graphMain bordered">Уникальный идентификатор (серийный номер, код) экземпляра товара</td>
								<td class="graphMain bordered">Дата производства (изготовления) товара</td>
								<td class="graphMain bordered">Сведения о производителе (изготовителе)</td>
								<td class="graphMain bordered">Сведения об иных технических и коммерческих характеристиках товара</td>
								<td class="graphMain bordered">Сведения о стране происхождения товара</td>
								<td class="graphMain bordered">Десятизначный код товара в соответствии с единой ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Вес товара, брутто</td>
								<td class="graphMain bordered">Вес товара, нетто</td>
								<td class="graphMain bordered">Количество товара с указанием дополнительной единицы измерения</td>
								<td class="graphMain bordered">Сведения о способе идентификации товара</td>
							</tr>
							<xsl:for-each select="lp_gid:GoodsIdentif">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w" />
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<div class="title marg-top">Сведения о документах, представляемых к заявлению</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Признак размещения документа в электронном архиве документов декларанта, находящемся в ЕАИС ТО</td>
								<td class="graphMain bordered">Идентификаторы, присвоенные документу при размещении в ЭАД</td>
								<td class="graphMain bordered">Сведения о документах, представляемых на бумажном носителе</td>
							</tr>
							<xsl:for-each select="lp_gid:PresentedDoc">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w" />
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="lp_gid:GoodsLocation">
						<div class="title marg-top">Сведения о месте, в котором товары находятся на момент подачи заявления</div>
						<div>
							<xsl:apply-templates select="lp_gid:GoodsLocation">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="lp_gid:OtherInfo">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Иные сведения, представляемые декларантом/заявителем</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="lp_gid:OtherInfo" />
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:GoodLocationTransportMeansDetailsType -->
	<xsl:template match="RUDECLcat:GoodLocationTransportMeansDetails">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:UnifiedTransportModeCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение вида транспорта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:UnifiedTransportModeCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<div class="title marg-top">Индивидуальное буквенно-цифровое обозначение, присвоенное регистрирующим органом транспортному средству</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Строка символов, идентифицирующая транспортное средство</td>
						<td class="graphMain bordered">Кодовое обозначение страны, по правилам которой сформирован указанный код</td>
					</tr>
					<xsl:for-each select="RUScat_ru:TransportMeansRegId">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:DocBaseV2Type -->
	<xsl:template match="RUDECLcat:GoodsLocationDocDetails">
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
			<xsl:if test="RUScat_ru:DocStartDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата начала срока, в течение которого документ имеет силу</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:DocStartDate" mode="russian_date" />
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
			<xsl:if test="RUScat_ru:DocKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:DocKindCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RegisterDocumentIdDetailsType -->
	<xsl:template match="RUDECLcat:RegisterDocumentIdDetails">
	<xsl:param name="wdth" select="0" />
	<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
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
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер лица, присвоенный ему при включении в реестр, или регистрационный номер документа о включении лица в реестр</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:RegistrationNumberId" />
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:ReregistrationCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение признака перерегистрации документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:ReregistrationCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AEORegistryKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код типа свидетельства уполномоченного экономического оператора</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AEORegistryKindCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUDECLcat:UnifiedAddressDetails">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:AddressKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение вида адреса</td>
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
	<!-- Шаблон для типа RUScat_ru:TransportMeansRegIdType -->
	<xsl:template match="RUScat_ru:TransportMeansRegId">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:TransportMeansRegIdNumber" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CountryCode" />
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
					<td class="annot graphMain" style="width:50%">Код. Универсальный идентификационный таможенный номер</td>
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
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="*" mode="DeclarantAP">
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
	<!-- Шаблон для типа lp_gid:AuthorizedPersonType -->
	<xsl:template match="*" mode="CustomsAP">
		<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
		<xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия, имя и отчество уполномоченного лица таможенного представителя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:PersonFIO" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование должности уполномоченного лица таможенного представителя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:PersonPost" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="lp_gid:Customs">
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
	<!-- Шаблон для типа lp_gid:CustomsAuthorizedPersonType -->
	<xsl:template match="lp_gid:CustomsAuthorizedPerson">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Признак подачи заявления таможенным представителем</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="lp_gid:Flag='true' or lp_gid:Flag='1'">
								<xsl:text>заявление подается таможенным представителем</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:Flag='false' or lp_gid:Flag='0'">
								<xsl:text>заявление подается декларантом/заявителем</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="lp_gid:Flag" />
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="lp_gid:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полное наименование таможенного представителя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lp_gid:OrganizationName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="lp_gid:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сокращенное наименование таможенного представителя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lp_gid:ShortName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="lp_gid:RegNum">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регистрационный номер таможенного представителя, присвоенного программным средством ЕАИС ТО при включении в реестр таможенных представителей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lp_gid:RegNum" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="lp_gid:AuthorizedPerson">
				<div class="title marg-top">Сведения об уполномоченном лице таможенного представителя</div>
				<div>
					<xsl:apply-templates select="lp_gid:AuthorizedPerson" mode="CustomsAP">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lp_gid:DeclarantType -->
	<xsl:template match="lp_gid:Declarant">
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
							<td class="graphMain bordered">Кодовое обозначение вида адреса</td>
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
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Признак юридического/физического лица (декларанта/заявителя)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="lp_gid:TypePerson='true' or lp_gid:TypePerson='1'">
								<xsl:text>физическое лицо</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:TypePerson='false' or lp_gid:TypePerson='0'">
								<xsl:text>юридическое лицо</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="lp_gid:TypePerson" />
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="lp_gid:AuthorizedPerson">
				<div class="title marg-top">Сведения об уполномоченном лице декларанта/заявителя</div>
				<div>
					<xsl:apply-templates select="lp_gid:AuthorizedPerson" mode="DeclarantAP">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lp_gid:DestinationCountryType -->
	<xsl:template match="lp_gid:DestinationCountry">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:CountryCode" />
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CountryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="lp_gid:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение единицы административно-территориального деления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lp_gid:TerritoryCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lp_gid:ElectronicDocType -->
	<xsl:template match="lp_gid:ElectronicDoc">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор хранилища электронных документов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:ArchiveID" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор электронного документа в хранилище</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:DocID" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lp_gid:GoodsIdentifType -->
	<xsl:template match="lp_gid:GoodsIdentif">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:Position" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:GoodsDescription" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:TrademarkDescription" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:GoodsMark" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:GoodsModel" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:GoodsMarking" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:GoodsSort" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:GoodsStandard" />
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="lp_gid:SerialNumber">
						<xsl:if test="position()!=1">
							<br />
						</xsl:if>
						<xsl:apply-templates select="." />
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:ProductionDate" mode="russian_date" />
				</td>
				<td class="graphMain bordered">
					<xsl:if test="lp_gid:ManufacturerPerson">
						<xsl:apply-templates select="lp_gid:ManufacturerPerson">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:OtherCharacteristics" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:DestinationCountry">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:GoodsTNVEDCode" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:GrossWeightQuantity" mode="translate_number" />
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:NetWeightQuantity" mode="translate_number" />
				</td>
				<td class="graphMain bordered">
					<xsl:if test="lp_gid:GoodsQuantity">
						<xsl:apply-templates select="lp_gid:GoodsQuantity">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lp_gid:IdentifMean">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:GoodsLocationDetailsType -->
	<xsl:template match="lp_gid:GoodsLocation">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код места нахождения товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUDECLcat:GoodsLocationCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUDECLcat:CustomsOfficeCode" />
					</td>
				</tr>
			</table>
			<xsl:if test="RUDECLcat:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код государства-члена, в котором находится таможенный орган места нахождения товаров</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUDECLcat:CountryCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUDECLcat:GoodsLocationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование места нахождения товаров (железнодорожной станции, морского (речного) порта)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUDECLcat:GoodsLocationName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUDECLcat:CustomsControlZoneId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер (регистрационный номер) зоны таможенного контроля </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUDECLcat:CustomsControlZoneId" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUDECLcat:GoodsLocationDocDetails">
				<div class="title marg-top">Сведения о документе (разрешение таможенного органа на временное хранение товаров)</div>
				<div>
					<xsl:apply-templates select="RUDECLcat:GoodsLocationDocDetails">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUDECLcat:RegisterDocumentIdDetails">
				<div class="title marg-top">Свидетельство о включении в реестр уполномоченных экономических операторов, свидетельство о включении в реестр владельцев складов временного хранения, документ (свидетельство), удостоверяющий регистрацию лица в качестве резидента (участника) свободной (специальной, особой) экономической зоны </div>
				<div>
					<xsl:apply-templates select="RUDECLcat:RegisterDocumentIdDetails">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUDECLcat:GoodLocationTransportMeansDetails">
				<div class="title marg-top">Сведения о транспортном средстве в/на котором находятся товары</div>
				<div>
					<xsl:apply-templates select="RUDECLcat:GoodLocationTransportMeansDetails">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUDECLcat:UnifiedAddressDetails">
				<div class="title marg-top">Адрес места нахождения товаров</div>
				<div>
					<xsl:apply-templates select="RUDECLcat:UnifiedAddressDetails">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:SupplementaryQuantityType -->
	<xsl:template match="lp_gid:GoodsQuantity">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catESAD_cu:GoodsQuantity" mode="translate_number" />
					</td>
				</tr>
			</table>
			<xsl:if test="catESAD_cu:MeasureUnitQualifierName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код по классификатору единиц измерения и счета Евразийского экономического союза</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lp_gid:IdentifMeanType -->
	<xsl:template match="lp_gid:IdentifMean">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер (буквенное значение) подпункта пункта 5 Порядка проведения идентификации товаров, помещаемых под таможенные процедуры (утверждается проектом приказа)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="lp_gid:IdentifMeanPunkt='А'">
								<xsl:text>использование имеющейся маркировки товаров, в том числе в виде серийных номеров</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:IdentifMeanPunkt='Б'">
								<xsl:text>подробное описание товаров</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:IdentifMeanPunkt='В'">
								<xsl:text>использование товаросопроводительной и (или) иной документации</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:IdentifMeanPunkt='Г'">
								<xsl:text>сопоставление результатов исследований товаров, в том числе их проб и (или) образцов</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:IdentifMeanPunkt='Д'">
								<xsl:text>изготовление декларантом масштабных изображений</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:IdentifMeanPunkt='Е'">
								<xsl:text>изготовление декларантом фотографий</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:IdentifMeanPunkt='Ж'">
								<xsl:text>изготовление декларантом иллюстраций</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:IdentifMeanPunkt='З'">
								<xsl:text>составление декларантом чертежей</xsl:text>
							</xsl:when>
							<xsl:when test="lp_gid:IdentifMeanPunkt='И'">
								<xsl:text>иной способ, который может быть применен исходя из характера товара</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="lp_gid:IdentifMeanPunkt" />
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование используемого способа идентификации, предусмотренного соответствующим подпунктом пункта 5 Порядка идентификации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:IdentifMeanName" />
					</td>
				</tr>
			</table>
			<xsl:if test="lp_gid:IdentifMeanDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Подробное описание способа идентификации при применении способа идентификации, указанного в подпункте «и» пункта 5 Порядка идентификации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lp_gid:IdentifMeanDescription" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lp_gid:ManufacturerPersonType -->
	<xsl:template match="lp_gid:ManufacturerPerson">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="lp_gid:ManufacturerName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полное наименование производителя (изготовителя)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lp_gid:ManufacturerName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="lp_gid:ManufacturerShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сокращенное наименование производителя (изготовителя)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lp_gid:ManufacturerShortName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="lp_gid:ManufacturerINN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор субъекта в реестре налогоплательщиков страны регистрации налогоплательщика (для российских лиц – ИНН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lp_gid:ManufacturerINN" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lp_gid:PaperDocType -->
	<xsl:template match="lp_gid:PaperDoc">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение вида документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:DocKindCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:DocumentName" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Цифровое или буквенно-цифровое обозначение, присвоенное документу при его регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:DocumentID" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи, подписания, утверждения или регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lp_gid:DocumentDate" mode="russian_date" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lp_gid:PresentedDocType -->
	<xsl:template match="lp_gid:PresentedDoc">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="lp_gid:ElectronicArchive='true' or lp_gid:ElectronicArchive='1'">
							<xsl:text>документ размещен в ЭАД</xsl:text>
						</xsl:when>
						<xsl:when test="lp_gid:ElectronicArchive='false' or lp_gid:ElectronicArchive='0'">
							<xsl:text>документ представлен на бумажном носителе</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="lp_gid:ElectronicArchive" />
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="lp_gid:ElectronicDoc">
						<xsl:apply-templates select="lp_gid:ElectronicDoc">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="lp_gid:PaperDoc">
						<xsl:apply-templates select="lp_gid:PaperDoc">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
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
	<xsl:template match="//*[local-name()='LongProc_GoodsIdentify']//*" priority="-1">
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