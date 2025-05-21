<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0"
	xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0"
	xmlns:epa="urn:customs.ru:Information:ELSDocuments:ExcisePaymentApplication:5.22.0"
	xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:param name="NsiValues"/>
	<!-- Шаблон для типа ExcisePaymentApplicationType -->
	<!--<xsl:include href="SumInWords.xslt"/>-->
	<xsl:template match="epa:ExcisePaymentApplication">
		<xsl:param name="w" select="277"/>
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
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
					font-size: 9pt;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
					font-size: 8pt;
					text-align: center;
					vertical-align: top;
					}
					.descrLeft{
					font-size: 8pt;
					text-align: left;
					vertical-align: top;
					}
					.borderbottom{
						border-bottom: 1px solid black;
					}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<div class="title" align="center">
						Заявление об уплате акциза по маркированным товарам Евразийского экономического союза,<br/>ввозимым на территорию Российской Федерации с территории государства - члена Таможенного союза
					</div>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="50%"></td>
								<td width="50%">
									Регистрационнай номер<br/>
									<span class="descrLeft">(заполняется таможенным органом на каждом листе заявления)</span><br/>
									<span class="borderbottom" style="display: inline-block; width: 30mm;"></span>
									<xsl:text>/</xsl:text>
									<span class="borderbottom" style="display: inline-block; width: 30mm;"></span>
									<xsl:text>/</xsl:text>
									<span class="borderbottom" style="display: inline-block; width: 30mm;"></span><br/>
									<span class="descrLeft">(восьмизначный цифровой код таможенного органа, зарегистрировавшего заявление/ число, месяц, две последние цифры года оформления заявления/семизначный порядковый номер заявления, с начала каждого года, начиная с единицы)</span>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="title">РАЗДЕЛ 1 </td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top">
								<td width="49%">
								</td>
								<td width="2%"/>
								<td width="49%">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									Налогоплательщик
								</td>
							</tr>
							<tr>
								<td colspan="3" class="borderbottom">
									<xsl:apply-templates select="epa:Supplier/cat_ru:OrganizationName"/>
									<xsl:if test="not(epa:Supplier/cat_ru:OrganizationName)">
										<xsl:apply-templates select="epa:Supplier/cat_ru:ShortName"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="descrLeft">(полное наименование организации, фамилия, имя, отчество (при наличии) индивидуального предпринимателя – лица, приобретающего товары и предоставляющего заявление в таможенный орган)</td>
							</tr>
							<tr>
								<td class="borderbottom">
									<xsl:for-each select="epa:Supplier/cat_ru:RFOrganizationFeatures">
										<xsl:apply-templates select="cat_ru:INN"/>
										<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
										<xsl:apply-templates select="cat_ru:KPP"/>
									</xsl:for-each>
								</td>
								<td></td>
								<td class="borderbottom">
									<xsl:apply-templates select="epa:Supplier" mode="address"/>
								</td>
							</tr>
							<tr>
								<td class="descrLeft">ИНН/КПП (идентификационный номер налогоплательщика/код причины постановки на учет)</td>
								<td></td>
								<td class="descrLeft">(место нахождения налогоплательщика и адрес в пределах места нахождения (места жительства)<br/><br/></td>
							</tr>
							<tr>
								<td class="borderbottom">
									Номер договора (контракта)
									<xsl:apply-templates select="epa:ContractDocument/cat_ru:PrDocumentNumber"/>
								</td>
								<td></td>
								<td class="borderbottom">
									Дата договора (контракта) 
									<xsl:apply-templates select="epa:ContractDocument/cat_ru:PrDocumentDate" mode="russian_date_month"/>
								</td>
							</tr>
							<tr>
								<td class="descrLeft">(номер договора (контракта), на основании которого налогоплательщиком приобретены маркированные товары Евразийского экономического союза, ввезенные на территорию Российской Федерации с территории другого государства – члена Евразийского экономического союза)</td>
								<td></td>
								<td class="descrLeft">(дата договора (контракта), на основании которого налогоплательщиком приобретены маркированные товары Евразийского экономического союза, ввезенные на территорию Российской Федерации с территории другого государства – члена Евразийского экономического союза)</td>
							</tr>
							<tr>
								<td colspan="3">
									<br/>
									Контрагент
								</td>
							</tr>
							<tr>
								<td colspan="3" class="borderbottom">
									<xsl:apply-templates select="epa:Buyer/cat_ru:OrganizationName"/>
									<xsl:if test="not(epa:Buyer/cat_ru:OrganizationName)">
										<xsl:apply-templates select="epa:Buyer/cat_ru:ShortName"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="descrLeft">(полное наименование организации, фамилия, имя, отчество (при наличии) индивидуального предпринимателя – лица, заключившего договор (контракт) с налогоплательщиком, или с комиссионером, поверенным либо агентом, действующим в интересах налогоплательщика)</td>
							</tr>
							<tr>
								<td colspan="3" class="borderbottom">
									<br/>
									<xsl:for-each select="epa:Buyer/cat_ru:RFOrganizationFeatures">
										<xsl:apply-templates select="cat_ru:INN"/>
										<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
										<xsl:apply-templates select="cat_ru:KPP"/>
									</xsl:for-each>
									<xsl:for-each select="epa:Buyer/cat_ru:RBOrganizationFeatures">
										<xsl:apply-templates select="cat_ru:UNP"/>
									</xsl:for-each>
									<xsl:for-each select="epa:Buyer/cat_ru:RAOrganizationFeatures">
										<xsl:apply-templates select="cat_ru:UNN"/>
									</xsl:for-each>
									<xsl:for-each select="epa:Buyer/cat_ru:RKOrganizationFeatures">
										<xsl:choose>
											<xsl:when test="cat_ru:BIN">
												<xsl:apply-templates select="cat_ru:BIN"/>
											</xsl:when>
											<xsl:when test="cat_ru:IIN">
												<xsl:apply-templates select="cat_ru:IIN"/>
											</xsl:when>
											<xsl:when test="cat_ru:ITN/cat_ru:RNN">
												<xsl:apply-templates select="cat_ru:ITN/cat_ru:RNN"/>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
									<xsl:for-each select="cat_ru:KGOrganizationFeatures">
										<xsl:apply-templates select="cat_ru:KGINN"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="descrLeft">УНП (учетный номер плательщика) – для налогоплательщиков Республики Беларусь; УНН (учетный номер налогоплательщика) – для налогоплательщиков в Республике Армения; РНН (регистрационный номер налогоплательщика) либо БИН (бизнес-идентификационный номер) либо ИИН (индивидуальный идентификационный номер) – для налогоплательщиков Республики Казахстан; ИНН (идентификационный налоговый номер налогоплательщика) либо ПИН (персональный идентификационный номер) – для налогоплательщиков Киргизской Республики; ИНН/КПП (идентификационный номер налогоплательщика/код причины постановки на учет – для налогоплательщиков в Российской Федерации)</td>
							</tr>
							<tr>
								<td colspan="3" class="borderbottom">
									<br/>
									<xsl:apply-templates select="epa:Buyer/RUScat_ru:CountryA2Code"/>
									<xsl:if test="epa:Buyer/RUScat_ru:CountryA2Code and epa:Buyer/*[contains(local-name(), 'Address')]">, </xsl:if>
									<xsl:apply-templates select="epa:Buyer" mode="address"/>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="descrLeft">(код страны контрагента в соответствии с Классификатором стран мира, утвержденным Решением Комиссии Таможенного союза от 20 сентября 2010 г. № 378 «О классификаторах, используемых для заполнения таможенных документов» (далее соответственно – Классификатор стран мира, Решение № 378), место нахождения и адрес в пределах места нахождения (места жительства)</td>
							</tr>
							<tr>
								<td colspan="3">
									<br/>
									Производитель товара
								</td>
							</tr>
							<tr>
								<td colspan="3" class="borderbottom">
									<xsl:apply-templates select="epa:Producer/epa:ProducerName"/>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="descrLeft">(полное наименование организации, фамилия, имя, отчество (при наличии) индивидуального предпринимателя – производителя товара)</td>
							</tr>
							<tr>
								<td colspan="3" class="borderbottom">
									<br/>
									<xsl:apply-templates select="epa:Producer/epa:CountryCode"/>
									<xsl:text>, </xsl:text>
									<xsl:apply-templates select="epa:Producer" mode="address"/>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="descrLeft">(код страны производителя товара в соответствии с Классификатором стран мира, место нахождения и адрес в пределах места нахождения (места жительства)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td colspan="12" align="center">Подраздел 1.1. Сведения о маркированном товаре Евразийского экономического союза, ввозимом на территорию Российской Федерации<br/>с территории государства – члена Евразийского экономического союза</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п</td>
								<td class="bordered" rowspan="2">Наименование товара на основании счета-фактуры или транспортных (товаросопроводи-тельных) документов</td>
								<td class="bordered" rowspan="2">Код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза</td>
								<td class="bordered" rowspan="2">Количество товара в натуральном выражении (литрах, килограммах, 1000 штук, штуках) на основании сведений из счета-фактуры или транспортных (товаросопроводительных) документов</td>
								<td class="bordered" colspan="2">Транспортный (товаросопрово-дительный) документ</td>
								<td class="bordered" colspan="2">Счет-фактура</td>
								<td class="bordered" colspan="2">Стоимость товара на основании сведений из счета-фактуры или транспортных (товаросопроводительных) документов</td>
								<td class="bordered" colspan="2">Валюта, указанная в счете-фактуре или транспортном (товаросопроводительном) документе</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">серия, номер</td>
								<td class="bordered">дата</td>
								<td class="bordered">номер</td>
								<td class="bordered">дата</td>
								<td class="bordered">в рублях</td>
								<td class="bordered">в валюте договора (контракта)</td>
								<td class="bordered">код валюты, в соответствии с Классификатором валют, утвержденным Решением № 378</td>
								<td class="bordered">установленный Банком России курс рубля к валюте на дату принятия заявления</td>
								
								
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
								<td class="bordered">8</td>
								<td class="bordered">9</td>
								<td class="bordered">10</td>
								<td class="bordered">11</td>
								<td class="bordered">12</td>
							</tr>
							<xsl:for-each select="epa:GoodsInfo">
								<tr valign="top">
									<td class="bordered">
										<xsl:apply-templates select="epa:GoodsNumeric"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:GoodsDescription"/>
										<xsl:if test="epa:SeasonalMultiplier">
											<br/>
											<xsl:text>Применен сезонный коэффициент </xsl:text>
											<xsl:apply-templates select="epa:SeasonalMultiplier"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:GoodsTNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="epa:GoodsMeasureDetails">
											<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:TransDocument/cat_ru:PrDocumentNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:TransDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoiceDocument/cat_ru:PrDocumentNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoiceDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoicedCost"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoicedCostCur"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:CurCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:CurRate"/>
									</td>
								</tr>
							</xsl:for-each>
							<tr valign="top">
									<td class="bordered" colspan="2" align="center">
										ИТОГО: 
									</td>
									<td class="bordered" align="center">
										X
									</td>
									<td class="bordered">
										<xsl:value-of select="sum(epa:GoodsInfo/epa:GoodsExciseMeasureDetails/cat_ru:GoodsQuantity)"/>
									</td>
									<td class="bordered" align="center">
										X
									</td>
									<td class="bordered" align="center">
										X
									</td>
									<td class="bordered" align="center">
										X
									</td>
									<td class="bordered" align="center">
										X
									</td>
									<td class="bordered">
										<xsl:value-of select="sum(epa:GoodsInfo/epa:InvoicedCost)"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="sum(epa:GoodsInfo/epa:InvoicedCostCur)"/>
									</td>
									<td class="bordered" align="center">
										X
									</td>
									<td class="bordered" align="center">
										X
									</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td colspan="7" align="center">Подраздел 1.2. Сведения об акцизных марках, федеральных специальных марках, средствах идентификации, нанесенных на товар<br/>Евразийского экономического союза, ввозимый на территорию Российской Федерации<br/>с территории государства – члена Евразийского экономического союза</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п (указывается порядковый номер, соответст-вующий нумерации подраздела 1.1)</td>
								<td class="bordered" colspan="3">Серии и номера акцизных марок и (или) федеральных специальных марок либо реквизиты разрешительного документа в случае отсутствия акцизных или федеральных специальных марок (заполняется в отношении товаров, подлежащих маркировке акцизными или федеральными специальными марками)</td>
								<td class="bordered" colspan="3">Средства идентификации, нанесенные на товар (заполняется в отношении товаров, подлежащих обязательной маркировке средствами идентификации)</td>
							</tr>
							<tr align="center" valign="top"> 
								<td class="bordered">серии акцизных или федеральных специальных марок</td>
								<td class="bordered">номера федеральных специальных марок, указанные через запятую, а в отношении номеров, следующих подряд – с указанием первого и последнего номера соответствующего диапазона через знак разделителя «–»</td>
								<td class="bordered">количество акцизных или федеральных специальных марок</td>
								<td class="bordered">общее количество кодов идентификации, содержащихся в средствах идентификации, нанесенных на каждую единицу товара, или на потребительскую упаковку (а в случае ее отсутствия - на первичную упаковку), или на материальный носитель</td>
								<td class="bordered">кодовое обозначение уровня маркировки («0» – средство идентификации нанесено на товар или на потребительскую упаковку (а в случае ее отсутствия – на первичную упаковку), или на материальный носитель (далее – коды идентификации товаров), «1» – средство идентификации нанесено на групповую упаковку (далее – коды идентификации групповой упаковки), «2» – код идентификации нанесен на транспортную упаковку (далее – коды идентификации транспортной упаковки)</td>
								<td class="bordered">коды идентификации товаров или коды идентификации групповой упаковки, или коды идентификации транспортной упаковки (с сохранением регистра букв, содержащихся в таких кодах), указанные через запятую, а в отношении кодов, следующих подряд – с указанием первого и последнего номера соответствующего диапазона через знак разделителя «–»</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
							</tr>
							<xsl:for-each select="epa:GoodsInfo">
								<xsl:variable name="IssueStampCount" select="count(epa:IssueStampInfo)"/>
								<xsl:for-each select="epa:IssueStampInfo">
									<tr valign="top">
										<xsl:if test="position() = 1">
											<td rowspan="{$IssueStampCount}" class="bordered" align="center">
												<xsl:apply-templates select="../epa:GoodsNumeric"/>
											</td>
										</xsl:if>
										<td class="bordered">
											<xsl:apply-templates select="catESAD_cu:ExciseSerieses"/>
										</td>
										<td class="bordered">
											<xsl:for-each select="catESAD_cu:ExciseList/catESAD_cu:ExciseNumber">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:if test="catESAD_cu:ExciseList and catESAD_cu:ExciseRange">, </xsl:if>
											<xsl:for-each select="catESAD_cu:ExciseRange">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="catESAD_cu:ExciseFirstNumber"/>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="catESAD_cu:ExciseLastNumber"/>
											</xsl:for-each>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="catESAD_cu:ExciseQuantity"/>
										</td>
										<td class="bordered"></td>
										<td class="bordered"></td>
										<td class="bordered"></td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="IdentificationMeansCount" select="count(epa:IdentificationMeansDetails)"/>
								<xsl:for-each select="epa:IdentificationMeansDetails">
									<tr>
										<xsl:if test="position() = 1">
											<td rowspan="{$IssueStampCount}" class="bordered">
												<xsl:apply-templates select="../epa:GoodsNumeric"/>
											</td>
										</xsl:if>
										
										<td class="bordered"></td>
										<td class="bordered"></td>
										<td class="bordered"></td>
										<td class="bordered">
											<xsl:apply-templates select="epa:CIMQuantity"/>
										</td>
										<td class="bordered">
											<xsl:for-each select="epa:IdentificationMeansDetails/catESAD_cu:AggregationKindCode">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered">
											<!-- -->
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
							<tr valign="top" align="center">
								<td class="bordered">ИТОГО:</td>
								<td class="bordered">Х</td>
								<td class="bordered">Х</td>
								<td class="bordered"><xsl:value-of select="sum(epa:GoodsInfo/epa:IssueStampInfo/catESAD_cu:ExciseQuantity)"/></td>
								<td class="bordered"><xsl:value-of select="sum(epa:GoodsInfo/epa:IdentificationMeansDetails/epa:CIMQuantity)"/></td>
								<td class="bordered">Х</td>
								<td class="bordered">Х</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td colspan="9" align="center">Подраздел 1.3. Сведения о сумме исчисленного акциза в отношении маркированного товара Евразийского экономического союза, ввозимого на территорию Российской Федерации с территории государства – члена Евразийского экономического союза</td>
							</tr>
							<tr align="center" valign="top"> 
								<td class="bordered">№ п/п (указывается порядковый номер, соответст-вующий нумерации подразделов 1.1 и 1.2)</td>
								<td class="bordered">Дата принятия товара на учет</td>
								<td class="bordered">Количество товара в единицах, используемых для расчета акциза (в литрах 100% спирта, литрах, миллилитрах, килограммах, 1000 штук, штуках)</td>
								<td class="bordered">Наименование единицы измерения количества товара для целей применения ставки акциза</td>
								<td class="bordered">Налоговая база для исчисления, определенная в соответствии с Налоговым кодексом Российской Федерации (далее – НК РФ)</td>
								<td class="bordered">Ставка акциза в соответствии с НК РФ</td>
								<td class="bordered">Сумма акциза, исчисленная налогоплательщиком по налоговым ставкам, установленным НК РФ (графа 5*графа 6), руб.</td>
								<td class="bordered">Значение коэффициента T<sub>в</sub>, рассчитанного, в порядке и случаях, установленных пунктом 10 статьи 194 НК РФ, в единицах, указанных в графе 4</td>
								<td class="bordered">Сумма акциза к уплате, исчисленная налогоплательщиком по налоговым ставкам, установленным НК РФ, с применением коэффициента T<sub>в</sub>, указанного в графе 8 (графа 7 * графа 8), руб.</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
								<td class="bordered">8</td>
								<td class="bordered">9</td>
							</tr>
							<xsl:for-each select="epa:GoodsInfo">
								<tr valign="top">
									<td class="bordered"><xsl:apply-templates select="epa:GoodsNumeric"/></td>
									<td class="bordered"><xsl:apply-templates select="epa:GoodsAccDate" mode="russian_date"/></td>
									<td class="bordered"><xsl:apply-templates select="epa:GoodsExciseMeasureDetails/cat_ru:GoodsQuantity"/></td>
									<td class="bordered"><xsl:apply-templates select="epa:GoodsExciseMeasureDetails/cat_ru:MeasureUnitQualifierName"/></td>
									<td class="bordered"><xsl:apply-templates select="epa:TaxBase"/></td>
									<td class="bordered"><xsl:apply-templates select="epa:ExciseRate"/></td>
									<td class="bordered"><xsl:apply-templates select="epa:ExciseSum"/></td>
									<td class="bordered"><xsl:apply-templates select="epa:SeasonalMultiplier"/></td>
									<td class="bordered"><xsl:apply-templates select="epa:PayableExciseSum"/></td>
								</tr>
							</xsl:for-each>
							<tr align="center" valign="top">
								<td class="bordered" colspan="2"></td>
								<td class="bordered">Х</td>
								<td class="bordered">Х</td>
								<td class="bordered"><xsl:value-of select="sum(epa:GoodsInfo/epa:TaxBase)"/></td>
								<td class="bordered">Х</td>
								<td class="bordered"><xsl:value-of select="sum(epa:GoodsInfo/epa:ExciseSum)"/></td>
								<td class="bordered">Х</td>
								<td class="bordered"><xsl:value-of select="sum(epa:GoodsInfo/epa:PayableExciseSum)"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td colspan="2">Прошу использовать в счет уплаты акциза в отношении маркированного(ых) товара(ов) Евразийского экономического союза, ввозимого(ых) на территорию Российской Федерации с территории государства – члена Евразийского экономического союза, в сумме</td>
							</tr>
							<tr align="center">
								<xsl:variable name="splittedSum" select="translate(epa:PaymentDocument/epa:AmountDeposited, '.', ',')"/>
								<td width="30%">
									<div style="display:inline-block;width: 50mm; height:4mm; border-bottom: 1px solid black;">
										<xsl:value-of select="substring-before($splittedSum, ',')"/>
									</div>
									<xsl:text> руб. </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border-bottom: 1px solid black;">
										<xsl:value-of select="substring-after($splittedSum, ',')"/>
									</div>
									<xsl:text> коп.</xsl:text>
								</td>
								<td width="70%" style="border-bottom: 1px solid black;">
									<xsl:if test="epa:PaymentDocument/epa:AmountDepositedText">
									<xsl:text>(</xsl:text>
									<xsl:apply-templates select="epa:PaymentDocument/epa:AmountDepositedText"/>
									<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">(сумма цифрами) </td>
								<td class="descr">(сумма прописью)</td>
							</tr>
							<tr>
								<td colspan="2">денежные средства, перечисленные на счет Федерального казначейства, и отраженные на лицевом счете.</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td colspan="6">Достоверность и полноту сведений, приведенных в данном заявлении, подтверждаю:</td>
							</tr>
							<tr align="center">
								<td width="40%" style="border-bottom:1px solid black;">
									<xsl:for-each select="epa:DirSignature">
										<xsl:apply-templates select="cat_ru:PersonPost"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
									</xsl:for-each>
								</td>
								<td width="5%"/>
								<td width="15%" style="border-bottom:1px solid black;">
									<br/>
								</td>
								<td width="5%"/>
								<td width="15%" style="border-bottom:1px solid black;">
									<xsl:apply-templates select="epa:DirSignature/cat_ru:IssueDate" mode="russian_date"/>
								</td>
								<td width="10" class="title" align="center" valign="middle" rowspan="4">М.П.</td>
							</tr>
							<tr>
								<td class="descr">(должность, фамилия, имя, отчество (при наличии) руководителя организации (уполномоченного лица) – налогоплательщика или индивидуального предпринимателя – налогоплательщика)</td>
								<td/>
								<td class="descr">(подпись)</td>
								<td/>
								<td class="descr">(дата)</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td width="50%" class="title">РАЗДЕЛ 2</td>
								<td width="50%" align="right">
									<xsl:text>Страница </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></div>
									<xsl:text> из </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></div>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr valign="top">
								<td class="bordered" width="50%">
									<xsl:text>Отметка о регистрации заявления при предоставлении в таможенный орган</xsl:text>
									<br/>
									<br/>
									<xsl:text>Регистрационный номер заявления </xsl:text>
									<!--div style="display:inline-block; width:30mm; border-bottom: 1px solid black;"-->
										<xsl:apply-templates select="epa:AppExcisePaymentDocReg/epa:AppExcisePaymentDocReg|epa:AppExcisePaymentDocReg/epa:AppExcisePaymentDocRegFree/cat_ru:PrDocumentNumber"/>
									<!--/div-->
									<hr size="1"/>
									<div class="descr">(восьмизначный цифровой код таможенного органа, зарегистрировавшего заявление/ число, месяц, две последние цифры года оформления заявления/семизначный порядковый номер заявления, с начала каждого года, начиная с единицы)</div>
								</td>
								<td class="bordered" width="50%">
									<xsl:text>Отметка таможенного органа об уплате акциза</xsl:text>
									<br/>
									<br/>

									<xsl:variable name="splittedSum">
										<xsl:value-of select="translate(sum(epa:GoodsInfo/epa:ExciseSum),'.',',')"/>
									</xsl:variable>

									<xsl:text>Акцизы в сумме </xsl:text>
									<div style="display:inline-block;width: 50mm; height:4mm; border-bottom: 1px solid black;">
										<xsl:value-of select="substring-before($splittedSum, ',')"/>
									</div>
									<xsl:text> рублей </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border-bottom: 1px solid black;">
										<xsl:value-of select="substring-after($splittedSum, ',')"/>
									</div>
									<xsl:text> копеек</xsl:text>
									<table>
										<tbody>
											<tr>
												<td width="90%" style="border-bottom: 1px solid black;">

													<xsl:variable name="integerPart">
														<xsl:choose>
															<xsl:when test="substring-before($splittedSum,',')!=''">
																<xsl:value-of select="substring-before($splittedSum,',')"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="$splittedSum"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:variable>
													<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
													<xsl:choose>
														<xsl:when test="$integerPart!='0'">
															<xsl:call-template name="num-to-word">
																<xsl:with-param name="value" select="$integerPart"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>0</xsl:otherwise>
													</xsl:choose>
													<xsl:text> руб. </xsl:text>
													<xsl:if test="$fractionalPart!=''">
														<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
														<xsl:text> коп.</xsl:text>
													</xsl:if>
												</td>
												<td> уплачен</td>
											</tr>
											<tr>
												<td class="descr">(указывается сумма акциза прописью)</td>
												<td></td>
											</tr>
										</tbody>
									</table>
									<br/>
									<xsl:text>№ ТПО </xsl:text>
									<div style="display:inline-block;width: 50mm; height:4mm; border-bottom: 1px solid black;">
										
									</div>
									<br/>
									<br/>
									<table>
										<tbody>
											<tr>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
											</tr>
											<tr>
												<td class="descr">
													<xsl:text>(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text> (подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(дата)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<!--br/>
									<table>
										<tbody>
											<tr>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
											</tr>
											<tr>
												<td class="descr">
													<xsl:text>(начальник (заместитель начальника) таможенного органа)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text> (подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(дата)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table-->
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="epa:AppExcisePaymentDocReg">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template match="epa:ExciseRate">
		<xsl:apply-templates select="epa:DutyTaxFeeRateValue"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="not(epa:RateTypeCode)">RUB</xsl:when>
			<xsl:when test="epa:RateTypeCode = '%'">%</xsl:when>
			<xsl:when test="epa:RateTypeCode = '*'">
				<xsl:choose>
					<xsl:when test="epa:RateCurrencyCode">
						<xsl:apply-templates select="epa:RateCurrencyCode" mode="currency"/>
					</xsl:when>
					<xsl:otherwise> RUB</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="epa:RateTNVEDQualifierCode">
					<xsl:text> за </xsl:text>
					<xsl:value-of select="epa:WeightingFactor"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="epa:RateTNVEDQualifierCode" mode="qualCode"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="epa:Rate3">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="epa:OperationsSign"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="epa:Rate3"/>
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="not(epa:RateTypeCode3)">RUB</xsl:when>
				<xsl:when test="epa:RateTypeCode3 = '%'">%</xsl:when>
				<xsl:when test="epa:RateTypeCode3 = '*'">
					<xsl:choose>
						<xsl:when test="epa:RateCurrencyCode3">
							<xsl:apply-templates select="epa:RateCurrencyCode3" mode="currency"/>
						</xsl:when>
						<xsl:otherwise> RUB</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="epa:RateTNVEDQualifierCode3">
						<xsl:text> за </xsl:text>
						<xsl:value-of select="epa:WeightingFactor3"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="epa:RateTNVEDQualifierCode3" mode="qualCode"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="epa:Rate2">
			<xsl:choose>
				<xsl:when test="epa:ComparisonOperationsSign='1' or not(epa:ComparisonOperationsSign)">, но не менее </xsl:when>
				<xsl:when test="epa:ComparisonOperationsSign='2'">, но не более </xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="epa:ComparisonOperationsSign"/>
					<xsl:text> </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="epa:Rate2"/>
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="not(epa:RateTypeCode2)">RUB</xsl:when>
				<xsl:when test="epa:RateTypeCode2 = '%'">%</xsl:when>
				<xsl:when test="epa:RateTypeCode2 = '*'">
					<xsl:choose>
						<xsl:when test="epa:RateCurrencyCode2">
							<xsl:apply-templates select="epa:RateCurrencyCode2" mode="currency"/>
						</xsl:when>
						<xsl:otherwise> RUB</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="epa:RateTNVEDQualifierCode2">
						<xsl:text> за </xsl:text>
						<xsl:value-of select="epa:WeightingFactor2"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="epa:RateTNVEDQualifierCode2" mode="qualCode"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="currency">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:variable name="val" select="."/>
			<xsl:choose>
				<xsl:when test="$NsiValues">
					<xsl:value-of select="$NsiValues/VALNAME[@KOD = $val]/@BUK"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="string($val)='643'">RUB</xsl:when>
						<xsl:when test="string($val)='978'">EUR</xsl:when>
						<xsl:when test="string($val)='840'">USD</xsl:when>
						<xsl:otherwise>
							<xsl:text> (код: </xsl:text>
							<xsl:value-of select="."/>
							<xsl:text>) </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>

	<xsl:template match="*" mode="qualCode">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>

		<element xml_node="{$xpath_date}">
			<xsl:variable name="val" select="."/>
			<xsl:choose>
				<xsl:when test="$NsiValues">
					<xsl:value-of select="$NsiValues/EDIZM[@KOD = $val]/@KRNAIM"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test=".='006'"> МЕТР</xsl:when>
						<xsl:when test=".='055'"> КВАДРАТНЫЙ МЕТР</xsl:when>
						<xsl:when test=".='111'"> КУБИЧЕСКИЙ САНТИМЕТР</xsl:when>
						<xsl:when test=".='112'"> ЛИТР</xsl:when>
						<xsl:when test=".='113'"> КУБИЧЕСКИЙ МЕТР</xsl:when>
						<xsl:when test=".='114'"> 1000 КУБИЧЕСКИХ МЕТРОВ</xsl:when>
						<xsl:when test=".='117'"> ТОННУ ПОЛНОЙ МАССЫ</xsl:when>
						<xsl:when test=".='118'"> КУБИЧЕСКИЙ МЕТР ПОЛНОГО ОБЪЕМА КУЗОВА</xsl:when>
						<xsl:when test=".='130'"> 1000 ЛИТРОВ</xsl:when>
						<xsl:when test=".='162'"> МЕТРИЧЕСКИЙ КАРАТ</xsl:when>
						<xsl:when test=".='163'"> ГРАММ</xsl:when>
						<xsl:when test=".='166'"> КИЛОГРАММ</xsl:when>
						<xsl:when test=".='168'"> ТОННУ ВЕСА НЕТТО</xsl:when>
						<xsl:when test=".='185'"> ГРУЗОПОДЪЕМНОСТЬ В ТОННАХ</xsl:when>
						<xsl:when test=".='214'"> КИЛОВАТТ</xsl:when>
						<xsl:when test=".='246'"> 1000 КИЛОВАТТ В ЧАС</xsl:when>
						<xsl:when test=".='251'"> ЛОШАДИНУЮ СИЛУ</xsl:when>
						<xsl:when test=".='305'"> КЮРИ</xsl:when>
						<xsl:when test=".='306'"> ГРАММ ДЕЛЯЩИХСЯ ИЗОТОПОВ</xsl:when>
						<xsl:when test=".='715'"> ПАРУ</xsl:when>
						<xsl:when test=".='796'"> ШТУКУ</xsl:when>
						<xsl:when test=".='797'"> СТО ШТУК</xsl:when>
						<xsl:when test=".='798'"> ТЫСЯЧУ ШТУК</xsl:when>
						<xsl:when test=".='831'"> ЛИТР ЧИСТОГО (100%) СПИРТА</xsl:when>
						<xsl:when test=".='841'"> КИЛОГРАММ ПЕРОКСИДА ВОДОРОДА</xsl:when>
						<xsl:when test=".='845'"> КИЛОГРАММ СУХОГО НА 90% ВЕЩЕСТВА</xsl:when>
						<xsl:when test=".='852'"> КИЛОГРАММ ОКСИДА КАЛИЯ</xsl:when>
						<xsl:when test=".='859'"> КИЛОГРАММ ГИДРОКСИДА КАЛИЯ</xsl:when>
						<xsl:when test=".='861'"> КИЛОГРАММ АЗОТА</xsl:when>
						<xsl:when test=".='863'"> КИЛОГРАММ ГИДРОКСИДА НАТРИЯ</xsl:when>
						<xsl:when test=".='865'"> КИЛОГРАММ ПЯТИОКСИДА ФОСФОРА</xsl:when>
						<xsl:when test=".='867'"> КИЛОГРАММ УРАНА</xsl:when>
						<xsl:otherwise>
							<xsl:text> (код ед.изм.: </xsl:text>
							<xsl:value-of select="."/>
							<xsl:text>)</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>

	<xsl:template match="epa:BankAccInfo">
		<xsl:apply-templates select="cat_ru:BankName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:BankAccount">
			<xsl:text>Номер счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccount">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankAccountDescription">
			<xsl:text> Описание: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccountDescription">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<xsl:text> БИК </xsl:text>
			<xsl:apply-templates select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<xsl:text> SWIFT </xsl:text>
			<xsl:apply-templates select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<xsl:text> Корр.счет </xsl:text>
			<xsl:apply-templates select="cat_ru:CorrAccount"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="address">
		<xsl:for-each select="*[contains(local-name(),'Address')]/*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="*" mode="orgName">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
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
	
	<xsl:template name="num_date">
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
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:variable name="month_number" select="substring($dateIn,6,2)"/>
				<xsl:variable name="month_name">
					<xsl:choose>
						<xsl:when test="$month_number = '01'">января</xsl:when>
						<xsl:when test="$month_number = '02'">февраля</xsl:when>
						<xsl:when test="$month_number = '03'">марта</xsl:when>
						<xsl:when test="$month_number = '04'">апреля</xsl:when>
						<xsl:when test="$month_number = '05'">мая</xsl:when>
						<xsl:when test="$month_number = '06'">июня</xsl:when>
						<xsl:when test="$month_number = '07'">июля</xsl:when>
						<xsl:when test="$month_number = '08'">августа</xsl:when>
						<xsl:when test="$month_number = '09'">сентября</xsl:when>
						<xsl:when test="$month_number = '10'">октября</xsl:when>
						<xsl:when test="$month_number = '11'">ноября</xsl:when>
						<xsl:when test="$month_number = '12'">декабря</xsl:when>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:text>"</xsl:text>
					<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:value-of select="$month_name"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ExcisePaymentApplication']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_month">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_month">
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

	<xsl:template name="num-to-word">
		<xsl:param name="value"/>
		<xsl:param name="sex" select="'m'"/>
		<xsl:variable name="power" select="0"/>

		<xsl:variable name="value2">
			<xsl:value-of select="translate($value,',','.')"/>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="floor($value2) > 0">
				<xsl:call-template name="float2speech">
					<xsl:with-param name="value" select="floor($value2)"/>
					<xsl:with-param name="sex" select="m"/>
					<xsl:with-param name="power" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'ноль '"/>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:text> руб. </xsl:text>
		<xsl:choose>
			<xsl:when test="floor($value2)!=$value2">
				<xsl:variable name="kop" select="round((($value2)-floor($value2))*100)"/>
				<xsl:choose>
					<xsl:when test="$kop > 9">
						<xsl:value-of select="concat($kop,' коп.')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('0',$kop,' коп.')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'00 коп.'"/>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template name="float2speech">
		<xsl:param name="value"/>
		<xsl:param name="sex"/>
		<xsl:param name="power"/>
		<xsl:variable name="ret" select="' '"/>

		<xsl:variable name="pp" >
			<xsl:choose>
				<xsl:when test="$power!=0">
					<xsl:if test="$power=1">
						<xsl:value-of select="'f'"/>
					</xsl:if>
					<xsl:if test="$power!=1">
						<xsl:value-of select="'m'"/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$sex"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="strx">
			<xsl:if test="$power!=0">
				<xsl:variable name="p">
					<xsl:choose>
						<xsl:when test="$power!=0">
							<xsl:if test="$power=1">
								<xsl:value-of select="'f'"/>
							</xsl:if>
							<xsl:if test="$power!=1">
								<xsl:value-of select="'m'"/>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$sex"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:variable name="i" select="floor($value)"/>
				<xsl:variable name="x" select="floor(($i mod 100) div 10)"/>

				<xsl:variable name="z">
					<xsl:choose>
						<xsl:when test="$x=1">
							<xsl:number value="5"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$i mod 10"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:variable name="ret2">
					<xsl:choose>
						<xsl:when test="$z=1">
							<xsl:if test="$p='m'">
								<xsl:value-of select="concat(' ',$ret)"/>
							</xsl:if>
							<xsl:if test="$p='f'">
								<xsl:value-of select="concat('а ',$ret)"/>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$z > 1 and $z &lt; 5">
							<xsl:if test="$p='m'">
								<xsl:value-of select="concat('а ',$ret)"/>
							</xsl:if>
							<xsl:if test="$p='f'">
								<xsl:value-of select="concat('и ',$ret)"/>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$p='m'">
								<xsl:value-of select="concat('ов ',$ret)"/>
							</xsl:if>
							<xsl:if test="$p='f'">
								<xsl:value-of select="concat(' ',$ret)"/>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:choose>
					<xsl:when test="($value mod 1000)=0">
						<xsl:value-of select="' '"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$power=1">
								<xsl:value-of select="concat('тысяч',$ret2)"/>
							</xsl:when>
							<xsl:when test="$power=2">
								<xsl:value-of select="concat('миллион',$ret2)"/>
							</xsl:when>
							<xsl:when test="$power=3">
								<xsl:value-of select="concat('миллиард',$ret2)"/>
							</xsl:when>
							<xsl:when test="$power=4">
								<xsl:value-of select="concat('триллион',$ret2)"/>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>

			</xsl:if>
		</xsl:variable>

		<xsl:variable name="str">
			<xsl:if test="$value > 999">
				<xsl:variable name="vd1" select="floor($value div 1000)"/>
				<xsl:variable name="str">
					<xsl:call-template name="float2speech">
						<xsl:with-param name="value" select="$vd1"/>
						<xsl:with-param name="sex" select="$pp"/>
						<xsl:with-param name="power" select="$power+1"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$str"/>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="ppp">
			<xsl:choose>
				<xsl:when test="$pp!=''">
					<xsl:value-of select="$pp"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'m'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="str2">
			<xsl:call-template name="int2speech">
				<xsl:with-param name="dig" select="number(substring($value,string-length($value)-2,3))"/>
				<xsl:with-param name="sex" select="$ppp"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(concat(translate(substring((normalize-space($str)),1,1),'абвгдежзиклмнопрстуфхцчшщъыьэюя','АБВГДЕЖЗИКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'),substring(normalize-space($str),2,string-length($str))),' ')"/>
		<xsl:value-of select="$str2"/>
		<xsl:value-of select="$strx"/>

	</xsl:template>

	<xsl:template name="int2speech">
		<xsl:param name="dig"/>
		<xsl:param name="sex"/>
		<xsl:variable name="remainder" select="floor(($dig mod 1000) div 100)"/>

		<xsl:variable name="ret">
			<xsl:choose>
				<xsl:when test="$remainder=1">
					<xsl:value-of select="'сто '"/>
				</xsl:when>
				<xsl:when test="$remainder=2">
					<xsl:value-of select="'двести '"/>
				</xsl:when>
				<xsl:when test="$remainder=3">
					<xsl:value-of select="'триста '"/>
				</xsl:when>
				<xsl:when test="$remainder=4">
					<xsl:value-of select="'четыреста '"/>
				</xsl:when>
				<xsl:when test="$remainder=5">
					<xsl:value-of select="'пятьсот '"/>
				</xsl:when>
				<xsl:when test="$remainder=6">
					<xsl:value-of select="'шестьсот '"/>
				</xsl:when>
				<xsl:when test="$remainder=7">
					<xsl:value-of select="'семьсот '"/>
				</xsl:when>
				<xsl:when test="$remainder=8">
					<xsl:value-of select="'восемьсот '"/>
				</xsl:when>
				<xsl:when test="$remainder=9">
					<xsl:value-of select="'девятьсот '"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="remainder2" select="floor(($dig mod 100) div 10)"/>
		<xsl:variable name="remainder3" select="floor($dig mod 10)"/>

		<xsl:variable name="ret2">
			<xsl:choose>
				<xsl:when test="$remainder2=1">
					<xsl:choose>
						<xsl:when test="$remainder3=0">
							<xsl:value-of select="'десять '"/>
						</xsl:when>
						<xsl:when test="$remainder3=1">
							<xsl:value-of select="'одиннадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=2">
							<xsl:value-of select="'двенадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=3">
							<xsl:value-of select="'тринадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=4">
							<xsl:value-of select="'четырнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=5">
							<xsl:value-of select="'пятнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=6">
							<xsl:value-of select="'шестнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=7">
							<xsl:value-of select="'семнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=8">
							<xsl:value-of select="'восемнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=9">
							<xsl:value-of select="'девятнадцать '"/>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$remainder2=2">
					<xsl:value-of select="'двадцать '"/>
				</xsl:when>
				<xsl:when test="$remainder2=3">
					<xsl:value-of select="'тридцать '"/>
				</xsl:when>
				<xsl:when test="$remainder2=4">
					<xsl:value-of select="'сорок '"/>
				</xsl:when>
				<xsl:when test="$remainder2=5">
					<xsl:value-of select="'пятьдесят '"/>
				</xsl:when>
				<xsl:when test="$remainder2=6">
					<xsl:value-of select="'шестьдесят '"/>
				</xsl:when>
				<xsl:when test="$remainder2=7">
					<xsl:value-of select="'семьдесят '"/>
				</xsl:when>
				<xsl:when test="$remainder2=8">
					<xsl:value-of select="'восемьдесят '"/>
				</xsl:when>
				<xsl:when test="$remainder2=9">
					<xsl:value-of select="'девяносто '"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="ret3">
			<xsl:choose>
				<xsl:when test="$remainder2!=1">
					<xsl:choose>
						<xsl:when test="$remainder3=1">
							<xsl:choose>
								<xsl:when test="$sex='f'">
									<xsl:value-of select="'одна '"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'один '"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$remainder3=2">
							<xsl:choose>
								<xsl:when test="$sex='f'">
									<xsl:value-of select="'две '"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'два '"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$remainder3=3">
							<xsl:value-of select="'три '"/>
						</xsl:when>
						<xsl:when test="$remainder3=4">
							<xsl:value-of select="'четыре '"/>
						</xsl:when>
						<xsl:when test="$remainder3=5">
							<xsl:value-of select="'пять '"/>
						</xsl:when>
						<xsl:when test="$remainder3=6">
							<xsl:value-of select="'шесть '"/>
						</xsl:when>
						<xsl:when test="$remainder3=7">
							<xsl:value-of select="'семь '"/>
						</xsl:when>
						<xsl:when test="$remainder3=8">
							<xsl:value-of select="'восемь '"/>
						</xsl:when>
						<xsl:when test="$remainder3=9">
							<xsl:value-of select="'девять '"/>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="concat($ret,$ret2,$ret3)"/>

	</xsl:template>
</xsl:stylesheet>
