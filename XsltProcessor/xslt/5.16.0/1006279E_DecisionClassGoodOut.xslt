<?xml version="1.0" encoding="UTF-8"?>
<!-- На основании формы Приказа ФТС № 156 от 31.01.2019 Приложение №1 "Решение о классификации товара в соответствии с единой товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.16.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.16.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dco="urn:customs.ru:Information:CustomsDocuments:DecisionClassGoodOut:5.16.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="dco:DecisionClassGoodOut">
		<html>
			<head>
				<title>Решение по классификации товара по ТН ВЭД ЕАЭС</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<style type="text/css">
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
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

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;
					}

					div.title, tr.title td { font-weight:bold;  }
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
	
					.descr{
					font-size: 8pt;
					text-align: center;
					vertical-align:top;
					}
					.indent{
					text-indent: 1.5em;
					}

					.delim_3 {
					height: 3pt;
					}
					
					.graphLittle{
					font-size: 7pt;
					text-align: center;
					vertical-align:top;
					}					
					
					.delim_3 {
						height: 3pt;
					}

					.graphMain
					{
					font-family: Arial;
					font-size: 11pt;
					}
					
					@media print {
						div.page {
							border: none;
						}
					}		
                   </style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>РЕШЕНИЕ О КЛАССИФИКАЦИИ ТОВАРА В СООТВЕТСТВИИ С ЕДИНОЙ ТОВАРНОЙ НОМЕНКЛАТУРОЙ ВНЕШНЕЭКОНОМИЧЕСКОЙ ДЕЯТЕЛЬНОСТИ ЕВРАЗИЙСКОГО ЭКОНОМИЧЕСКОГО СОЮЗА</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="graphMain">
						<tbody>
							<tr>
								<td valign="top" class="bordered" width="50%">
								1. Наименование таможенного органа, принявшего решение о классификации товара <br/>
									<br/>
									<i>
										<xsl:value-of select="dco:Customs/cat_ru:Code"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="dco:Customs/cat_ru:OfficeName"/>
									</i>
								</td>
								<td valign="top" class="bordered" width="50%">2. Сведения о декларанте
								<br/>
									<br/>
									<i>
										<xsl:apply-templates select="dco:Declarant" mode="organization"/>
									</i>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered">
								3. Регистрационный номер решения о классификации товара
								<br/>
									<br/>
									<i>
									РКТ-<xsl:value-of select="dco:RegistrationNumber/dco:CustomsCode"/>-<xsl:value-of select="substring(dco:RegistrationNumber/dco:Date,3,2)"/>/<xsl:value-of select="dco:RegistrationNumber/dco:SerialNumber"/><xsl:value-of select="dco:RegistrationNumber/dco:DocKind"/>
										<!--	<xsl:value-of select="dco:RegistrationNumber/dco:CaseNomenclatureNumber"/>/-->
									</i>
								</td>
								<td valign="top" class="bordered">
								4. Дата принятия решения о классификации товара
								<br/>
									<br/>
									<i>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:for-each select="dco:RegistrationNumber/dco:Date">
											<xsl:call-template name="Date"/>
										</xsl:for-each>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
									</i>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered">5. Наименование товара<br/>
									<br/>
									<i>
										<xsl:for-each select="dco:Goods/dco:GoodDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
									</i>
								</td>
								<td valign="top" class="bordered">6. Десятизначный классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельноти Евразийского экономическоо союза<br/>
									<br/>
									<i>
										<xsl:call-template name="TNVEDCode">
											<xsl:with-param name="str" select="dco:TNVEDCode"/>
										</xsl:call-template>
									</i>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="2">
								7. Сведения, необходимые для классификации товара
								<br/>
									<br/>
									<i>
										<xsl:for-each select="dco:Goods/dco:AdditionalInformation">
											<xsl:apply-templates select="."/>
											<br/>
											<br/>
										</xsl:for-each>
									</i>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="2">
								8. Обоснование принятия решения о классификации товара                          
								<br/>
									<br/>
								8.1.&#160;Решение принято в соответствии с Основными правилами интерпретации Товарной номенклатуры внешнеэкономической деятельности <i>
										<u>
											<xsl:choose>
												<xsl:when test="dco:InterpretationRules">
													<xsl:value-of select="dco:InterpretationRules"/>
												</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u>
									</i>
									<br/>
									<xsl:if test="dco:ExpertDecision">
										<br>
								8.2.&#160;Заключение <i>
												<u>
													<xsl:choose>
														<xsl:when test="dco:ExpertDecision/dco:ExpertOrganization">
															<xsl:value-of select="dco:ExpertDecision/dco:ExpertOrganization"/>
														</xsl:when>
														<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
													</xsl:choose>
												</u> от <u>
													<xsl:choose>
														<xsl:when test="dco:ExpertDecision/cat_ru:PrDocumentDate">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="dco:ExpertDecision/cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
													</xsl:choose>
												</u>&#160;№
								<u>
													<xsl:choose>
														<xsl:when test="dco:ExpertDecision/cat_ru:PrDocumentNumber">
															<xsl:value-of select="dco:ExpertDecision/cat_ru:PrDocumentNumber"/>
														</xsl:when>
														<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
													</xsl:choose>
												</u>
											</i>
										</br>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="2">
								9. Для служебных отметок 
								<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="dco:Goods/dco:IsPartialGood='true' or dco:Goods/dco:IsPartialGood='1' or dco:Goods/dco:IsPartialGood='t'">
											9.1. <span class="value">
												<xsl:text>&#160;Часть товара&#160;</xsl:text>
											</span>
											<xsl:text>, № документа (таможенной декларации или другого документа, используемого в качестве таможенной декларации), в котором таможенным органом выявлен неверный классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза </xsl:text>
											<span class="value">
												<xsl:text>&#160;&#160;</xsl:text>
												<xsl:for-each select="dco:Goods/dco:DTList/dco:GoodsNumeric">
													<xsl:apply-templates select="." mode="gtd_num"/>
													<xsl:if test="position()!=last()">
														<xsl:text>,&#160;</xsl:text>
													</xsl:if>
												</xsl:for-each>
												<xsl:text>&#160;&#160;</xsl:text>
											</span>
										</xsl:when>
										<xsl:when test="dco:Goods/dco:IsPartialGood='false' or dco:Goods/dco:IsPartialGood='0' or dco:Goods/dco:IsPartialGood='f'">
											<xsl:choose>
												<xsl:when test="count(dco:Goods/dco:DTList)>1">
													<xsl:for-each select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:GoodsNumeric">
														<xsl:text>9.1.</xsl:text>
														<xsl:value-of select="position()"/>
														<xsl:text>.&#160;Товар №&#160;</xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:value-of select="."/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<xsl:text> по декларации на товары </xsl:text>
														<xsl:apply-templates select="../../dco:GoodsNumeric" mode="gtd_num"/>
														<br/>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>9.1.&#160;Товар №&#160;</xsl:text>
													<span class="value">
														<xsl:text>&#160;&#160;</xsl:text>
														<xsl:value-of select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:GoodsNumeric"/>
														<xsl:text>&#160;&#160;</xsl:text>
													</span>
													<xsl:text>, № документа (таможенной декларации или другого документа, используемого в качестве таможенной декларации), в котором таможенным органом выявлен неверный классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза</xsl:text>
													<span class="value">
														<xsl:text>&#160;&#160;&#160;</xsl:text>
														<xsl:for-each select="dco:Goods/dco:DTList/dco:GoodsNumeric">
															<xsl:apply-templates select="." mode="gtd_num"/>
														</xsl:for-each>
														<xsl:text>&#160;&#160;&#160;</xsl:text>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
													</span>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
									</xsl:choose>
									<br/>
									<br/>
								9.2.&#160;Заявленный код товара <span class="value">
										<xsl:text>&#160;&#160;&#160;</xsl:text>
										<xsl:for-each select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:TNVEDCode">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<xsl:text>&#160;&#160;&#160;</xsl:text>
									</span> в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза
								<br/>
									<br/>
								9.3.&#160;Количество дополнительных листов <span class="value">
										<xsl:text>&#160;&#160;0&#160;&#160;</xsl:text>
									</span>
									<br/>
									<br/>
								9.4.&#160;Количество приложений <span class="value">
										<xsl:text>&#160;&#160;0&#160;&#160;</xsl:text>
									</span>
									<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="dco:DepartmentalControl">
											9.5.&#160;Решение принято по результатам проверки таможенных, иных документов и (или) сведений&#160;<span class="value">
												<xsl:value-of select="dco:DepartmentalControl"/>
											</span>
										</xsl:when>
										<xsl:otherwise>
											9.5.&#160;______________&#160;
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="dco:CustomsControl">
											9.6.&#160;Решение принято по результатам таможенной проверки&#160;<span class="value">
												<xsl:value-of select="dco:CustomsControl"/>
											</span>
										</xsl:when>
										<xsl:otherwise>
											9.6.&#160;______________&#160;
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="dco:ClassDecisionChanges">
											9.7.&#160;Реквизиты ранее принятого решения о классификации товара&#160;<span class="value">
												<xsl:value-of select="dco:ClassDecisionChanges"/>
											</span>
										</xsl:when>
										<xsl:otherwise>
											9.7.&#160;______________&#160;
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<br/>
								9.8.&#160;Прочие отметки <xsl:choose>
										<xsl:when test="count(dco:Goods/dco:DTList)=1">
											<span class="value">
												<xsl:for-each select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode">
													<xsl:if test="dco:ListNumeric">
														<xsl:value-of select="dco:ListNumeric"/>
														<xsl:text>.&#160;</xsl:text>
													</xsl:if>
													<xsl:if test="dco:TNVEDCode">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="dco:TNVEDCode"/>
														<xsl:text>&#160;</xsl:text>
													</xsl:if>
													<xsl:value-of select="dco:GoodsAddTNVEDCode"/>
													<xsl:text>&#160;</xsl:text>
													<xsl:for-each select="dco:GoodDescription">
														<xsl:value-of select="."/>
													</xsl:for-each>
													<xsl:if test="position()!=last()">
														<xsl:text>,&#160;</xsl:text>
													</xsl:if>
												</xsl:for-each>
											</span>
										</xsl:when>
									</xsl:choose>
									<br/>
									<span class="value">
										<xsl:for-each select="dco:Mark">
											<xsl:value-of select="."/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</span>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="2">
								10. Подпись должностного лица таможенного органа                         
								<br/>
									<br/>
									<table width="100%">
										<tbody>
											<tr>
												<td align="center" width="5%"/>
												<td align="center" width="30%" class="value">
													<xsl:value-of select="dco:PersonSignature/cat_ru:PersonPost"/>
												</td>
												<td align="center" width="5%"/>
												<td align="center" width="20%" class="value"/>
												<td align="center" width="5%"/>
												<td align="center" width="30%" class="value">
													<xsl:value-of select="dco:PersonSignature/cat_ru:PersonSurname"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="dco:PersonSignature/cat_ru:PersonName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:if test="dco:PersonSignature/cat_ru:PersonMiddleName">
														<xsl:value-of select="dco:PersonSignature/cat_ru:PersonMiddleName"/>
													</xsl:if>
												</td>
												<td align="center" width="5%"/>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(должность)</xsl:text>
												</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(подпись)</xsl:text>
												</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(фамилия, имя, отчество (при наличии)</xsl:text>
												</td>
												<td/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TNVEDCode">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="string-length($str)=10">
				<xsl:value-of select="substring($str, 1, 4)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 5, 2)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 7, 3)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 10, 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$str"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="ddmmyy">
		<xsl:param name="reg"/>
		<xsl:choose>
			<xsl:when test="substring($reg,5,1)='-' ">
				<xsl:value-of select="substring($reg,9,2)"/>
				<xsl:value-of select="substring($reg,6,2)"/>
				<xsl:value-of select="substring($reg,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$reg"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:value-of select="substring (., 9, 2)"/>&#160;
					<xsl:variable name="month" select="substring(., 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose>&#160;					
					<xsl:value-of select="substring(., 1, 4)"/>&#160;г.
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">, &#160;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">,&#160;Код страны: &#160;<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">,&#160;ОПФ: &#160;<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<xsl:text>,&#160;УИФЛ: &#160; </xsl:text>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">, &#160;<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="IdentityCardStr"/>
		</xsl:if>
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">, &#160;<xsl:apply-templates mode="AdressStr" select="."/>
		</xsl:for-each>
		<!--xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text> код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> (код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:text>, &#160;УИТН: &#160;</xsl:text>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="AdressStr" match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>Код вида адреса:  <xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:text> &#160;</xsl:text>
				<xsl:value-of select="RUScat_ru:AddressText"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="IdentityCardStr" match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="dco:GoodsInformation">
		<xsl:if test="catESAD_cu:Manufacturer">
			<xsl:text> Производитель: </xsl:text>
			<xsl:value-of select="catESAD_cu:Manufacturer"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerINN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="catESAD_cu:ManufacturerINN"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerOKATO">
			<xsl:text> ОКАТО </xsl:text>
			<xsl:value-of select="catESAD_cu:ManufacturerOKATO"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:TradeMark">
			<xsl:text> Тов.знак: </xsl:text>
			<xsl:value-of select="catESAD_cu:TradeMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMark">
			<xsl:text> Торг. знак, марка: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsModel">
			<xsl:text> Модель: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsModel"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMarking">
			<xsl:text> Артикул:</xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsStandard">
			<xsl:text> Стандарт: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsSort">
			<xsl:text> Сорт: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsSort"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:WoodDescriptionDetails">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates mode="WoodDescriptionDetails" select="catESAD_cu:WoodDescriptionDetails"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Dimensions">
			<xsl:text> Размеры: </xsl:text>
			<xsl:apply-templates mode="Dimensions" select="catESAD_cu:Dimensions"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DateIssue">
			<xsl:text> Дата выпуска: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Серийный номер: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsGroupQuantity">
			<xsl:text> Кол-во: </xsl:text>
			<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="cat_ru:GoodsQuantity"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
				<xsl:if test="cat_ru:MeasureUnitQualifierCode">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:InvoicedCost">
			<xsl:text> Цена:</xsl:text>
			<xsl:value-of select="translate(catESAD_cu:InvoicedCost, '.', ',')"/>
		</xsl:if>
		<xsl:for-each select="catESAD_cu:LicenseGroup">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">; </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="catESAD_cu:LicDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catESAD_cu:GoodsGroupQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='WoodSortiment'">
				<xsl:text>Наим.сортимента: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='WoodKind'">
				<xsl:text>Порода древесины: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='ProductSortName'">
				<xsl:text>Наименование сорта:</xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='AllowanceDetails'">
				<xsl:text>Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='DeviationDetails'">
				<xsl:text>Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='catESAD_cu:DiameterRangeDetails'">
				<xsl:text>Диапазон диаметров: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select=".">
					<xsl:with-param name="separator" select="'-'"/>
				</xsl:apply-templates>
			</xsl:if>
			<xsl:if test="local-name()='ContractVolumeMeasure'">
				<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='FactVolumeMeasure'">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="Dimensions" match="*">
		<xsl:param name="separator" select="'x'"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$separator"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text>
					<xsl:value-of select="."/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="gtd_num" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
