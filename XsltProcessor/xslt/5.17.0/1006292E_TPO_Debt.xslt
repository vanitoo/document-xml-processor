<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.16.0" xmlns:tpodbt="urn:customs.ru:Information:CustomsDocuments:TPO_Debt:5.17.0">
	<!-- Шаблон для типа TPO_DebtType -->
	<xsl:template match="tpodbt:TPO_Debt">
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
										<b>Таможенный приходный ордер (для расчета задолженности)</b>
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
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tpodbt:AdditionalSheetNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Количество добавочных листов</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="tpodbt:AdditionalSheetNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tpodbt:TotalWeight">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Общий вес всех перемещаемых товаров, кг</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="tpodbt:TotalWeight" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tpodbt:TotalCost">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Общая стоимость в валюте платежа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="tpodbt:TotalCost" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tpodbt:DollarTotalCost">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Общая стоимость в долларах США</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="tpodbt:DollarTotalCost" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tpodbt:EuroTotalCost">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Общая стоимость в евро</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="tpodbt:EuroTotalCost" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tpodbt:GoodsIndivisibleHaveSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Наличие неделимых товаров весом свыше 35 кг, товаров общим весом свыше 50 кг и (или) общей таможенной стоимостью свыше 1500 евро</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="tpodbt:GoodsIndivisibleHaveSign='true' or tpodbt:GoodsIndivisibleHaveSign='1'">
											<xsl:text>ДА</xsl:text>
										</xsl:when>
										<xsl:when test="tpodbt:GoodsIndivisibleHaveSign='false' or tpodbt:GoodsIndivisibleHaveSign='0'">
											<xsl:text>НЕТ</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="tpodbt:GoodsIndivisibleHaveSign"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время электронного документа (сведений)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates mode="russian_date_time" select="tpodbt:TPODateTime"/>
							</td>
						</tr>
					</table>
					<xsl:if test="tpodbt:Payer">
						<div class="title marg-top">Плательщик ТПО</div>
						<div>
							<xsl:apply-templates select="tpodbt:Payer">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="tpodbt:Goods">
						<div class="title marg-top">Описание товаров</div>
						<!--table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Порядковый номер товара</td>
									<td class="graphMain bordered">Наименование товара</td>
									<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
									<td class="graphMain bordered">Вес брутто товара, кг</td>
									<td class="graphMain bordered">Вес нетто товара, кг</td>
									<td class="graphMain bordered">Стоимость товара (услуги) в валюте платежа</td>
									<td class="graphMain bordered">Стоимость товара (услуги) в долларах США</td>
									<td class="graphMain bordered">Стоимость товара (услуги) в евро</td>
									<td class="graphMain bordered">Код страны происхождения по классификатору стран мира</td>
									<td class="graphMain bordered">Количество в дополнительной единице измерения</td>
									<td class="graphMain bordered">Сведения о платежах</td>
									<td class="graphMain bordered">Данные об автомобиле или ином транспортном средстве</td>
								</tr-->
								<!--xsl:for-each select="tpodbt:Goods"-->
									<xsl:apply-templates select="tpodbt:Goods">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								<!--/xsl:for-each-->
							<!--/tbody>
						</table-->
					</xsl:if>
					<xsl:if test="tpodbt:MPONotifNumber">
						<div class="title marg-top">Номер уведомления о направлении МПО</div>
						<div>
							<xsl:apply-templates select="tpodbt:MPONotifNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="tpodbt:MPONumber">
						<div class="title marg-top">Номер МПО</div>
						<div>
							<xsl:apply-templates select="tpodbt:MPONumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="tpodbt:CustomsPersonName">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<div>
							<xsl:apply-templates select="tpodbt:CustomsPersonName">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="tpodbt:PaymentCurrency">
						<div class="title marg-top">Валюта платежа</div>
						<div>
							<xsl:apply-templates select="tpodbt:PaymentCurrency">
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
					<td class="annot graphMain" style="width:50%">Код объекта</td>
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
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код</td>
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
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП</td>
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
	<!-- Шаблон для типа tpodbt:AutomobileInfoType -->
	<xsl:template match="tpodbt:AutomobileInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top">Данные об автомобие или ином ТС</div>
			<xsl:if test="tpodbt:ManufactureDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата производства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:ManufactureDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:ManufactureYear">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Год выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:ManufactureYear"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:ManufactureMonth">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Месяц выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:ManufactureMonth"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:EngineVolumeQuanity">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Объем двигателя, куб. см</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:EngineVolumeQuanity" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:EnginePower">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Мощность двигателя в лошадиных силах</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:EnginePower" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:EnginePowerKVt">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Мощность двигателя в КВт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:EnginePowerKVt" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:CRMoveDirectCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код направления перемещения: 1 – ввоз;
