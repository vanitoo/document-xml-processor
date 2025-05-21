<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.15.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.14.3" xmlns:ordco="urn:customs.ru:Information:CustomsDocuments:OrderCustomsObservation:5.15.0">
	<!-- Шаблон для типа OrderCustomsObservationType -->
	<xsl:template match="ordco:OrderCustomsObservation">
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
	
					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
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
	
					.delim_3 {
					height: 3pt;
					}
	
				  .bordered { border-collapse: collapse; }
				  td.bordered
				  {
				  border: solid 1px windowtext;
				  }
				  
					.graphMain
					{
					font-family: Arial;
					font-size: 11pt;
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
				  font-size:8pt;
				  }
                </style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td colspan="3" align="center" class="title">
									<font size="4">
										<xsl:text>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="value" colspan="3">
									<xsl:apply-templates select="ordco:Customs" mode="CustomsOffice"/>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="3" class="graphLittle">
									<xsl:text>(наименование таможенного органа)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="center" class="title">
									<font size="4">
										<b>
											<xsl:choose>
												<xsl:when test="ordco:DocType='0'">
													<xsl:text>СООБЩЕНИЕ</xsl:text>
													<br>о необходимости проведения таможенного наблюдения</br>
												</xsl:when>
												<xsl:when test="ordco:DocType='1'">
													<xsl:text>ПРЕДПИСАНИЕ</xsl:text>
													<br>на проведение таможенного наблюдения</br>
												</xsl:when>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td width="35%" align="left">
									<xsl:call-template name="DateStr">
										<xsl:with-param select="ordco:OrderDate" name="date"/>
									</xsl:call-template>
								</td>
								<td width="35%" align="right">
									<xsl:text>№ </xsl:text>
								</td>
								<td width="25%" align="center" class="value">
									<xsl:apply-templates select="ordco:OrderNumber" mode="ord_number"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td>
									<xsl:text>В соответствии с частью 9 статьи 214, частью 1 статьи 243 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации"</xsl:text>
									<br/>
									<br/>
									<xsl:text>ОБЯЗЫВАЮ:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="ordco:CustomsPerson">
										<xsl:apply-templates select="." mode="PersonBase"/>
										<xsl:if test="position()!=last()">
											<xsl:text>,&#160;</xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(должность, инициалы (отчество указывается при наличии) и фамилия лица  (лиц), которому(ым) поручается проведение таможенного наблюдения)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:choose>
										<xsl:when test="count(ordco:CustomsPerson)=1">
											<xsl:text>Служебное удостоверение № </xsl:text>
										</xsl:when>
										<xsl:otherwise>Служебные удостоверения № </xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="ordco:CustomsPerson/ordco:PersonCustomsID">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>,&#160;</xsl:text>
										</xsl:if>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>провести таможенное наблюдение</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="ordco:ObservationKind='0' or ordco:ObservationKind='false' or ordco:ObservationKind='f'">
											<xsl:text>непосредственное таможенное наблюдение</xsl:text>
										</xsl:when>
										<xsl:when test="ordco:ObservationKind='1' or ordco:ObservationKind='true' or ordco:ObservationKind='t'">
											<xsl:text>опосредованное таможенное наблюдение</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:if test="ordco:ObservationDescr">
										<xsl:if test="ordco:ObservationKind">
											<xsl:text>,&#160;</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:for-each select="ordco:ObservationDescr">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text disable-output-escaping="yes"> </xsl:text>
										</xsl:if>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Место проведения таможенного наблюдения:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="ordco:ObservationPlace">
											<xsl:for-each select="ordco:ObservationPlace">
												<xsl:apply-templates select="." mode="CustomsOffice"/>
												<xsl:if test="cat_ru:CustomsCountryCode">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="cat_ru:CustomsCountryCode"/>
													<xsl:text>) </xsl:text>
												</xsl:if>
												<xsl:for-each select="ordco:InformationTypeCode | ordco:InspPlaceName | ordco:InspPlaceDesc">
													<xsl:if test="position() > 1">
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:apply-templates mode="CommaSeparate" select="ordco:Address"/>
												<xsl:if test="ordco:WarehousePlace">
													<xsl:text>,&#160;</xsl:text>
													<xsl:choose>
														<xsl:when test="ordco:WarehousePlace/ordco:DocumentModeCode=1">
															<xsl:text> Лицензия </xsl:text>
														</xsl:when>
														<xsl:when test="ordco:WarehousePlace/ordco:DocumentModeCode=2">
															<xsl:text> Свидетельство </xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="ordco:WarehousePlace/ordco:DocumentModeCode"/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:apply-templates select="ordco:WarehousePlace" mode="document"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>&#8212;&#8212;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Товары, в том числе транспортные средства, являющиеся объектом таможенного контроля, а также физические лица, следующие через таможенную границу Евразийского экономического союза и находящиеся в зоне таможенного контроля или транзитной зоне международного
