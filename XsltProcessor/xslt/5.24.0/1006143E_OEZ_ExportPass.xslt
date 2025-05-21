<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России от 26.03.2012 г. № 566, Приложение 5 (expas:DocSign = 0)
Приказ Министерства финансов Российской Федерации от 28 февраля 2024 г. № 17н «Об утверждении форм разрешения на вывоз товаров с территории особой экономической зоны (за исключением портовой особой экономической зоны), с участка территории опережающего развития, с земельного участка, предоставленного резиденту свободного порта Владивосток, с участка резидента Арктической зоны Российской Федерации, на которых применяется таможенная процедура свободной таможенной зоны, а также разрешения на вывоз товаров с портовой особой экономической зоны, с земельного участка, прилегающего к автомобильному или железнодорожному пункту пропуска свободного порта Владивосток, Арктической зоны Российской Федерации, на котором применяется таможенная процедура свободной таможенной зоны, установленная для логистической особой экономической зоны, с отдельных участков морских портов, открытых для международного сообщения и захода иностранных морских судов, включая акваторию морского порта, и (или) с отдельных участков территории аэропорта, открытого для приема и отправки воздушных судов, выполняющих международные воздушные перевозки, находящихся на территории свободного порта Владивосток, в Арктической зоне Российской Федерации, с отдельных участков территории свободного порта Республики Крым и города Федерального значения Севастополя, на которых применяется таможенная процедура свободной таможенной зоны, установленная для портовой особой экономической зоны, и порядков заполнения указанных форм разрешений», Приложение 1 (expas:DocSign = 1), Приложение 3 (expas:DocSign = 2) -->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:expas="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportPass:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="expas:OEZ_ExportPass">
		<html>
			<head>
				<title>Пропуск на выезд средства транспорта с территории ОЭЗ</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier New;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMainbold {
						font-family: Arial;
						font-size: 10pt;
						font-weight:bold;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
										}	
					.borderednormal {
					border-bottom: solid 1pt #000000;
					font-weight: normal;
										}	
					.allbordered {
					border-bottom: solid 1pt #000000;
					border-top: solid 1pt #000000;
					border-left: solid 1pt #000000;
					border-right: solid 1pt #000000;
					font-weight: normal;
										}	
					 td.graphUnderline {
                    border-bottom: 1px solid black;
                    text-align: center;
                    font-weight: normal;
                    font-size: 9pt; 
                    }
                                       
                    td.graphNotUnderline {
                    border-bottom: 0px solid black;
                    text-align: center;
                    font-weight: normal; 
                    }
                    
                </style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="expas:DocSign='0'">
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td align="center">Разрешение №
										<u>
											<xsl:value-of select="expas:RegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dateIn2" select="expas:RegistrationNumber/expas:RegistrationDate"/>
											</xsl:call-template>/<xsl:value-of select="expas:RegistrationNumber/expas:Number"/>
											<xsl:if test="expas:RegistrationNumber/expas:AddNumber">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="expas:RegistrationNumber/expas:AddNumber"/>
											</xsl:if>
										</u>
										<br/>
										<xsl:text> на вывоз товаров и выезд средства транспорта с территории ОЭЗ</xsl:text>
									</td>
								</tr>
								<tr align="left">
									<td>
										<table style="width:297mm">
											<tbody>
												<tr>
													<td style="width:75mm" valign="bottom">Разрешается выезд средства транспорта</td>
													<td align="center" class="bordered" style="width:80mm" valign="bottom">
														<xsl:choose>
															<xsl:when test="expas:TransportMeans/expas:TransportKind='1'">а/м </xsl:when>
															<xsl:when test="expas:TransportMeans/expas:TransportKind='2'">ж/д </xsl:when>
															<xsl:otherwise>авиа </xsl:otherwise>
														</xsl:choose>
														<xsl:if test="expas:TransportMeans/expas:TransportMark">
															(<xsl:value-of select="expas:TransportMeans/expas:TransportMark"/>) 
														</xsl:if>
														<xsl:value-of select="expas:TransportMeans/expas:ActiveTransportIdentifier"/>
														<xsl:if test="expas:TransportMeans/expas:TransportRegNumber">, 
															прицеп/полуприцеп <xsl:for-each select="expas:TransportMeans/expas:TransportRegNumber">
																<xsl:value-of select="."/> 
															</xsl:for-each>
														</xsl:if>
													</td>
													<td style="width:57mm" valign="bottom">, перевозящего товары</td>
													<td align="center" class="bordered" style="width:95mm" valign="bottom">
														<xsl:value-of select="expas:Consignor/cat_ru:OrganizationName"/> 
														<xsl:if test="expas:Consignor/expas:Address">
															<xsl:for-each select="expas:Consignor/expas:Address">
																<xsl:call-template name="Address"/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:if test="expas:Consignor/cat_ru:RFOrganizationFeatures">
															<xsl:value-of select="expas:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
															<xsl:value-of select="expas:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
															<xsl:value-of select="expas:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td/>
													<td align="center" class="graphLittle">(тип (марка), регистрационный(е) номер(а))</td>
													<td/>
													<td align="center" class="graphLittle">(отправитель (грузотправитель) товаров)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="left">
										<br/>согласно перечню:<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
											<tbody>
												<tr>
													<td>№ п/п</td>
													<td>Наименование</td>
													<td>Кол-во товаров</td>
													<td>Кол-во грузовых мест</td>
													<td>Вес товаров</td>
													<td>Вид упаковки</td>
													<td>Статус товаров</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
													<td>4</td>
													<td>5</td>
													<td>6</td>
													<td>7</td>
												</tr>
												<xsl:for-each select="expas:GoodsList">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td>
															<xsl:number value="position()"/>
														</td>
														<td>
															<xsl:for-each select="expas:GoodsDescription">
																<xsl:value-of select="."/> 
															</xsl:for-each>
														</td>
														<td>
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
														</td>
														<td>
															<xsl:value-of select="expas:PackagesQuantity"/>
														</td>
														<td>
															<xsl:value-of select="expas:WeighQuantity"/>
														</td>
														<td>
															<xsl:value-of select="expas:PackagingKind"/>
														</td>
														<td align="left">
															<xsl:for-each select="expas:GoodsStatus">
																<xsl:choose>
																	<xsl:when test="not(expas:DTInfo/expas:DTGoods)">
																		<xsl:value-of select="expas:StatusSymbolicValue"/>
																		<xsl:if test="expas:CustomsModeCode">
																			<xsl:text>/ </xsl:text>
																			<xsl:value-of select="expas:CustomsModeCode"/>
																		</xsl:if>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:for-each select="expas:DTInfo/expas:DTGoods">
																			<xsl:if test="position()!=1"><br/></xsl:if>
																			<xsl:value-of select="../../expas:StatusSymbolicValue"/>
																			<xsl:if test="../../expas:CustomsModeCode">/ <xsl:value-of select="../../expas:CustomsModeCode"/>
																			</xsl:if>
																			<xsl:if test="../expas:GTDID">/
																				<xsl:value-of select="../expas:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_dt">
																					<xsl:with-param name="dateIn3" select="../expas:GTDID/cat_ru:RegistrationDate"/>
																				</xsl:call-template>/<xsl:value-of select="../expas:GTDID/cat_ru:GTDNumber"/>
																			</xsl:if> 
																			<xsl:if test="expas:GoodsNumeric">
																				<xsl:text>/ </xsl:text>
																				<xsl:value-of select="expas:GoodsNumeric"/>
																			</xsl:if>
																			<xsl:choose>
																				<xsl:when test="expas:SupplementaryQuantity">
																					<xsl:for-each select="expas:SupplementaryQuantity">/
																						<xsl:value-of select="cat_ru:GoodsQuantity"/> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																						<xsl:if test="cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																					</xsl:for-each>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:if test="expas:NetWeightQuantity">/
																						<xsl:value-of select="expas:NetWeightQuantity"/>
																						<xsl:text> кг</xsl:text>
																					</xsl:if>
																				</xsl:otherwise>
																			</xsl:choose>
																		</xsl:for-each>
																	</xsl:otherwise>
																</xsl:choose>
																<br/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="left">
										на основании следующих коммерческих, транспортных, таможенных документов:
									</td>
								</tr>
								<tr>
									<td>
										<table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
											<tbody>
												<tr>
													<td>№ п/п</td>
													<td>Наименование документов</td>
													<td>Реквизиты (номер, дата) документа</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<xsl:for-each select="expas:DocumentExp">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td>
															<xsl:number value="position()"/>
														</td>
														<td>
															<xsl:value-of select="cat_ru:PrDocumentName"/>
														</td>
														<td>№ <xsl:value-of select="cat_ru:PrDocumentNumber"/> 
														от <xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<xsl:if test="expas:PassKind">
									<tr>
										<td align="left">
											<br/>
											<xsl:choose>
												<xsl:when test="expas:PassKind='0' or expas:PassKind='false' or expas:PassKind='f'">разовый пропуск</xsl:when>
												<xsl:when test="expas:PassKind='1' or expas:PassKind='true' or expas:PassKind='t'">многоразовый пропуск</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="expas:PassKind"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="left">
										<br/>
										Срок действия разрешения <u>
											<xsl:if test="expas:BeginDate">
												с 
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="expas:BeginDate"/>
												</xsl:call-template>
											</xsl:if> по 
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="expas:LimitDate"/>
											</xsl:call-template>
										</u>
									</td>
								</tr>
								<tr>
									<td>
										<table style="width:297mm">
											<tbody>
												<tr>
													<td class="allbordered" style="width:80mm">
														<u>
															<xsl:value-of select="expas:CustomsPerson/cat_ru:PersonName"/>
														</u>
														<br/>
														<span class="graphLittle">(ФИО должностного лица уполномоченного таможенного органа)</span>
													</td>
													<td style="width:30mm"/>
													<td class="allbordered" style="width:50mm">
														<u>
															<xsl:value-of select="expas:CustomsPerson/cat_ru:PersonName"/>
														</u>
														<br/>
														<span class="graphLittle">(подпись)</span>
													</td>
													<td style="width:20mm"/>
													<td class="allbordered" style="width:40mm">
														<u>
															<xsl:value-of select="expas:CustomsPerson/cat_ru:LNP"/>
															<xsl:if test="expas:CustomsPerson/cat_ru:CustomsCode">
																<xsl:text> (код ТО: </xsl:text>
																<xsl:value-of select="expas:CustomsPerson/cat_ru:CustomsCode"/>
																<xsl:text>)</xsl:text>
															</xsl:if>
														</u>
														<br/>
														<span class="graphLittle">(ЛНП)</span>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="expas:DocSign='1'">
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td class="graph" align="center">
										<b><xsl:text>Разрешение</xsl:text></b>
										<br/>
										<b><xsl:text>на вывоз товаров с территории особой экономической зоны (за исключением портовой особой экономической зоны), с участка территории опережающего развития, с земельного участка, предоставленного резиденту свободного порта Владивосток, с участка резидента Арктической зоны Российской Федерации, на которых применяется таможенная процедура свободной таможенной зоны</xsl:text></b>
										<br/><br/>№ 
										<xsl:value-of select="expas:RegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
											<xsl:with-param name="dateIn2" select="expas:RegistrationNumber/expas:RegistrationDate"/>
										</xsl:call-template>/<xsl:value-of select="expas:RegistrationNumber/expas:Number"/>
										<xsl:if test="expas:RegistrationNumber/expas:AddNumber">
											<xsl:text>/</xsl:text>
											<xsl:value-of select="expas:RegistrationNumber/expas:AddNumber"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="left">
									<td class="graphMain">
										<table style="width:297mm">
											<tbody>
												<tr>
													<td valign="bottom" colspan="3">Разрешается вывоз товаров с территории особой экономической зоны (за исключением портовой особой экономической зоны), с участка территории опережающего развития, с земельного участка, предоставленного резиденту свободного порта Владивосток, с участка резидента Арктической зоны Российской Федерации, на которых применяется</td>
												</tr>
												<tr>
													<td align="center" class="bordered" valign="bottom" colspan="3">
														<xsl:choose>
															<xsl:when test="expas:Resident">
																<xsl:apply-templates select="expas:Resident/cat_ru:OrganizationName"/> 
																<xsl:if test="expas:Resident/RUScat_ru:SubjectAddressDetails">
																	<xsl:for-each select="expas:Resident/RUScat_ru:SubjectAddressDetails">
																		<xsl:apply-templates select="."/>
																	</xsl:for-each> 
																</xsl:if>
																<xsl:if test="expas:Resident/cat_ru:RFOrganizationFeatures">
																	<xsl:if test="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																	<xsl:if test="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																	<xsl:if test="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
																</xsl:if>
																<xsl:if test="expas:Resident/expas:CertificateNumber">
																	свидетельство о включении в реестр резидентов Арктической зоны № 
																	<xsl:apply-templates select="expas:Resident/expas:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																	<xsl:apply-templates select="expas:Resident/expas:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
																</xsl:if>
															</xsl:when>
															<xsl:otherwise>
																<xsl:apply-templates select="expas:Consignee/cat_ru:OrganizationName"/> 
																<xsl:if test="expas:Consignee/expas:Address">
																	<xsl:for-each select="expas:Consignee/expas:Address">
																		<xsl:apply-templates select="."/>
																	</xsl:for-each> 
																</xsl:if>
																<xsl:if test="expas:Consignee/cat_ru:RFOrganizationFeatures">
																	<xsl:if test="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																	<xsl:if test="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																	<xsl:if test="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
																</xsl:if>
																<xsl:if test="expas:Consignee/expas:CertificateNumber">
																	свидетельство о включении в реестр резидентов Арктической зоны № 
																	<xsl:apply-templates select="expas:Consignee/expas:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																	<xsl:apply-templates select="expas:Consignee/expas:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle" colspan="3">(резидент особой экономической зоны, резидент территории опережающего развития, резидент свободного порта Владивосток, резидент Арктической зоны Российской Федерации)</td>
												</tr>
												<tr>
													<td valign="bottom" colspan="3">таможенная процедура свободной таможенной зоны, по уведомлению</td>
												</tr>
												<tr>
													<td align="center" class="bordered" valign="bottom" colspan="3">
														<xsl:value-of select="expas:ExportNoticeRegNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
															<xsl:with-param name="dateIn2" select="expas:ExportNoticeRegNumber/expas:RegistrationDate"/>
														</xsl:call-template>/<xsl:value-of select="expas:ExportNoticeRegNumber/expas:Number"/>
														<xsl:if test="expas:ExportNoticeRegNumber/expas:AddNumber">
															<xsl:text>/</xsl:text>
															<xsl:value-of select="expas:ExportNoticeRegNumber/expas:AddNumber"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle" colspan="3">(регистрационный номер уведомления о вывозе товаров<sup>1</sup>)</td>
												</tr>
												<tr>
													<td style="width:75mm" valign="bottom">общим весом</td>
													<td align="center" class="bordered" style="width:80mm" valign="bottom">
														<xsl:value-of select="expas:TotalWeight"/>
													</td>
													<td style="width:152mm" valign="bottom"> (кг) согласно следующим сведениям.</td>
												</tr>
												<tr>
													<td/>
													<td align="center" class="graphLittle">(вес транспортного средства и вывозимых товаров)</td>
													<td/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="graphMain" align="left">
										<br/>Таблица "Перечень товаров"<br/>
									</td>
								</tr>
								<tr>
									<td class="graphMain">
										<table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
											<tbody>
												<tr>
													<td>№ п/п</td>
													<td>Наименование</td>
													<td>Количество/единица измерения</td>
													<td>Количество грузовых мест</td>
													<td>Вес товаров, кг</td>
													<td>Вид упаковки</td>
													<td>Статус товаров</td>
													<td>Основание для вывоза</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
													<td>4</td>
													<td>5</td>
													<td>6</td>
													<td>7</td>
													<td>8</td>
												</tr>
												<xsl:for-each select="expas:GoodsList">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td>
															<xsl:number value="position()"/>
														</td>
														<td>
															<xsl:for-each select="expas:GoodsDescription">
																<xsl:value-of select="."/> 
															</xsl:for-each>
														</td>
														<td>
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
														</td>
														<td>
															<xsl:value-of select="expas:PackagesQuantity"/> 
														</td>
														<td>
															<xsl:value-of select="expas:WeighQuantity"/> 
														</td>
														<td>
															<xsl:value-of select="expas:PackagingKind"/> 
														</td>
														<td align="left">
															<xsl:for-each select="expas:GoodsStatus">
																<xsl:choose>
																	<xsl:when test="not(expas:DTInfo/expas:DTGoods)">
																		<xsl:value-of select="expas:StatusSymbolicValue"/>
																		<xsl:if test="expas:CustomsModeCode">
																			<xsl:text>/ </xsl:text>
																			<xsl:value-of select="expas:CustomsModeCode"/>
																		</xsl:if>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:for-each select="expas:DTInfo/expas:DTGoods">
																			<xsl:if test="position()!=1"><br/></xsl:if>
																			<xsl:value-of select="../../expas:StatusSymbolicValue"/>
																			<xsl:if test="../../expas:CustomsModeCode">/ <xsl:value-of select="../../expas:CustomsModeCode"/>
																			</xsl:if>
																			<xsl:if test="../expas:GTDID">/
																				<xsl:value-of select="../expas:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_dt">
																					<xsl:with-param name="dateIn3" select="../expas:GTDID/cat_ru:RegistrationDate"/>
																				</xsl:call-template>/<xsl:value-of select="../expas:GTDID/cat_ru:GTDNumber"/>
																			</xsl:if> 
																			<xsl:if test="expas:GoodsNumeric">
																				<xsl:text>/ </xsl:text>
																				<xsl:value-of select="expas:GoodsNumeric"/>
																			</xsl:if>
																			<xsl:choose>
																				<xsl:when test="expas:SupplementaryQuantity">
																					<xsl:for-each select="expas:SupplementaryQuantity">/
																						<xsl:value-of select="cat_ru:GoodsQuantity"/> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																						<xsl:if test="cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																					</xsl:for-each>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:if test="expas:NetWeightQuantity">/
																						<xsl:value-of select="expas:NetWeightQuantity"/>
																						<xsl:text> кг</xsl:text>
																					</xsl:if>
																				</xsl:otherwise>
																			</xsl:choose>
																			<!--xsl:for-each select="expas:DTGoodsGroup">
																				<xsl:if test="expas:GoodsMarking">
																					<xsl:text>/ </xsl:text>
																					<xsl:value-of select="expas:GoodsMarking"/>
																				</xsl:if>
																				<xsl:for-each select="expas:SupplementaryQuantity">/
																					<xsl:value-of select="cat_ru:GoodsQuantity"/> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																					<xsl:if test="cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																				</xsl:for-each>
																				<xsl:if test="expas:RecordId">
																					<xsl:text>/ </xsl:text>
																					<xsl:value-of select="expas:RecordId"/>
																				</xsl:if>
																			</xsl:for-each-->
																		</xsl:for-each>
																	</xsl:otherwise>
																</xsl:choose>
																<!--xsl:value-of select="expas:StatusSymbolicValue"/>
																<xsl:if test="expas:CustomsModeCode">/ <xsl:value-of select="expas:CustomsModeCode"/>
																</xsl:if>
																<xsl:if test="expas:GTDID">/
																	<xsl:value-of select="expas:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_dt">
																		<xsl:with-param name="dateIn3" select="expas:GTDID/cat_ru:RegistrationDate"/>
																	</xsl:call-template>/<xsl:value-of select="expas:GTDID/cat_ru:GTDNumber"/>
																</xsl:if> 
																<xsl:if test="expas:GoodsNumeric">
																	<xsl:text> / </xsl:text>
																	<xsl:value-of select="expas:GoodsNumeric"/>
																</xsl:if>
																<xsl:if test="expas:NetWeightQuantity">/
																	<xsl:value-of select="expas:NetWeightQuantity"/>
																</xsl:if>
																<xsl:if test="expas:SupplementaryQuantity">/
																	<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																	<xsl:if test="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																</xsl:if-->
																<!--xsl:choose>
																	<xsl:when test="(expas:StatusSymbolicValue='ТТС') or (expas:StatusSymbolicValue='ТРАНЗИТ')"><xsl:value-of select="expas:StatusSymbolicValue"/></xsl:when>
																	<xsl:when test="expas:StatusSymbolicValue='ИНТ'">
																	<xsl:value-of select="expas:StatusSymbolicValue"/><xsl:if test="expas:CustomsModeCode">/&#160;<xsl:value-of select="expas:CustomsModeCode"/></xsl:if>
																	<xsl:if test="expas:GTDID">/&#160;<xsl:variable name="data1"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,9,2)"/></xsl:variable>
																	<xsl:variable name="data2"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,6,2)"/></xsl:variable>
																	<xsl:variable name="data3"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,1,4)"/></xsl:variable>
							
																	<xsl:value-of select="concat(expas:GTDID/cat_ru:CustomsCode,'/',$data1,$data2,$data3,'/',expas:GTDID/cat_ru:GTDNumber)"/>
																	</xsl:if>
																	</xsl:when>
																	<xsl:when test="expas:StatusSymbolicValue='СТЗ'">
																	<xsl:value-of select="expas:StatusSymbolicValue"/>
																	<xsl:if test="expas:GTDID">/&#160;<xsl:variable name="data1"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,9,2)"/></xsl:variable>
																	<xsl:variable name="data2"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,6,2)"/></xsl:variable>
																	<xsl:variable name="data3"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,1,4)"/></xsl:variable>
							
																	<xsl:value-of select="concat(expas:GTDID/cat_ru:CustomsCode,'/',$data1,$data2,$data3,'/',expas:GTDID/cat_ru:GTDNumber)"/>
																	</xsl:if>
																	<xsl:if test="expas:GoodsNumeric">/&#160;<xsl:value-of select="expas:GoodsNumeric"/></xsl:if>
																	<xsl:choose>
																		<xsl:when test="expas:NetWeightQuantity">/&#8194;<xsl:value-of select="expas:NetWeightQuantity"/>&#160;(кг)</xsl:when>
																		<xsl:when test="expas:SupplementaryQuantity/cat_ru:GoodsQuantity">/&#8194;<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/>&#160;<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/><xsl:if test="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if></xsl:when>
																	</xsl:choose>
																	</xsl:when>
																</xsl:choose-->
																<br/>
															</xsl:for-each>
														</td>
														<td>
															<xsl:if test="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:OEZ_GTDID">
																<xsl:for-each select="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:OEZ_GTDID">
																	<xsl:apply-templates select="."/> 
																</xsl:for-each> 
															</xsl:if>
															<xsl:if test="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:GTDID">
																<xsl:for-each select="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:GTDID">
																	<xsl:apply-templates select="."/> 
																</xsl:for-each> 
															</xsl:if>
															<xsl:if test="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:GoodsNumeric">
																товар № <xsl:value-of select="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:GoodsNumeric"/> 
															</xsl:if>
															<xsl:if test="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:NetWeightQuantity">
																масса нетто <xsl:value-of select="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:NetWeightQuantity"/> кг 
															</xsl:if>
															<xsl:if test="expas:GroundsForExport/expas:PermitExportGoodsInfo">
																<xsl:if test="expas:GroundsForExport/expas:DT_OEZ_Goods">; </xsl:if>
																<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo">
																	<xsl:choose>
																		<xsl:when test="expas:PermitKind='1'">Разрешение таможенного органа на вывоз товаров </xsl:when>
																		<xsl:when test="expas:PermitKind='2'">Разрешение таможенного органа на отбор проб и (или) образцов товаров </xsl:when>
																		<xsl:when test="expas:PermitKind='3'">Разрешение таможенного органа на ввоз товаров </xsl:when>
																	</xsl:choose>
																	<xsl:if test="expas:PermitRegistrationNumber">
																		№ <xsl:value-of select="expas:PermitRegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
																			<xsl:with-param name="dateIn2" select="expas:PermitRegistrationNumber/expas:RegistrationDate"/>
																		</xsl:call-template>/<xsl:value-of select="expas:PermitRegistrationNumber/expas:Number"/>
																		<xsl:if test="expas:PermitRegistrationNumber/expas:AddNumber">
																			<xsl:text>/</xsl:text>
																			<xsl:value-of select="expas:PermitRegistrationNumber/expas:AddNumber"/>
																		</xsl:if>
																	</xsl:if>
																	<xsl:if test="expas:ExportGoodsQuantity">
																		, кол-во товара <xsl:value-of select="expas:ExportGoodsQuantity"/> кг
																	</xsl:if>
																	<xsl:if test="expas:ExportGoodsQuantity">
																		, идентификация при ввозе: <xsl:apply-templates select="expas:GoodsIdentificationInfo"/>
																	</xsl:if>
																	<xsl:if test="expas:Date">
																		, дата - <xsl:call-template name="russian_date">
																			<xsl:with-param name="dateIn" select="expas:Date"/>
																		</xsl:call-template>
																	</xsl:if>
																</xsl:for-each>
															</xsl:if>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="graphMain" align="left">
										<br/>Таблица "Перечень документов"<br/>
									</td>
								</tr>
								<tr>
									<td class="graphMain">
										<table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
											<tbody>
												<tr>
													<td>№ п/п</td>
													<td>Наименование документа</td>
													<td>Номер, дата документа</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<xsl:for-each select="expas:DocumentExp">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td>
															<xsl:number value="position()"/>
														</td>
														<td>
															<xsl:value-of select="cat_ru:PrDocumentName"/>
														</td>
														<td>№ <xsl:value-of select="cat_ru:PrDocumentNumber"/> 
															от <xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="graphMain" border="0" style="width:297mm">
							<tbody>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Транспортное средство/без транспортного средства</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:choose>
											<xsl:when test="expas:TransportMeans/expas:TransportKind='1'">а/м </xsl:when>
											<xsl:when test="expas:TransportMeans/expas:TransportKind='2'">ж/д </xsl:when>
											<xsl:otherwise>авиа </xsl:otherwise>
										</xsl:choose>
										<xsl:if test="expas:TransportMeans/expas:TransportMark">
											(<xsl:value-of select="expas:TransportMeans/expas:TransportMark"/>) 
										</xsl:if>
										<xsl:value-of select="expas:TransportMeans/expas:ActiveTransportIdentifier"/>
										<xsl:if test="expas:TransportMeans/expas:TransportRegNumber">, 
											прицеп/полуприцеп <xsl:for-each select="expas:TransportMeans/expas:TransportRegNumber">
												<xsl:value-of select="."/> 
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Вес транспортного средства</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:value-of select="expas:TransportMeans/expas:TareWeight"/>
									</td>
								</tr>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Сборный груз</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:choose>
											<xsl:when test="expas:CombinedCargo='1'">вывоз товаров в составе сборного груза</xsl:when>
											<xsl:otherwise>-</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Срок действия настоящего разрешения</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="expas:LimitDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Срок представления документов</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:if test="expas:BeginDate">
											с <xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="expas:BeginDate"/>
											</xsl:call-template> по 
										</xsl:if>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="expas:DeadlineForDocuments"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/>
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td class="graphMain">
										<table style="width:297mm">
											<tbody>
												<tr>
													<td class="bordered" style="width:110mm">
														<xsl:value-of select="expas:CustomsPerson/cat_ru:PersonName"/>
													</td>
													<td style="width:40mm"/>
													<td class="bordered" style="width:70mm">
														<xsl:value-of select="expas:CustomsPerson/cat_ru:LNP"/>
														<xsl:if test="expas:CustomsPerson/cat_ru:CustomsCode">
															<xsl:text> (код ТО: </xsl:text>
															<xsl:value-of select="expas:CustomsPerson/cat_ru:CustomsCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" style="width:110mm">(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)</td>
													<td style="width:40mm"/>
													<td class="graphLittle" style="width:70mm">(подпись)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="graphLittle" align="left">
										<sup>1</sup> Приказ Министерства финансов Российской Федерации от 29 июня 2023 г. № 103н "Об утверждении Порядка и технологий совершения таможенных операций в отношении товаров (включая транспортные средства), ввозимых (ввезенных) на территорию свободной экономической зоны и вывозимых с территории свободной экономической зоны", зарегистрирован Министерством юстиции Российской Федерации 30 июня 2023 г., регистрационный № 74101.
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="expas:DocSign='2'">
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td class="graph" align="center">
										<b><xsl:text>Разрешение</xsl:text></b>
										<br/>
										<b><xsl:text>на вывоз товаров с портовой особой экономической зоны, с земельного участка, прилегающего к автомобильному или железнодорожному пункту пропуска свободного порта Владивосток, Арктической зоны Российской Федерации, на котором применяется таможенная процедура свободной таможенной зоны, установленная для логистической особой экономической зоны, с отдельных участков морских портов, открытых для международного сообщения и захода иностранных морских судов, включая акваторию морского порта, и (или) с отдельных участков территории аэропорта, открытого для приема и отправки воздушных судов, выполняющих международные воздушные перевозки, находящихся на территории свободного порта Владивосток, в Арктической зоне Российской Федерации, с отдельных участков территории свободного порта Республики Крым и города федерального значения Севастополя, на которых применяется таможенная процедура свободной таможенной зоны, установленная для портовой особой экономической зоны</xsl:text></b>
										<br/><br/>№ 
										<xsl:value-of select="expas:RegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
											<xsl:with-param name="dateIn2" select="expas:RegistrationNumber/expas:RegistrationDate"/>
										</xsl:call-template>/<xsl:value-of select="expas:RegistrationNumber/expas:Number"/>
										<xsl:if test="expas:RegistrationNumber/expas:AddNumber">
											<xsl:text>/</xsl:text>
											<xsl:value-of select="expas:RegistrationNumber/expas:AddNumber"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="left">
									<td class="graphMain">
										<table style="width:297mm">
											<tbody>
												<tr>
													<td valign="bottom" colspan="3">Разрешается вывоз товаров:</td>
												</tr>
												<tr>
													<td align="center" class="bordered" valign="bottom" colspan="3">
														<xsl:choose>
															<xsl:when test="expas:Resident">
																<xsl:apply-templates select="expas:Resident/cat_ru:OrganizationName"/> 
																<xsl:if test="expas:Resident/RUScat_ru:SubjectAddressDetails">
																	<xsl:for-each select="expas:Resident/RUScat_ru:SubjectAddressDetails">
																		<xsl:apply-templates select="."/>
																	</xsl:for-each> 
																</xsl:if>
																<xsl:if test="expas:Resident/cat_ru:RFOrganizationFeatures">
																	<xsl:if test="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																	<xsl:if test="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																	<xsl:if test="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="expas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
																</xsl:if>
																<xsl:if test="expas:Resident/expas:CertificateNumber">
																	свидетельство о включении в реестр резидентов Арктической зоны № 
																	<xsl:apply-templates select="expas:Resident/expas:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																	<xsl:apply-templates select="expas:Resident/expas:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
																</xsl:if>
															</xsl:when>
															<xsl:otherwise>
																<xsl:apply-templates select="expas:Consignee/cat_ru:OrganizationName"/> 
																<xsl:if test="expas:Consignee/expas:Address">
																	<xsl:for-each select="expas:Consignee/expas:Address">
																		<xsl:apply-templates select="."/>
																	</xsl:for-each> 
																</xsl:if>
																<xsl:if test="expas:Consignee/cat_ru:RFOrganizationFeatures">
																	<xsl:if test="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																	<xsl:if test="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																	<xsl:if test="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="expas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
																</xsl:if>
																<xsl:if test="expas:Consignee/expas:CertificateNumber">
																	свидетельство о включении в реестр резидентов Арктической зоны № 
																	<xsl:apply-templates select="expas:Consignee/expas:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																	<xsl:apply-templates select="expas:Consignee/expas:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle" colspan="3">(резидент портовой особой экономической зоны, свободного порта Владивосток, Арктической зоны Российской Федерации, участник свободной экономической зоны (далее - резидент или участник) или лицо, не являющееся резидентом или участником)</td>
												</tr>
												<tr>
													<td style="width:75mm" valign="bottom">по уведомлению</td>
													<td style="width:232mm" align="center" class="bordered" valign="bottom" colspan="2">
														<xsl:value-of select="expas:ExportNoticeRegNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
															<xsl:with-param name="dateIn2" select="expas:ExportNoticeRegNumber/expas:RegistrationDate"/>
														</xsl:call-template>/<xsl:value-of select="expas:ExportNoticeRegNumber/expas:Number"/>
														<xsl:if test="expas:ExportNoticeRegNumber/expas:AddNumber">
															<xsl:text>/</xsl:text>
															<xsl:value-of select="expas:ExportNoticeRegNumber/expas:AddNumber"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td style="width:75mm"/>
													<td style="width:232mm" align="center" class="graphLittle" colspan="2">(регистрационный номер уведомления о вывозе товаров)</td>
												</tr>
												<tr>
													<td style="width:75mm" valign="bottom">общим весом</td>
													<td align="center" class="bordered" style="width:80mm" valign="bottom">
														<xsl:value-of select="expas:TotalWeight"/>
													</td>
													<td style="width:152mm" valign="bottom"> (кг) согласно следующим сведениям.</td>
												</tr>
												<tr>
													<td style="width:75mm"/>
													<td style="width:80mm" align="center" class="graphLittle">(вес транспортного средства и вывозимых товаров)</td>
													<td style="width:152mm"/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="graphMain">
										<table style="width:297mm">
											<tbody>
												<tr>
													<td style="width:120mm" align="left" valign="bottom">Сборный груз</td>
													<td align="center" class="bordered" style="width:187mm" valign="bottom">
														<xsl:choose>
															<xsl:when test="expas:CombinedCargo='1'">вывоз товаров в составе сборного груза</xsl:when>
															<xsl:otherwise>-</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="graphMain" align="left">
										<br/>Таблица "Перечень товаров"<br/>
									</td>
								</tr>
								<tr>
									<td class="graphMain">
										<table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
											<tbody>
												<tr>
													<td rowspan="3">№ п/п</td>
													<td rowspan="3">Наи- мено- вание това- ра</td>
													<td rowspan="3">Коли- чест- во/ еди- ница изме- рения</td>
													<td rowspan="3">Ко- ли- чест- во гру- зо- вых мест</td>
													<td rowspan="3">Вес товара (об- щая масса товара вместе с та- рой и упа- ков- кой, кг)</td>
													<td rowspan="3">Вид упа- ков- ки</td>
													<td rowspan="3">Ста- тус то- ва- ров</td>
													<td colspan="13">Основание для вывоза</td>
												</tr>
												<tr>
													<td colspan="4">завершение таможенной процедуры свободной таможенной зоны</td>
													<td colspan="2">вывоз без завершения таможенной процедуры свободной таможенной зоны</td>
													<td colspan="2">вывоз проб и (или) образцов</td>
													<td colspan="2">вывоз товаров, которые не помещаются под таможенную процедуру свободной таможенной зоны</td>
													<td colspan="3">вывоз товаров, помещенных за пределами портового (логистического) участка под таможенные процедуры, применимые к вывозимым товарам</td>
												</tr>
												<tr>
													<td>код та- мо- жен- ной про- це- дуры</td>
													<td>регистра- ционный номер деклара- ции на товары/ номер товара в деклара- ции на товары</td>
													<td>мас- са "нет- то" вы- вози- мого това- ра, кг</td>
													<td>коли- чество товара в дополни- тельных едини- цах изме- рения/ед измере- ния</td>
													<td>номер и дата таможен- ного документа (разреше- ния тамо- женного органа на вывоз)</td>
													<td>коли- чест- во/ед. изме- рения</td>
													<td>но- мер раз- ре- ше- ния</td>
													<td>коли- чест- во/ед. изме- рения</td>
													<td>регист- рацион- ный номер разре- шения на ввоз</td>
													<td>коли- чест- во/ед. изме- рения</td>
													<td>регис- тра- цион- ный номер раз- реше- ния на ввоз</td>
													<td>регистра- ционный номер деклара- ции на товары/ номер товара в деклара- ции на товары</td>
													<td>коли- чество/ ед. изме- рения</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
													<td>4</td>
													<td>5</td>
													<td>6</td>
													<td>7</td>
													<td>8</td>
													<td>9</td>
													<td>10</td>
													<td>11</td>
													<td>12</td>
													<td>13</td>
													<td>14</td>
													<td>15</td>
													<td>16</td>
													<td>17</td>
													<td>18</td>
													<td>19</td>
													<td>20</td>
												</tr>
												<xsl:for-each select="expas:GoodsList">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td>
															<xsl:number value="position()"/>
														</td>
														<td>
															<xsl:for-each select="expas:GoodsDescription">
																<xsl:value-of select="."/> 
															</xsl:for-each>
														</td>
														<td>
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
															<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
														</td>
														<td>
															<xsl:value-of select="expas:PackagesQuantity"/> 
														</td>
														<td>
															<xsl:value-of select="expas:WeighQuantity"/> 
														</td>
														<td>
															<xsl:value-of select="expas:PackagingKind"/> 
														</td>
														<td align="left">
															<xsl:for-each select="expas:GoodsStatus">
																<xsl:choose>
																	<xsl:when test="not(expas:DTInfo/expas:DTGoods)">
																		<xsl:value-of select="expas:StatusSymbolicValue"/>
																		<xsl:if test="expas:CustomsModeCode">
																			<xsl:text>/ </xsl:text>
																			<xsl:value-of select="expas:CustomsModeCode"/>
																		</xsl:if>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:for-each select="expas:DTInfo/expas:DTGoods">
																			<xsl:if test="position()!=1"><br/></xsl:if>
																			<xsl:value-of select="../../expas:StatusSymbolicValue"/>
																			<xsl:if test="../../expas:CustomsModeCode">/ <xsl:value-of select="../../expas:CustomsModeCode"/>
																			</xsl:if>
																			<xsl:if test="../expas:GTDID">/
																				<xsl:value-of select="../expas:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_dt">
																					<xsl:with-param name="dateIn3" select="../expas:GTDID/cat_ru:RegistrationDate"/>
																				</xsl:call-template>/<xsl:value-of select="../expas:GTDID/cat_ru:GTDNumber"/>
																			</xsl:if> 
																			<xsl:if test="expas:GoodsNumeric">
																				<xsl:text>/ </xsl:text>
																				<xsl:value-of select="expas:GoodsNumeric"/>
																			</xsl:if>
																			<xsl:choose>
																				<xsl:when test="expas:SupplementaryQuantity">
																					<xsl:for-each select="expas:SupplementaryQuantity">/
																						<xsl:value-of select="cat_ru:GoodsQuantity"/> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																						<xsl:if test="cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																					</xsl:for-each>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:if test="expas:NetWeightQuantity">/
																						<xsl:value-of select="expas:NetWeightQuantity"/>
																						<xsl:text> кг</xsl:text>
																					</xsl:if>
																				</xsl:otherwise>
																			</xsl:choose>
																		</xsl:for-each>
																	</xsl:otherwise>
																</xsl:choose>
																<br/>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:CustomsModeCode">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each> 
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:DT_OEZ_Goods">
																<xsl:if test="expas:OEZ_GTDID">
																	<xsl:for-each select="expas:OEZ_GTDID">
																		<xsl:apply-templates select="."/><br/>
																	</xsl:for-each> 
																</xsl:if>
																<xsl:if test="expas:GTDID">
																	<xsl:for-each select="expas:GTDID">
																		<xsl:apply-templates select="."/><br/>
																	</xsl:for-each> 
																</xsl:if>
																<xsl:if test="expas:GoodsNumeric">
																	товар № <xsl:value-of select="expas:GoodsNumeric"/> 
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each> 
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:DT_OEZ_Goods">
																<xsl:value-of select="expas:NetWeightQuantity"/>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:SupplementaryQuantity">
																<xsl:value-of select="cat_ru:GoodsQuantity"/> 
																<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/> 
																<xsl:if test="cat_ru:MeasureUnitQualifierCode">
																	(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo[expas:PermitKind='1']">
																<xsl:value-of select="expas:PermitRegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
																	<xsl:with-param name="dateIn2" select="expas:PermitRegistrationNumber/expas:RegistrationDate"/>
																</xsl:call-template>/<xsl:value-of select="expas:PermitRegistrationNumber/expas:Number"/>
																<xsl:if test="expas:PermitRegistrationNumber/expas:AddNumber">
																	<xsl:text>/</xsl:text>
																	<xsl:value-of select="expas:PermitRegistrationNumber/expas:AddNumber"/>
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo[expas:PermitKind='1']">
																<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
																<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
																<xsl:if test="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
																	(код <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo[expas:PermitKind='2']">
																<xsl:value-of select="expas:PermitRegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
																	<xsl:with-param name="dateIn2" select="expas:PermitRegistrationNumber/expas:RegistrationDate"/>
																</xsl:call-template>/<xsl:value-of select="expas:PermitRegistrationNumber/expas:Number"/>
																<xsl:if test="expas:PermitRegistrationNumber/expas:AddNumber">
																	<xsl:text>/</xsl:text>
																	<xsl:value-of select="expas:PermitRegistrationNumber/expas:AddNumber"/>
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo[expas:PermitKind='2']">
																<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
																<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
																<xsl:if test="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
																	(код <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo[expas:PermitKind='3']">
																<xsl:value-of select="expas:PermitRegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
																	<xsl:with-param name="dateIn2" select="expas:PermitRegistrationNumber/expas:RegistrationDate"/>
																</xsl:call-template>/<xsl:value-of select="expas:PermitRegistrationNumber/expas:Number"/>
																<xsl:if test="expas:PermitRegistrationNumber/expas:AddNumber">
																	<xsl:text>/</xsl:text>
																	<xsl:value-of select="expas:PermitRegistrationNumber/expas:AddNumber"/>
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo[expas:PermitKind='3']">
																<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
																<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
																<xsl:if test="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
																	(код <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo[expas:PermitKind='3']">
																<xsl:value-of select="expas:PermitRegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
																	<xsl:with-param name="dateIn2" select="expas:PermitRegistrationNumber/expas:RegistrationDate"/>
																</xsl:call-template>/<xsl:value-of select="expas:PermitRegistrationNumber/expas:Number"/>
																<xsl:if test="expas:PermitRegistrationNumber/expas:AddNumber">
																	<xsl:text>/</xsl:text>
																	<xsl:value-of select="expas:PermitRegistrationNumber/expas:AddNumber"/>
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td>
															<xsl:for-each select="expas:GroundsForExport/expas:DT_OEZ_Goods">
																<xsl:if test="expas:OEZ_GTDID">
																	<xsl:for-each select="expas:OEZ_GTDID">
																		<xsl:apply-templates select="."/><br/>
																	</xsl:for-each> 
																</xsl:if>
																<xsl:if test="expas:GTDID">
																	<xsl:for-each select="expas:GTDID">
																		<xsl:apply-templates select="."/><br/>
																	</xsl:for-each> 
																</xsl:if>
																<xsl:if test="expas:GoodsNumeric">
																	товар № <xsl:value-of select="expas:GoodsNumeric"/> 
																</xsl:if>
																<xsl:if test="position()!=last"><br/></xsl:if>
															</xsl:for-each> 
														</td>
														<td>
															<xsl:choose>
																<xsl:when test="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:SupplementaryQuantity">
																	<xsl:for-each select="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:SupplementaryQuantity">
																		<xsl:value-of select="cat_ru:GoodsQuantity"/> 
																		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/> 
																		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
																			(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
																		</xsl:if>
																		<xsl:if test="position()!=last"><br/></xsl:if>
																	</xsl:for-each>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:for-each select="expas:GroundsForExport/expas:PermitExportGoodsInfo[expas:PermitKind='3']">
																		<xsl:value-of select="expas:PermitRegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
																			<xsl:with-param name="dateIn2" select="expas:PermitRegistrationNumber/expas:RegistrationDate"/>
																		</xsl:call-template>/<xsl:value-of select="expas:PermitRegistrationNumber/expas:Number"/>
																		<xsl:if test="expas:PermitRegistrationNumber/expas:AddNumber">
																			<xsl:text>/</xsl:text>
																			<xsl:value-of select="expas:PermitRegistrationNumber/expas:AddNumber"/>
																		</xsl:if>
																		<xsl:if test="position()!=last"><br/></xsl:if>
																	</xsl:for-each>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="graphMain" align="left">
										<br/>Таблица "Перечень документов"<br/>
									</td>
								</tr>
								<tr>
									<td class="graphMain">
										<table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
											<tbody>
												<tr>
													<td>№ п/п</td>
													<td>Наименование документа</td>
													<td>Номер, дата документа</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<xsl:for-each select="expas:DocumentExp">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td>
															<xsl:number value="position()"/>
														</td>
														<td>
															<xsl:value-of select="cat_ru:PrDocumentName"/>
														</td>
														<td>№ <xsl:value-of select="cat_ru:PrDocumentNumber"/> 
															от <xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="graphMain" border="0" style="width:297mm">
							<tbody>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Транспортное средство/без транспортного средства</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:choose>
											<xsl:when test="expas:TransportMeans/expas:TransportKind='1'">а/м </xsl:when>
											<xsl:when test="expas:TransportMeans/expas:TransportKind='2'">ж/д </xsl:when>
											<xsl:otherwise>авиа </xsl:otherwise>
										</xsl:choose>
										<xsl:if test="expas:TransportMeans/expas:TransportMark">
											(<xsl:value-of select="expas:TransportMeans/expas:TransportMark"/>) 
										</xsl:if>
										<xsl:value-of select="expas:TransportMeans/expas:ActiveTransportIdentifier"/>
										<xsl:if test="expas:TransportMeans/expas:TransportRegNumber">, 
											прицеп/полуприцеп <xsl:for-each select="expas:TransportMeans/expas:TransportRegNumber">
												<xsl:value-of select="."/> 
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Вес транспортного средства</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:value-of select="expas:TransportMeans/expas:TareWeight"/>
									</td>
								</tr>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Срок действия настоящего разрешения</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="expas:LimitDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td style="width:120mm" align="left" valign="bottom">Срок представления документов</td>
									<td align="center" class="bordered" style="width:187mm" valign="bottom">
										<xsl:if test="expas:BeginDate">
											с <xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="expas:BeginDate"/>
											</xsl:call-template> по 
										</xsl:if>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="expas:DeadlineForDocuments"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/>
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td class="graphMain">
										<table style="width:297mm">
											<tbody>
												<tr>
													<td class="bordered" style="width:110mm">
														<xsl:value-of select="expas:CustomsPerson/cat_ru:PersonName"/>
													</td>
													<td style="width:40mm"/>
													<td class="bordered" style="width:70mm">
														<xsl:value-of select="expas:CustomsPerson/cat_ru:LNP"/>
														<xsl:if test="expas:CustomsPerson/cat_ru:CustomsCode">
															<xsl:text> (код ТО: </xsl:text>
															<xsl:value-of select="expas:CustomsPerson/cat_ru:CustomsCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" style="width:110mm">(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)</td>
													<td style="width:40mm"/>
													<td class="graphLittle" style="width:70mm">(подпись)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="expas:GroundsForExport/expas:DT_OEZ_Goods/expas:OEZ_GTDID | expas:GroundsForExport/expas:DT_OEZ_Goods/expas:GTDID | expas:OEZ_GTDID | expas:GTDID">
	   <xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
	   <xsl:text>/</xsl:text>
	   <xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
	   <xsl:text>/</xsl:text>
	   <xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn2"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
				<xsl:value-of select="substring($dateIn2,9,2)"/>
				<xsl:value-of select="substring($dateIn2,6,2)"/>
				<xsl:value-of select="substring($dateIn2,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn2"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_dt">
		<xsl:param name="dateIn3"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn3,5,1)='-' and substring($dateIn3,8,1)='-'">
				<xsl:value-of select="substring($dateIn3,9,2)"/>
				<xsl:value-of select="substring($dateIn3,6,2)"/>
				<xsl:value-of select="substring($dateIn3,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn3"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>, 
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>, 
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/>, 
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/>, 
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
   <xsl:template match="expas:Resident/RUScat_ru:SubjectAddressDetails | expas:Consignor/expas:Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<!--xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if-->
				<xsl:value-of select="RUScat_ru:AddressText"/>
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
						<!--xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when-->
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
							<xsl:if test="not(local-name()='AddressKindCode')">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
   </xsl:template>
</xsl:stylesheet>