2 – вывоз;
3 – временный ввоз;
4 – обратный вывоз</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:CRMoveDirectCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:ExportDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата вывоза транспортного средства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:ExportDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="tpodbt:CommunicationDetails">
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
	<!-- Шаблон для типа tpodbt:CustomsPersonType -->
	<xsl:template match="tpodbt:CustomsPersonName">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
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
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<div class="title marg-top">Сведения о контактных реквизитах</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата подписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:SigningDate"/>
					</td>
				</tr>
			</table>
			<xsl:if test="tpodbt:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа tpodbt:GoodsType -->
	<xsl:template match="tpodbt:Goods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<br/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%; background-color:#bbb; font-weight: bold;">Товар</td>
					<td class="value graphMain" style="width:50%; background-color:#bbb; font-weight: bold;">
						<xsl:value-of select="position()"/>
					</td>
				</tr>
			</table>
			
			<xsl:if test="tpodbt:GoodsNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Порядковый номер товара</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:GoodsNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:GoodsDescription"/>
					</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код ТН ВЭД</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:GoodsTNVEDCode"/>
					</td>
				</tr>
			</table>
			
			<xsl:if test="tpodbt:GoodsGrossWeight">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вес брутто, кг</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:GoodsGrossWeight" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			
			<xsl:if test="tpodbt:GoodsNetWeight">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вес нетто, кг</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:GoodsNetWeight" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			
			<xsl:if test="tpodbt:Cost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Стоимость товара</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:Cost" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			
			<xsl:if test="tpodbt:DollarCost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Стоимость товара, долл.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:DollarCost" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			
			<xsl:if test="tpodbt:EuroCost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Стоимость товара, евро</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:EuroCost" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:OriginCountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код страны происхождения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:OriginCountryCode" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>

			<xsl:if test="tpodbt:SupplementaryQuantity">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество в ДЕИ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:SupplementaryQuantity">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</td>
					</tr>
				</table>
			</xsl:if>
			
			<xsl:if test="tpodbt:PaymentInfo">
				<xsl:apply-templates select="tpodbt:PaymentInfo">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:if>
					
			<xsl:if test="tpodbt:AutomobileInfo">
				<xsl:apply-templates select="tpodbt:AutomobileInfo">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="tpodbt:IdentityDoc">
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
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="tpodbt:MPONotifNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа tpodbt:MPORegNumType -->
	<xsl:template match="tpodbt:MPONumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="tpodbt:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:RegistrationDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:RegistrationDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:MPO_Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа tpodbt:PayerTPOType -->
	<xsl:template match="tpodbt:Payer">
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
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Признак физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="tpodbt:PersonIDIndicator='true' or tpodbt:PersonIDIndicator='1'">
								<xsl:text>ДА</xsl:text>
							</xsl:when>
							<xsl:when test="tpodbt:PersonIDIndicator='false' or tpodbt:PersonIDIndicator='0'">
								<xsl:text>НЕТ</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="tpodbt:PersonIDIndicator"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="tpodbt:FactPayerIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак фактического плательщика</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="tpodbt:FactPayerIndicator='true' or tpodbt:FactPayerIndicator='1'">
									<xsl:text>ДА</xsl:text>
								</xsl:when>
								<xsl:when test="tpodbt:FactPayerIndicator='false' or tpodbt:FactPayerIndicator='0'">
									<xsl:text>НЕТ</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="tpodbt:FactPayerIndicator"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:CommunicationDetails">
				<div class="title marg-top">Контактный реквизит с указанием способа и идентификатора средства (канала) связи.</div>
				<div>
					<xsl:apply-templates select="tpodbt:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="tpodbt:TPOAddress">
				<div class="title marg-top">Адрес</div>
				<div>
					<xsl:apply-templates select="tpodbt:TPOAddress">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="tpodbt:IdentityDoc">
				<div class="title marg-top">Удостоверение личности</div>
				<div>
					<xsl:apply-templates select="tpodbt:IdentityDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа tpodbt:PaymentCurrencyType -->
	<xsl:template match="tpodbt:PaymentCurrency">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование валюты платежа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:CurrencyName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код валюты платежа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:CurrencyA3Code"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Цифровой код валюты платежа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:CurrencyN3Code"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Курс доллара США к валюте государства - члена ТС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:CurrencyDollarRate" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Курс евро к валюте государства - члена ТС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:CurrencyEuroRate" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="tpodbt:CurrencyRate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Курс валюты платежа к валюте государства - члена ТС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:CurrencyRate" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:CurrencyScale">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Масштаб (в виде показателя степени числа 10)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:CurrencyScale"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата применения курса валюты</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:TPODateTime"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа tpodbt:PaymentInfoType -->
	<xsl:template match="tpodbt:PaymentInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top">Детальные сведения о платеже</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Код вида платежа в соответствии с Классификатором видов таможенных и иных платежей</td>
						<td class="graphMain bordered">Наименование платежа</td>
						<td class="graphMain bordered">Основа начисления</td>
						<td class="graphMain bordered">Код единицы основы начисления платежа (специфическая ставка)</td>
						<td class="graphMain bordered">Цифровой код валюты основы начисления (адвалорная ставка)</td>
						<td class="graphMain bordered">Сведения о ставке платежа, используемой при расчете</td>
						<td class="graphMain bordered">Весовой коэффициент</td>
						<td class="graphMain bordered">Дата применения ставки</td>
						<td class="graphMain bordered">Исчисленная сумма</td>
						<td class="graphMain bordered">Код валюты</td>
					</tr>
					<xsl:for-each select="tpodbt:PaymentInfoDetails">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="tpodbt:TotalAmount">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Итоговая сумма</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:TotalAmount" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:TACurrencyCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код валюты</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:TACurrencyCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа tpodbt:PaymentInfoDetailsType -->
	<xsl:template match="tpodbt:PaymentInfoDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:PaymentModeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:PaymentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:TaxBase" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:TaxBaseQualifierCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:UnifiedCurrencyN3Code"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:RateDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:WeightRatioNumber" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:DutyTaxFreeRateDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:CAPaymentAmount" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="tpodbt:CACurrencyCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа tpodbt:RateDetailsType -->
	<xsl:template match="tpodbt:RateDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<xsl:if test="tpodbt:DutyTaxFeeRateKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вид ставки</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:DutyTaxFeeRateKindCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Значение ставки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="tpodbt:DutyTaxFeeRateValue" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="tpodbt:UnifiedMeasurementUnitCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ЕИ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:UnifiedMeasurementUnitCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:UnifiedCurrencyN3Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код валюты</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:UnifiedCurrencyN3Code"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="tpodbt:RateQualifierCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ЕИ ставки</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="tpodbt:RateQualifierCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="tpodbt:SupplementaryQuantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->

				<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
				<xsl:text> </xsl:text>
				<xsl:if test="cat_ru:MeasureUnitQualifierCode">
					<xsl:text>(</xsl:text>
					<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
		<!--/tr-->
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="tpodbt:TPOAddress">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:AddressKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида адреса</td>
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
						<td class="annot graphMain" style="width:50%">Буквенный код страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регион</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район</td>
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
						<td class="annot graphMain" style="width:50%">Улица</td>
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
						<td class="annot graphMain" style="width:50%">Набор элементов адреса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AddressText"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКТМО</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKTMO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКАТО</td>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='TPO_Debt']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
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