аэропорта:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="ordco:DTInfo | ordco:ObjectsControl | ordco:Goods">
											<xsl:apply-templates select="ordco:DTInfo"/>
											<xsl:if test="ordco:DTInfo and (ordco:ObjectsControl or ordco:Goods)">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:for-each select="ordco:ObjectsControl">
												<xsl:value-of select="."/>
												<!--xsl:if test="position()!=last()">
													<xsl:text disable-output-escaping="yes"> </xsl:text>
												</xsl:if-->
											</xsl:for-each>
											<xsl:if test="ordco:ObjectsControl and ordco:Goods">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:for-each select="ordco:Goods">
												<xsl:text>№ </xsl:text>
												<xsl:value-of select="ordco:GoodsNumber"/>
												<xsl:text>&#160;</xsl:text>
												<xsl:for-each select="ordco:GoodsDescription">
													<xsl:value-of select="."/>
													<!--xsl:if test="position()!=last()">
														<xsl:text disable-output-escaping="yes"> </xsl:text>
													</xsl:if-->
												</xsl:for-each>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>&#8212;&#8212;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Операции, при которых проводится таможенное наблюдение:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="ordco:OperationsCustObservation">
											<xsl:choose>
												<xsl:when test="ordco:OperationsCustObservation/ordco:OperationsCustObservationKind=1">
													<xsl:text>перевозка товаров и транспортных средств </xsl:text>
												</xsl:when>
												<xsl:when test="ordco:OperationsCustObservation/ordco:OperationsCustObservationKind=2">
													<xsl:text>грузовые операции </xsl:text>
												</xsl:when>
												<xsl:when test="ordco:OperationsCustObservation/ordco:OperationsCustObservationKind=3">
													<xsl:text>прочее </xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:for-each select="ordco:OperationsCustObservation/ordco:OperationsCustObservationDescr">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text disable-output-escaping="yes"> </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>&#8212;&#8212;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="DateStr">
										<xsl:with-param select="ordco:BeginDate" name="date"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(ordco:BeginTime,1,8)"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
						<table width="100%" class="graphMain">
							<tbody>
								<tr>
									<td width="45%">
										<xsl:text>Начальник (заместитель начальника) таможенного органа</xsl:text>
									</td>
									<td class="value" width="15%"/>
									<td width="5%"/>
									<td valign="bottom" align="center" class="value" width="30%">
										<xsl:apply-templates select="ordco:CustomsChief" mode="PersonBase"/>
									</td>
								</tr>
								<tr>
									<td/>
									<td valign="top" align="center" class="graphLittle">
										<xsl:text>(подпись)</xsl:text>
									</td>
									<td/>
									<td valign="top" align="center" class="graphLittle">
										<xsl:text>(инициалы, фамилия) (отчество указывается при наличии)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ordco:DTInfo">
		<xsl:choose>
			<xsl:when test="ordco:DTRegNum">
				<xsl:text>ДТ </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:DTRegNum"/>
			</xsl:when>
			<xsl:when test="ordco:TDRegNum">
				<xsl:text>ТД </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:TDRegNum"/>
			</xsl:when>
			<xsl:when test="ordco:AppRelNum">
				<xsl:text>Заявление о выпуске до подачи </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:AppRelNum"/>
			</xsl:when>
			<xsl:when test="ordco:TransportPP">
				<xsl:text>Уведомление о прибытии / убытии </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:TransportPP"/>
			</xsl:when>
			<xsl:when test="ordco:TIRIdDetails">
				<xsl:text>Книжка МДП </xsl:text>
				<xsl:value-of select="ordco:TIRIdDetails/catESAD_cu:TIRSeries"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="ordco:TIRIdDetails/catESAD_cu:TIRID"/>
			</xsl:when>
			<xsl:when test="ordco:OtherDoc">
				<xsl:apply-templates select="ordco:OtherDoc" mode="document"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="gtd_number" match="*">
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:if test="./*[local-name()='AddNumber']">
			<xsl:choose>
				<xsl:when test="./*[local-name()='AddNumber'] = 'ЗВ'">В</xsl:when>
				<xsl:otherwise><xsl:value-of select="./*[local-name()='AddNumber']"/></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='GTDNumber']"/>
	</xsl:template>
	<xsl:template mode="CommaSeparate" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="num_date" match="*">
		<xsl:param name="dateIn" select="."/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="ord_number" match="*">
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='SerialNumber']"/>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;
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
					</xsl:choose> 					
				&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/>
				<u>
					<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
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
</xsl:stylesheet>
