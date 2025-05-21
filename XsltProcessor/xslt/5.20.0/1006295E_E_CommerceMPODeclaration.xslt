<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ecmd="urn:customs.ru:Information:CustomsDocuments:E_CommerceMPODeclaration:5.20.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.20.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.20.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.20.0">
	<!-- Шаблон для типа E_CommerceMPODeclarationType -->
	<xsl:template match="ecmd:E_CommerceMPODeclaration">
		<xsl:param name="w" select="540"/>
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
				<!-- div class="page" style="width: {$w}mm;" -->
				<div class="page">
					<table>
						<tbody>
							<tr align="center">
								<td class="bordered" colspan="27">Декларация товаров трансграничной (внешней) электронной торговли, помещаемых под таможенную процедуру выпуска для внутреннего потребления</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" colspan="9">А</td>
								<td class="bordered" colspan="18">Регистрационный номер декларации товаров трансграничной (внешней) электронной торговли/номер корректировки<sup>1</sup></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" colspan="9">Общие сведения</td>
								<td class="bordered" colspan="15">Сведения о товарах</td>
								<td class="bordered" colspan="2">Сведения о документах</td>
								<td class="bordered">При-меча-ние<sup>9</sup></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п</td>
								<td class="bordered" rowspan="2">Уникальный номер МПО, получателем которого является физическое лицо</td>
								<td class="bordered" rowspan="2">Уникальный номер МПО, в котором товар поступил на таможенную территорию ЕАЭС (на территорию Российской Федерации) <sup>1</sup></td>
								<td class="bordered" colspan="2">Отправитель</td>
								<td class="bordered" colspan="4">Получатель товаров физическое лицо</td>
								<td class="bordered" rowspan="2">Наи-мено-вание<sup>4</sup></td>
								<td class="bordered" rowspan="2">Страна происхождения товара</td>
								<td class="bordered" rowspan="2">Сведения об объекте интеллектуальной собственности<sup>5</sup></td>
								<td class="bordered" rowspan="2">Код товара по ТН ВЭД ЕАЭС<sup>6</sup></td>
								<td class="bordered" rowspan="2">Уникальный идентификационный номер товара</td>
								<td class="bordered" rowspan="2">Количество товара</td>
								<td class="bordered" rowspan="2">Вес нетто това-ров (кг)</td>
								<td class="bordered" rowspan="2">Вес брутто МПО (кг)</td>
								<td class="bordered" rowspan="2">Стоимость товара в валюте сделки</td>
								<td class="bordered" rowspan="2">Код валюты</td>
								<td class="bordered" rowspan="2">Курс</td>
								<td class="bordered" rowspan="2">Таможенная стоимость (рубли)</td>
								<td class="bordered" rowspan="2">Номер и дата заказа товара<sup>7</sup></td>
								<td class="bordered" rowspan="2">Регистрационный номер декларации на товары, присвоенный при их помещении под таможенную процедуру таможен-ного склада</td>
								<td class="bordered" rowspan="2">Регистрационный номер декларации на товары, присвоенный при их помещении под таможенную процедуру реэкспорта</td>
								<td class="bordered" rowspan="2">Код, приз-нак<sup>8</sup></td>
								<td class="bordered" rowspan="2">Дата, Номер<sup>8</sup></td>
								<td class="bordered" rowspan="2"></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">Отправитель (наименование организации либо фамилия, имя, отчество (при наличии) отправителя)</td>
								<td class="bordered">Адрес отправителя (страна  отправления/адрес/адрес электронной почты/ номер телефона (при наличии))</td>
								<td class="bordered">Фамилия, имя, отчество (при наличии) и дата рождения</td>
								<td class="bordered">Адрес лица/адрес электронной почты/номер мобильного телефона</td>
								<td class="bordered">Идентификационный номер налогоплательщика<sup>2</sup></td>
								<td class="bordered">Сведения о паспорте<sup>3</sup></td>
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
								<td class="bordered">13</td>
								<td class="bordered">14</td>
								<td class="bordered">15</td>
								<td class="bordered">16</td>
								<td class="bordered">17</td>
								<td class="bordered">18</td>
								<td class="bordered">19</td>
								<td class="bordered">20</td>
								<td class="bordered">21</td>
								<td class="bordered">22</td>
								<td class="bordered">23</td>
								<td class="bordered">24</td>
								<td class="bordered">25</td>
								<td class="bordered">26</td>
								<td class="bordered">27</td>
							</tr>
							<xsl:for-each select="ecmd:MPO_Details">
								<xsl:variable name="rowspan">
									<xsl:choose>
										<xsl:when test="count(ecmd:MPO_GoodsDetails) &gt; 1"><xsl:value-of select="count(ecmd:MPO_GoodsDetails)"/></xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td class="bordered" rowspan="{$rowspan}"><xsl:value-of select="position()"/></td>
									<td class="bordered" rowspan="{$rowspan}">
										<xsl:apply-templates select="ecmd:MPO_Number"/>
									</td>
									<td class="bordered" rowspan="{$rowspan}"></td>
									<td class="bordered" rowspan="{$rowspan}"></td>
									<td class="bordered" rowspan="{$rowspan}"></td>
									
									<td class="bordered" rowspan="{$rowspan}">
										<xsl:apply-templates select="ecmd:ConsigneeDetails" mode="fio"/>
									</td>
									<td class="bordered" rowspan="{$rowspan}">
										<xsl:apply-templates select="ecmd:ConsigneeDetails/ecmd:PersonAddress/*" mode="comma"/>
										<xsl:if test="ecmd:ConsigneeDetails/ecmd:PersonCommunicationDetails/cat_ru:E_mail">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="ecmd:ConsigneeDetails/ecmd:PersonCommunicationDetails/cat_ru:E_mail" mode="comma"/>
										</xsl:if>
										<xsl:if test="ecmd:ConsigneeDetails/ecmd:PersonCommunicationDetails/cat_ru:Phone">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="ecmd:ConsigneeDetails/ecmd:PersonCommunicationDetails/cat_ru:Phone" mode="comma"/>
										</xsl:if>
									</td>
									<td class="bordered" rowspan="{$rowspan}">
										<xsl:apply-templates select="ecmd:ConsigneeDetails/ecmd:PersonINN"/>
									</td>
									<td class="bordered" rowspan="{$rowspan}">
										<xsl:apply-templates select="ecmd:ConsigneeDetails/ecmd:PersonPassport/*" mode="comma"/>
									</td>
									<xsl:call-template name="goods">
										<xsl:with-param name="good" select="ecmd:MPO_GoodsDetails[1]"/>
									</xsl:call-template>
								</tr>
								<xsl:for-each select="ecmd:MPO_GoodsDetails[position() &gt; 1]">
									<tr valign="top">
										<xsl:call-template name="goods">
											<xsl:with-param name="good" select="."/>
										</xsl:call-template>
									</tr>
								</xsl:for-each>
								<tr>
									<td class="bordered"></td>
									<td class="bordered" colspan="2"></td>
									<td class="bordered" colspan="6">Всего по МПО</td>
									<td class="bordered" colspan="18"></td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
							<br/>
							<table cellpadding="4">
								<tbody>
									<tr align="center" valign="top">
										<td class="bordered" colspan="6">B. Исчисление платежей</td>
										<td class="bordered" align="left" rowspan="3">Оператор почтовой связи
											<br/>
											<br/>
											<xsl:for-each select="ecmd:DesignatedPostalOperator">
												<xsl:apply-templates select="ecmd:PostalOperatorName"/>
												<br/>
												<xsl:text>Адрес: </xsl:text>
												<xsl:apply-templates select="ecmd:Address/*" mode="comma"/>
												<br/>
												<xsl:text>ИНН </xsl:text>
												<xsl:apply-templates select="ecmd:INN"/>
												<br/>
												<xsl:text>ОКПО </xsl:text>
												<xsl:apply-templates select="ecmd:OKPO"/>
												<br/>
												<xsl:text>КПП </xsl:text>
												<xsl:apply-templates select="ecmd:KPP"/>
											</xsl:for-each>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">Товар</td>
										<td class="bordered">Вид</td>
										<td class="bordered">База для исчисления</td>
										<td class="bordered">Код базы для исчисления</td>
										<td class="bordered">Ставка</td>
										<td class="bordered">Сумма</td>
									</tr>
									<tr align="center">
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
									</tr>
									<xsl:for-each select="ecmd:MPO_Details/ecmd:MPO_GoodsDetails">
										<xsl:variable name="party" select="."/>
										<xsl:variable name="cnt1_CustomsPaymentDetails" select="count(ecmd:CustomsPaymentDetails)"/>
										<xsl:for-each select="ecmd:CustomsPaymentDetails">
											<tr align="center">
												<xsl:if test="position()=1">
													<td class="bordered" rowspan="{$cnt1_CustomsPaymentDetails}"/>
												</xsl:if>
												<td class="bordered">
													<xsl:apply-templates select="ecmd:PaymentModeCode"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="ecmd:TaxBase"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="ecmd:TaxBaseCurrencyCode"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates mode="rate1" select="."/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="ecmd:PaymentAmount"/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ecmd:GoodsItemDetails">
											<xsl:variable name="partyDetails" select="."/>
											<xsl:variable name="cnt_CustomsPaymentDetails" select="count(ecmd:CustomsPaymentDetails)"/>
											<xsl:for-each select="ecmd:CustomsPaymentDetails">
												<tr align="center">
													<xsl:if test="position()=1">
														<td class="bordered" rowspan="{$cnt_CustomsPaymentDetails}">
															<xsl:value-of select="$party/ecmd:ObjectOrdinal"/>
															<xsl:text>/</xsl:text>
															<xsl:value-of select="$partyDetails/ecmd:GoodsNumeric"/>
														</td>
													</xsl:if>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:PaymentModeCode"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:TaxBase"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:TaxBaseCurrencyCode"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="rate1" select="."/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:PaymentAmount"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered">
											Всего по МПО
										</td>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered">
											<xsl:value-of select="ecmd:GoodsShipment/ecmd:TotalPaymentAmountDetails/RUScat_ru:Amount"/>
										</td>
										<td class="bordered" align="left">C</td>
									</tr>
									<tr>
										<td class="bordered" colspan="6">
											<div width="100%" align="center">B1. Подробности уплаты (взыскания)</div>
											<br/>
											<xsl:for-each select="ecmd:MPO_Details/ecmd:FactCustomsPayment">
												<xsl:if test="position()!=1">
													<br/>
												</xsl:if>
												<xsl:apply-templates select="ecmd:PaymentModeCode"/>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="ecmd:Amount"/>
												<xsl:if test="ecmd:CurrencyA3Code">
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="ecmd:CurrencyA3Code"/>
												</xsl:if>
												<xsl:if test="ecmd:PayerINN">
													<xsl:text> - </xsl:text>
													<xsl:apply-templates select="ecmd:PayerINN"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="bordered" align="left" rowspan="3" valign="top">D</td>
									</tr>
								</tbody>
							</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="goods">
		<xsl:param name="good" select="''"/>
		<td class="bordered"><!-- 10 -->
			<xsl:apply-templates select="$good/ecmd:GoodsDescription"/>
		</td>
		<td class="bordered"><!-- 11 -->
			<xsl:apply-templates select="$good/ecmd:OriginCountry/*" mode="comma"/>
		</td>
		<td class="bordered"><!-- 12 -->
		</td>
		<td class="bordered"><!-- 13 -->
			<xsl:apply-templates select="$good/ecmd:GoodsTNVEDCode"/>
		</td>
		<td class="bordered"><!-- 14 -->
			<xsl:apply-templates select="$good/ecmd:UINGoods" mode="comma"/>
		</td>
		<td class="bordered"><!-- 15 -->
			<xsl:for-each select="$good/ecmd:SupplementaryQuantity">
				<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:apply-templates select="." mode="quantity"/>
			</xsl:for-each>
		</td>
		<td class="bordered"><!-- 16 -->
			<xsl:apply-templates select="$good/ecmd:NetWeightQuantity/cat_ru:GoodsQuantity"/>
		</td>
		<td class="bordered"><!-- 17 -->
			<xsl:apply-templates select="$good/ecmd:GrossWeightQuantity/cat_ru:GoodsQuantity"/>
		</td>
		<td class="bordered"><!-- 18 -->
			<xsl:apply-templates select="$good/ecmd:ValueAmount/ecmd:CurrencyQuantity"/>
		</td>
		<td class="bordered"><!-- 19 -->
			<xsl:apply-templates select="$good/ecmd:ValueAmount/ecmd:CurrencyDetails/RUScat_ru:CurrencyA3Code"/>
		</td>
		<td class="bordered"><!-- 20 -->
			<xsl:apply-templates select="$good/ecmd:ValueAmount/ecmd:CurrencyDetails/RUScat_ru:CurrencyRate"/>
		</td>
		<td class="bordered"><!-- 21 -->
			<xsl:apply-templates select="$good/ecmd:CustomsCost"/>
		</td>
		<td class="bordered"><!-- 22 -->
			<xsl:apply-templates select="$good/ecmd:OrderDetails" mode="doc"/>
		</td>
		<td class="bordered"><!-- 23 -->
			<xsl:apply-templates select="$good/ecmd:IMP_DT_Number" mode="dt_num"/>
		</td>
		<td class="bordered"><!-- 24 -->
		</td>
		<td class="bordered"><!-- 25 -->
			<xsl:for-each select="$good/ecmd:PresentedDocDetails">
				<xsl:if test="position()!=1">,<br/></xsl:if>
				<xsl:apply-templates select="RUDECLcat:DocKindCode"/>
			</xsl:for-each>
		</td>
		<td class="bordered"><!-- 26 -->
			<xsl:for-each select="$good/ecmd:PresentedDocDetails">
				<xsl:if test="position()!=1">,<br/></xsl:if>
				<xsl:apply-templates select="." mode="doc"/>
			</xsl:for-each>
		</td>
		<td class="bordered"><!-- 27 -->
			<xsl:apply-templates select="$good/ecmd:Note"/>
		</td>
	</xsl:template>
	
	<xsl:template match="*" mode="dt_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="comma">
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:choose>
			<xsl:when test="contains(local-name(), 'Date')">
				<xsl:apply-templates select="." mode="russian_date"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="*[local-name() = 'Rate'] or *[local-name() = 'Rate']!=''">
					<xsl:apply-templates select="*[local-name() = 'Rate']"/>
				</xsl:when>
				<xsl:otherwise> 0 </xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="*[local-name() = 'RateTypeCode']='%'">%</xsl:when>
			<xsl:when test="*[local-name() = 'RateTypeCode']!='*' or not(*[local-name() = 'RateTypeCode'])">
				<xsl:choose>
					<xsl:when test="*[local-name() = 'RateCurrencyCode']">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="*[local-name() = 'RateCurrencyCode']"/>
						<xsl:if test="*[local-name() = 'RateTNVEDQualifierCode']">
							<xsl:text> за </xsl:text>
							<xsl:apply-templates select="*[local-name() = 'WeightingFactor']"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="*[local-name() = 'RateTNVEDQualifierCode']"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise> % </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="ecmd:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="ecmd:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="ecmd:PersonMiddleName"/>
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
	<xsl:template match="//*[local-name()='E_CommerceMPODeclaration']//*" priority="-1"> <!-- !!! -->
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
