<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tpo="urn:customs.ru:Information:CustomsDocuments:TPO:5.19.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.16.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.17.0">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:key name="codes" match="tpo:PaymentInfoDetails" use="tpo:PaymentModeCode"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="tpo:TPO">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Таможенный приходный ордер (ТПО)</title>
				<style type="text/css">
			body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:variable name="MPGlobal" select="tpo:TPOTypeCode/tpo:MovementPurpose"/>
					<table>
						<tr>
							<td class="graph" colspan="5" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #000000;">Таможенный приходный ордер</td>
							<td class="graph" colspan="3" rowspan="2" style="border:solid 1pt #000000">1. Тип ордера<br/>
								<xsl:value-of select="tpo:TPOTypeCode/tpo:MovementPurpose"/>
								<xsl:if test="tpo:TPOTypeCode/tpo:MovementWay">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tpo:TPOTypeCode/tpo:MovementWay"/>
								</xsl:if>
								<xsl:text>/</xsl:text>
								<xsl:variable name="TMC" select="tpo:TPOTypeCode/tpo:TransportModeCode"/>
								<xsl:choose>
									<xsl:when test="($MPGlobal = 'ПЛ' or $MPGlobal = 'АС' or $MPGlobal = 'УС') and ($TMC = '1' or string($TMC)='')">--</xsl:when>
									<xsl:otherwise><xsl:value-of select="tpo:TPOTypeCode/tpo:TransportModeCode"/></xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" colspan="2" rowspan="2" style="border:solid 1pt #000000">2. Доб.лист<br/>
								<!--<xsl:if test="//tpo:AdditionalSheetNumber"><xsl:value-of select="//tpo:AdditionalSheetNumber"/></xsl:if>-->
								<xsl:choose>
									<xsl:when test="tpo:AdditionalSheetNumber and (tpo:AdditionalSheetNumber != '0')">
										<xsl:value-of select="tpo:AdditionalSheetNumber"/>
									</xsl:when>
									<xsl:otherwise>-</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="5" style="border:solid 1pt #000000">3. Справочный номер<br/>
								<xsl:value-of select="tpo:TPORegNumber/tpo:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
									<xsl:with-param name="dateIn" select="tpo:TPORegNumber/tpo:RegistrationDate"/>
								</xsl:call-template>/<xsl:value-of select="tpo:TPORegNumber/tpo:DocNumber"/>
								<xsl:if test="tpo:TPORegNumber/tpo:NumPP">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="tpo:TPORegNumber/tpo:NumPP"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">4. Плательщик<br/>
								<xsl:apply-templates select="tpo:Payer"/>
								<xsl:if test="not(tpo:Payer)">-</xsl:if>
							</td>
							<td class="graph" colspan="5" style="border:solid 1pt #000000">5. Валюта платежа<br/>
								<xsl:text>РОССИЙСКИЙ РУБЛЬ RUB</xsl:text>
								<!--
								<xsl:value-of select="tpo:PaymentCurrency/tpo:CurrencyA3Code"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tpo:PaymentCurrency/tpo:CurrencyN3Code"/>
								-->
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #000000;"> </td>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">ИНН<br/>
								<xsl:for-each select="tpo:Payer[cat_ru:RFOrganizationFeatures/cat_ru:INN]">
									<xsl:if test="position()!=1">
										<br/>
									</xsl:if>
									<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</xsl:for-each>
								<xsl:if test="not(tpo:Payer[cat_ru:RFOrganizationFeatures/cat_ru:INN])">-</xsl:if>
							</td>
							<td class="graph" colspan="2" style="border:solid 1pt #000000">5.1. Курс доллара США<br/>
								<xsl:value-of select="tpo:PaymentCurrency/tpo:CurrencyDollarRate"/>
								<xsl:if test="not(tpo:PaymentCurrency/tpo:CurrencyDollarRate)"/>
							</td>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">5.2. Курс евро<br/>
								<xsl:value-of select="tpo:PaymentCurrency/tpo:CurrencyEuroRate"/>
								<xsl:if test="tpo:PaymentCurrency/tpo:CurrencyEuroRate"/>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">6. Представляемые сведения/Дополнительная информация<br/>
								<xsl:if test="(not(tpo:AdditionalInformationDetails) or string(tpo:AdditionalInformationDetails) = '')and not(tpo:MPONumber) and not(tpo:MPONotifNumber) and not(tpo:MPOPostalTransferNumber) and not(tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:PaymentDocDetails/tpo:CustomsReceiptRegNumber) and not(tpo:UtilCollDetails)">-</xsl:if>
								<xsl:for-each select="tpo:AdditionalInformationDetails">
									<xsl:if test="position()!=1">
										<br/>
									</xsl:if>
									<xsl:apply-templates select="."/>
								</xsl:for-each>
								<xsl:if test="tpo:MPONumber">
									<br/>
									<xsl:text>МПО: </xsl:text>
									<xsl:apply-templates mode="reg_num" select="tpo:MPONumber"/>
								</xsl:if>
								<xsl:if test="tpo:MPONotifNumber">
									<br/>
									<xsl:text>Уведомление о МПО: </xsl:text>
									<xsl:apply-templates mode="reg_num" select="tpo:MPONotifNumber"/>
								</xsl:if>
								<xsl:if test="tpo:MPOPostalTransferNumber">
									<xsl:text>Номер бланка ПП: </xsl:text>
									<xsl:value-of select="tpo:MPOPostalTransferNumber"/>
								</xsl:if>
								<xsl:if test="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:PaymentDocDetails/tpo:CustomsReceiptRegNumber">
									<br/>
									<xsl:text>Номер ТР: </xsl:text>
									<xsl:for-each select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:PaymentDocDetails/tpo:CustomsReceiptRegNumber">
										<xsl:if test="position() &gt; 1">; </xsl:if>
										<xsl:apply-templates mode="reg_num" select="."/>
									</xsl:for-each>
								</xsl:if>
								<xsl:apply-templates select="tpo:UtilCollDetails/tpo:Vehicle"/>
								<xsl:apply-templates select="tpo:UtilCollDetails/tpo:Chassis"/>
								<xsl:apply-templates select="tpo:UtilCollDetails/tpo:Ttrailer"/>
								<xsl:if test="tpo:UtilCollDetails/tpo:VINID">
									<br/>
									<xsl:text>VIN: </xsl:text>
									<xsl:value-of select="tpo:UtilCollDetails/tpo:VINID"/>
								</xsl:if>
								<xsl:if test="tpo:UtilCollDetails/tpo:RegUtil">
									<br/>
									<xsl:text>Рег. номер расчета утилизационного сбора: </xsl:text>
									<xsl:apply-templates mode="GTDID" select="tpo:UtilCollDetails/tpo:RegUtil"/>
								</xsl:if>
							</td>
							<td class="graph" colspan="2" style="border:solid 1pt #000000">6.1. Общий вес (кг)<br/>
								<xsl:choose>
									<xsl:when test="tpo:TotalWeight and number(tpo:TotalWeight) &gt; 0"><xsl:value-of select="tpo:TotalWeight"/></xsl:when>
									<xsl:otherwise>-</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">6.2. Общая стоимость в валюте платежа<br/>
								<xsl:choose>
									<xsl:when test="tpo:TotalCost and number(tpo:TotalCost) &gt; 0 "><xsl:value-of select="tpo:TotalCost"/></xsl:when>
									<xsl:otherwise>-</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 1pt #000000">6.3. Общая стоимость в долларах США<br/>
								<xsl:choose>
									<xsl:when test="tpo:DollarTotalCost and number(tpo:DollarTotalCost) &gt; 0"><xsl:value-of select="tpo:DollarTotalCost"/></xsl:when>
									<xsl:otherwise>-</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">6.4. Общая стоимость в евро<br/>
								<xsl:choose>
									<xsl:when test="tpo:EuroTotalCost and number(tpo:EuroTotalCost) &gt; 0"><xsl:value-of select="tpo:EuroTotalCost"/></xsl:when>
									<xsl:otherwise>-</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<xsl:choose>
							<xsl:when test="tpo:Goods">
								<xsl:apply-templates select="tpo:Goods[1]"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="." mode="noGoods"/>
							</xsl:otherwise>
						</xsl:choose>
						<tr>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">9. Подпись сотрудника таможни<br/>
								<xsl:value-of select="tpo:CustomsPersonName/cat_ru:PersonSurname"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tpo:CustomsPersonName/cat_ru:PersonName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tpo:CustomsPersonName/cat_ru:PersonMiddleName"/>
								<xsl:if test="tpo:CustomsPersonName/tpo:LNP"> (<xsl:value-of select="tpo:CustomsPersonName/tpo:LNP"/>)</xsl:if>
							</td>
							<td class="graph" colspan="4" style="border:solid 1pt #000000">10. Подпись лица, принявшего платеж<br/>
								<xsl:if test="tpo:ReceiverPerson">
									<xsl:value-of select="tpo:ReceiverPerson/cat_ru:PersonSurname"/> 
					<xsl:value-of select="tpo:ReceiverPerson/cat_ru:PersonName"/> 
					</xsl:if>
								<xsl:if test="tpo:ReceiverPerson/cat_ru:PersonMiddleName">
									<xsl:value-of select="tpo:ReceiverPerson/cat_ru:PersonMiddleName"/>
								</xsl:if>
								<!--xsl:if test="tpo:ReceiverPerson/cat_ru:PersonPost">, <xsl:value-of select="tpo:ReceiverPerson/cat_ru:PersonPost"/>
								</xsl:if-->
							</td>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">11. Подпись плательщика<br/>
								<xsl:if test="tpo:Payer/cat_ru:OrganizationName">
									<xsl:value-of select="tpo:Payer/cat_ru:OrganizationName"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph" style="border:solid 1pt #000000">1</td>
							<td align="center" class="graph" colspan="4" style="border:solid 1pt #000000">Экземпляр для таможни</td>
							<td align="center" class="graph" style="border:solid 1pt #000000">1</td>
							<td colspan="4" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;"> </td>
						</tr>
					</table>
				</div>
				<xsl:for-each select="tpo:Goods[position()!=1and (position()) mod 3 = 2]">
					<!--[(position()) mod 3 = 2 and (position()) mod 3 = 0 and (position()) mod 3 = 1 and ]-->
					<div class="page">
						<table>
							<tr>
								<td class="graph" colspan="5" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #000000;">Добавочный лист таможенного приходного ордера</td>
								<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">2. Доб.лист<br/>
									<!--<xsl:if test="//tpo:AdditionalSheetNumber"><xsl:value-of select="//tpo:AdditionalSheetNumber"/></xsl:if>-->
									<xsl:value-of select="tpo:AddPageNumberl"/>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="5" style="border:solid 1pt #000000">3. Справочный номер<br/>
									<xsl:value-of select="../tpo:TPORegNumber/tpo:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="../tpo:TPORegNumber/tpo:RegistrationDate"/>
									</xsl:call-template>/<xsl:value-of select="../tpo:TPORegNumber/tpo:DocNumber"/>
								</td>
							</tr>
							<xsl:apply-templates select="."/>
							<xsl:apply-templates select="following-sibling::tpo:Goods[1]"/>
							<xsl:apply-templates select="following-sibling::tpo:Goods[2]"/>
							<tr>
								<td class="graph" colspan="3" style="border:solid 1pt #000000">9. Подпись сотрудника таможни<br/>
									<xsl:value-of select="../tpo:CustomsPersonName/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="../tpo:CustomsPersonName/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="../tpo:CustomsPersonName/cat_ru:PersonMiddleName"/>
									<xsl:if test="../tpo:CustomsPersonName/tpo:LNP"> (<xsl:value-of select="../tpo:CustomsPersonName/tpo:LNP"/>)</xsl:if>
								</td>
								<td class="graph" colspan="7" style="border:solid 1pt #000000">11. Подпись плательщика<br/>
									<xsl:if test="../tpo:Payer/cat_ru:OrganizationName">
										<xsl:value-of select="../tpo:Payer/cat_ru:OrganizationName"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph" style="border:solid 1pt #000000">1</td>
								<td align="center" class="graph" colspan="4" style="border:solid 1pt #000000">Экземпляр для таможни</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">1</td>
								<td colspan="4" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;"> </td>
							</tr>
						</table>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="tpo:Vehicle">
		<br/>
		<xsl:text>ТС: </xsl:text>
		<xsl:if test="tpo:TransportCategoryCode">
			<xsl:text>Код категории </xsl:text>
			<xsl:value-of select="tpo:TransportCategoryCode"/>
		</xsl:if>
		<xsl:if test="tpo:PersonalUseIndicator = 'true' or tpo:PersonalUseIndicator = 1">
			<xsl:text>, личный автомобиль</xsl:text>
		</xsl:if>
		<xsl:if test="tpo:EngineTypeIndicator = 'true' or tpo:EngineTypeIndicator = 1">
			<xsl:text>, двигатель электрический</xsl:text>
		</xsl:if>
		<xsl:if test="tpo:TempImpIndicator = 'true' or tpo:TempImpIndicator = 1">
			<xsl:text>, временный ввоз</xsl:text>
		</xsl:if>
		<xsl:if test="tpo:STrIndicator = 'true' or tpo:STrIndicator = 1">
			<xsl:text>, седельный тягач</xsl:text>
		</xsl:if>
		<xsl:if test="tpo:SpecTransportIndicator = 'true' or tpo:SpecTransportIndicator = 1">
			<xsl:text>, спец.ТС</xsl:text>
		</xsl:if>
		<xsl:if test="tpo:SpecTrfnsportIndicator = 'true' or tpo:SpecTrfnsportIndicator = 1">
			<xsl:text>, автобетоносмеситель </xsl:text>
		</xsl:if>
		<xsl:if test="tpo:EngineVolumeQuanity">
			<xsl:text>, объем двигателя (куб.см) </xsl:text>
			<xsl:value-of select="tpo:EngineVolumeQuanity"/>
		</xsl:if>
		<xsl:if test="tpo:EnginePower">
			<xsl:text>, мощность двигателя (л.с.) </xsl:text>
			<xsl:value-of select="tpo:EnginePower"/>
		</xsl:if>
		<xsl:if test="tpo:TotalWeight">
			<xsl:text>, полная масса (т) </xsl:text>
			<xsl:value-of select="tpo:TotalWeight"/>
		</xsl:if>
		<xsl:if test="tpo:VehicleProdDate">
			<xsl:text>, дата производства </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="tpo:VehicleProdDate/tpo:ManufactureDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="tpo:VehicleProdDate/tpo:ManufactureYear"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="tpo:VehicleProdDate/tpo:ManufactureMonth"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tpo:Chassis">
		<br/>
		<xsl:text>Шасси ТС </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="tpo:ManufactureDate"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tpo:ManufactureYear"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tpo:ManufactureMonth"/>
		<xsl:if test="tpo:TotalWeight">
			<xsl:text> полная масса (т) / грузоподъемность (т) </xsl:text>
			<xsl:value-of select="tpo:TotalWeight"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tpo:Trailer">
		<br/>
		<xsl:text>Прицепы </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="tpo:ManufactureDate"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tpo:ManufactureYear"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tpo:ManufactureMonth"/>
		<xsl:if test="tpo:TotalWeight">
			<xsl:text> полная масса (т) / грузоподъемность (т) </xsl:text>
			<xsl:value-of select="tpo:TotalWeight"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tpo:AdditionalInformationDetails">
		<xsl:if test="tpo:CRTaxAllowanceCode">
			<xsl:text>Признак наличия льготы: </xsl:text>
			<xsl:value-of select="tpo:CRTaxAllowanceCode"/>
			<br/>
		</xsl:if>
		<xsl:if test="tpo:PresentedDocument">
			<xsl:text>Представляемые документы</xsl:text>
			<br/>
			<xsl:for-each select="tpo:PresentedDocument">
				<xsl:if test="position()!=1"><br/></xsl:if>
				<xsl:apply-templates mode="doc" select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="tpo:PreviousDocDocDetails">
			<br/>
			<xsl:text>Предшествующие документы:</xsl:text>
			<xsl:for-each select="tpo:PreviousDocDocDetails">
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="tpo:PTD">
			<br/>
			<xsl:text>Таможенный документ, на основании которого составлен ТПО:</xsl:text>
			<xsl:apply-templates mode="GTDID" select="tpo:PTD"/>
		</xsl:if>
		<xsl:if test="tpo:AdditionalInfoText">
			<br/>
			<xsl:apply-templates select="tpo:AdditionalInfoText"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tpo:PreviousDocDocDetails">
		<xsl:value-of select="tpo:CountryN3Code"/>
		<xsl:if test="tpo:CustomsReceiptIdDetails">
			<xsl:text> </xsl:text>
			<xsl:text> Номер ТПО: </xsl:text>
			<xsl:apply-templates mode="reg_num" select="tpo:CustomsReceiptIdDetails"/>
		</xsl:if>
		<xsl:if test="tpo:CustomsDeclarationIdDetails">
			<xsl:text> Номер ТД: </xsl:text>
			<xsl:apply-templates mode="reg_num" select="tpo:CustomsDeclarationIdDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:if test="tpo:PresentedDocumentModeCode">
			<xsl:value-of select="tpo:PresentedDocumentModeCode"/>
			<xsl:text>:</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/> </xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:value-of select="*[position()=1]"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="*[position()=2]"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="*[position()=3]"/>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tpo:Payer">
		<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
		<xsl:if test="position()!=1">
			<br/>
		</xsl:if>
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<br/>
		Код страны:
		<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<br/>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<br/>
		Наименование ОПФ:
		<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<br/>
		УИТН:
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<br/>
		УИ ФЛ:
		<xsl:apply-templates select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails|tpo:TPOAddress">
			<br/>
			<!--span class="header">Адрес: <br/>
			</span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each-->
			<xsl:apply-templates select="tpo:TPOAddress">
				<xsl:with-param name="personIndicator" select="tpo:PersonIDIndicator"/>
			</xsl:apply-templates>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<br/>
			<span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<br/>
			<span>ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<br/>
			<span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<br/>
			<span>УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<br/>
			<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<br/>
			<span>БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<br/>
			<span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<br/>
			<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<span class="header">
			<xsl:text> Документ, удостоверяющий личность: </xsl:text>
		</span>
		<br/>
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails|tpo:TPOAddress">
		<xsl:param name="personIndicator"/>
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес постоянного проживания: </xsl:when><!--Адрес регистрации-->
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Адрес временного проживания: </xsl:when><!--Фактический адрес-->
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
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
					<xsl:if test="local-name()='Room'">
						<xsl:choose>
							<xsl:when test="$personIndicator='1' or translate(substring($personIndicator,1, 1), 't', 'T') = 'T'">кв. </xsl:when>
							<xsl:otherwise>оф. </xsl:otherwise>
						</xsl:choose>
					</xsl:if>
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
								<xsl:when test=".='1'">Адрес постоянного проживания: </xsl:when><!--Адрес регистрации-->
								<xsl:when test=".='2'">Адрес временного проживания: </xsl:when><!--Фактический адрес-->
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
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
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="header">Документ, удостоверяющий личность:</span>
		<br/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
			Серия номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
		<br/>
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
	<xsl:template match="*" mode="noGoods">
		<xsl:variable name="mainTPO" select="."/>
		<tr>
			<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">6.5. Описание товара<br/>-
			</td>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.6. Код товара<br/>-
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.7. Вес товара (кг)<br/>-
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.8. Количество<br/>
				<xsl:for-each select="tpo:SupplementaryQuantity">
					<xsl:if test="position() &gt; 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates mode="quantity" select="."/>
				</xsl:for-each>
				<xsl:if test="not(tpo:SupplementaryQuantity)">-</xsl:if>
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.9.<br/>
				<xsl:if test="tpo:AdditionalInformation">
					<xsl:value-of select="tpo:AdditionalInformation"/>
				</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
				<xsl:if test="not(tpo:AdditionalInformation)">-</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">7. Наименование взимаемых платежей<br/>
				<xsl:for-each select="tpo:CommonPaymentDetails/tpo:PaymentDetails">
					<xsl:value-of select="catESAD_cu:PaymentModeCode"/> 
					<xsl:value-of select="tpo:PaymentName"/>
					<br/>
				</xsl:for-each>
				<xsl:if test="not(tpo:CommonPaymentDetails/tpo:PaymentDetails)">-</xsl:if>
			</td>
			<td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
			7.1. Стоимость товаров
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в валюте платежа<br/>
				<xsl:value-of select="tpo:Cost"/>
				<xsl:if test="not(tpo:Cost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
				
			</td>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в долларах США<br/>
				<xsl:value-of select="tpo:DollarCost"/>
				<xsl:if test="not(tpo:DollarCost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в евро<br/>
				<xsl:value-of select="tpo:EuroCost"/>
				<xsl:if test="not(tpo:EuroCost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph" rowspan="3" style="border:solid 1pt #000000">8. Платежи</td>
			<td class="graph" colspan="9" style="border:solid 1pt #000000">
				<table border="0pt #ffffff">
					<tr>
						<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Вид</td>
						<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Основа начисления</td>
						<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Ставка</td>
						<td align="center" class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Исчисленная сумма</td>
						<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">СП</td>
						<td align="center" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">Подробности уплаты</td>
					</tr>
					<xsl:variable name="status" select="tpo:TPOStatus"/>
					<xsl:variable name="payerINN">
						<xsl:choose>
							<xsl:when test="tpo:Payer[tpo:FactPayerIndicator = '1' or translate(tpo:FactPayerIndicator,'TRUE', 'true') = 'true'][1]">
								<xsl:for-each select="tpo:Payer[tpo:FactPayerIndicator = '1' or translate(tpo:FactPayerIndicator,'TRUE', 'true') = 'true'][1]">
									<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN|cat_ru:RKOrganizationFeatures/cat_ru:IIN|cat_ru:RBOrganizationFeatures/cat_ru:RAOrganizationFeatures/cat_ru:UNN|cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="tpo:Payer[1]">
									<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN|cat_ru:RKOrganizationFeatures/cat_ru:IIN|cat_ru:RBOrganizationFeatures/cat_ru:RAOrganizationFeatures/cat_ru:UNN|cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<!-- xsl:when test="tpo:UtilSign = 'true' or tpo:UtilSign = '1'" -->
						<xsl:when test="tpo:TPOSign = '1'">
							<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
								<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:PaymentDetails/catESAD_cu:PaymentModeCode"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<xsl:if test="tpo:NoGoodsDetails/tpo:GoodsNumber">
										<xsl:value-of select="tpo:NoGoodsDetails/tpo:GoodsNumber"/>
										<xsl:text> ТС </xsl:text>
									</xsl:if>
									<!--xsl:if test="tpo:NoGoodsDetails/tpo:Distance">
										<xsl:text> на </xsl:text>
										<xsl:value-of select="tpo:NoGoodsDetails/tpo:Distance"/>
										<xsl:text> км </xsl:text>
									</xsl:if-->
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<xsl:for-each select="tpo:CommonPaymentDetails/tpo:PaymentDetails/tpo:RateDetails">
										<xsl:if test="position()!=1"><br/></xsl:if>
										<xsl:value-of select="tpo:DutyTaxFeeRateValue"/>
										<xsl:apply-templates select="tpo:UnifiedCurrencyN3Code" mode="currencyCodeToName"/>
									</xsl:for-each>
								</td>
								<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:PaymentDetails/catESAD_cu:PaymentAmount"/>
									<xsl:if test="(position() = last()) and ($mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount)">
										<br/>
										<xsl:text>ИТОГО </xsl:text>
										<xsl:value-of select="$mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount"/>
										<xsl:text> РУБ</xsl:text>
									</xsl:if>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
								ИУ
								</td>
								<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
									<xsl:if test="$status = '1'">
										<xsl:for-each select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="paymentDetails">
												<xsl:with-param name="payerINN" select="$payerINN"/>
											</xsl:apply-templates>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="tpo:TPOSign = '2'">
							<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
								<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:PaymentDetails/catESAD_cu:PaymentModeCode"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<xsl:if test="tpo:NoGoodsDetails/tpo:GoodsGrossWeight">
										<xsl:value-of select="tpo:NoGoodsDetails/tpo:GoodsGrossWeight"/>
										<xsl:text> кг </xsl:text>
									</xsl:if>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<!--xsl:choose>
										<xsl:when test="tpo:NoGoodsDetails/tpo:Periods/tpo:CBRate">
											<xsl:value-of select="tpo:NoGoodsDetails/tpo:Periods/tpo:CBRate"/>
											<xsl:text> / 360</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
										</xsl:otherwise>
									</xsl:choose-->
									<xsl:for-each select="tpo:CommonPaymentDetails/tpo:PaymentDetails/tpo:RateDetails">
										<xsl:if test="position()!=1"><br/></xsl:if>
										<xsl:value-of select="tpo:DutyTaxFeeRateValue"/>
										<xsl:text> руб/100кг</xsl:text>
									</xsl:for-each>
									
								</td>
								<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:PaymentDetails/catESAD_cu:PaymentAmount"/>
									<xsl:if test="(position() = last()) and ($mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount)">
										<br/>
										<xsl:text>ИТОГО </xsl:text>
										<xsl:value-of select="$mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount"/>
										<xsl:text> РУБ</xsl:text>
									</xsl:if>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
								ИУ
								</td>
								<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
									<xsl:if test="$status = '1'">
										<xsl:for-each select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="paymentDetails">
												<xsl:with-param name="payerINN" select="$payerINN"/>
											</xsl:apply-templates>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="tpo:TPOSign = '3'">
							<xsl:for-each select="tpo:CommonPaymentDetails/tpo:PaymentDetails">
							
								<xsl:variable name="periodNumber" select="tpo:PeriodNumber"/>
								<xsl:variable name="paymentModeCode" select="catESAD_cu:PaymentModeCode"/>
								<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
									<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
										<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:value-of select="$mainTPO/tpo:NoGoodsDetails/tpo:PaymentsForPeriod[tpo:PaymentModeCode = $paymentModeCode]/tpo:TaxBase"/>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:value-of select="$mainTPO/tpo:NoGoodsDetails/tpo:Periods[tpo:PeriodNumber = $periodNumber]/tpo:CBRate"/>
										<xsl:text> %</xsl:text>
									</td>
									<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
										<xsl:value-of select="catESAD_cu:PaymentAmount"/>
										<xsl:if test="(position() = last()) and ($mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount)">
											<br/>
											<xsl:text>ИТОГО </xsl:text>
											<xsl:value-of select="$mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount"/>
											<xsl:text> РУБ</xsl:text>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										ИУ
									</td>
									<xsl:if test="position() = 1">
										<xsl:variable name="rowspan">
											<xsl:choose>
												<xsl:when test="count($mainTPO/tpo:CommonPaymentDetails/tpo:PaymentDetails) > 0">
													<xsl:value-of select="count($mainTPO/tpo:CommonPaymentDetails/tpo:PaymentDetails)"/>
												</xsl:when>
												<xsl:otherwise>1</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<td rowspan="{$rowspan}" align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
											<xsl:if test="$status = '1'">
												<xsl:for-each select="$mainTPO/tpo:CommonPaymentDetails/tpo:FactPaymentDetails">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="paymentDetails">
														<xsl:with-param name="payerINN" select="$payerINN"/>
													</xsl:apply-templates>
												</xsl:for-each>
											</xsl:if>
										</td>
									</xsl:if>
								</tr>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="tpo:TPOSign = '9'">
							<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
								<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:PaymentDetails/catESAD_cu:PaymentModeCode"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:PaymentDetails/tpo:TaxBase"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<xsl:for-each select="tpo:CommonPaymentDetails/tpo:PaymentDetails/tpo:RateDetails">
										<xsl:if test="position()!=1"><br/></xsl:if>
										<xsl:value-of select="tpo:DutyTaxFeeRateValue"/>
										<xsl:choose>
											<xsl:when test="tpo:DutyTaxFeeRateKindCode = '%'">
												<xsl:text> %</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="tpo:UnifiedCurrencyN3Code" mode="currencyCodeToName"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</td>
								<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:PaymentDetails/catESAD_cu:PaymentAmount"/>
									<xsl:if test="(position() = last()) and ($mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount)">
										<br/>
										<xsl:text>ИТОГО </xsl:text>
										<xsl:value-of select="$mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount"/>
										<xsl:text> РУБ</xsl:text>
									</xsl:if>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									ИУ
								</td>
								<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
									<xsl:if test="$status = '1'">
										<xsl:for-each select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="paymentDetails">
												<xsl:with-param name="payerINN" select="$payerINN"/>
											</xsl:apply-templates>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
								<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
									<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
								</td>
								<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
									<xsl:value-of select="catESAD_cu:PaymentAmount"/>
									<xsl:if test="(position() = last()) and ($mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount)">
										<br/>
										<xsl:text>ИТОГО </xsl:text>
										<xsl:value-of select="$mainTPO/tpo:CommonPaymentDetails/tpo:TotalAmount"/>
										<xsl:text> РУБ</xsl:text>
									</xsl:if>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									ИУ
								</td>
								<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
									<xsl:for-each select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="." mode="paymentDetails">
											<xsl:with-param name="payerINN" select="$payerINN"/>
										</xsl:apply-templates>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
			</td>
		</tr>
		<tr>
			<td class="graph" rowspan="2" style="border:solid 1pt #000000">8.1. Всего подлежит уплате</td>
			<td class="graph" style="border:solid 1pt #000000">цифрами</td>
			<td align="center" class="graph" colspan="7" style="border:solid 1pt #000000">
				<xsl:value-of select="tpo:CommonPaymentDetails/tpo:TotalAmount"/>
			</td>
		</tr>
		<tr>
			<td class="graph" style="border:solid 1pt #000000">прописью</td>
			<td align="center" class="graph" colspan="7" style="border:solid 1pt #000000">
				<xsl:value-of select="tpo:CommonPaymentDetails/tpo:AmountLetter"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="tpo:Goods[1]">
		<xsl:variable name="TPO" select="./.."/>
		<xsl:variable name="MP" select="../tpo:TPOTypeCode/tpo:MovementPurpose"/>
		<tr>
			<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">6.5. Описание товара<br/>
			<xsl:choose>
				<xsl:when test="$MP != 'АС' and $MP != 'УС'">
					<xsl:for-each select="tpo:GoodsDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()"> </xsl:if>
					</xsl:for-each>
					<xsl:if test="tpo:OriginCountryCode"> (страна: <xsl:value-of select="tpo:OriginCountryCode"/>)</xsl:if>
					<!--(<xsl:value-of select="tpo:GoodsTNVEDCode"/>)-->
					<br/>
					<xsl:if test="tpo:AutomobileInfo">Сведения о транспортном средстве:<br/>
					</xsl:if>
					<xsl:for-each select="tpo:AutomobileInfo">
						<xsl:value-of select="position()"/>.
						<xsl:if test="tpo:Model">Модель:<xsl:value-of select="tpo:Model"/>
						   ;
						</xsl:if>
								<xsl:if test="tpo:Mark">Марка:<xsl:value-of select="tpo:Mark"/>;
						</xsl:if>
								<!--xsl:if test="tpo:MarkCode">Код марки:<xsl:value-of select="tpo:MarkCode"/>
						   ;
						</xsl:if-->
								<xsl:if test="tpo:OfftakeYear">Год выпуска:<xsl:value-of select="tpo:OfftakeYear"/>
						   ;
						</xsl:if>
								<xsl:if test="tpo:EngineVolumeQuanity">Объем двигателя, куб. см:<xsl:value-of select="tpo:EngineVolumeQuanity"/>
						   ;
						</xsl:if>
								<xsl:if test="tpo:VINID">Идентификационный номер:<xsl:value-of select="tpo:VINID"/>
						   ;
						</xsl:if>
								<xsl:if test="tpo:EnginePower">Мощность двигателя в лошадиных силах:<xsl:value-of select="tpo:EnginePower"/>
						   ;
						</xsl:if>
								<xsl:if test="tpo:EnginePowerKVt">Мощность двигателя в КВт:<xsl:value-of select="tpo:EnginePowerKVt"/>
						   ;
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="tpo:AddGoodsDescriptionDetails">
						<br/>
						<xsl:text>Дополнительные сведения о товаре:</xsl:text>
						<xsl:apply-templates select="tpo:AddGoodsDescriptionDetails"/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="$MP = 'УС'">
							<!--
							<xsl:if test="tpo:GoodsDescription">
								<xsl:apply-templates select="tpo:GoodsDescription"/>
								<br/>
							</xsl:if>
							<xsl:text> VIN: </xsl:text>
							<xsl:apply-templates select="tpo:AutomobileInfo/tpo:VINID"/>
							<xsl:if test="not(tpo:AutomobileInfo/tpo:VINID)">отсуствует</xsl:if>
							<br/>
							<xsl:text> Марка:</xsl:text>
							<xsl:apply-templates select="tpo:AutomobileInfo/tpo:Mark"/>
							<xsl:if test="not(tpo:AutomobileInfo/tpo:Mark)">отсуствует</xsl:if>
							<br/>
							<xsl:text> Модель:</xsl:text>
							<xsl:apply-templates select="tpo:AutomobileInfo/tpo:Model"/>
							<xsl:if test="not(tpo:AutomobileInfo/tpo:Model)">отсуствует</xsl:if>
							<br/>
							<xsl:text> Дата выпуска: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailer/*[contains(local-name(),'Manufact')]">
									<xsl:apply-templates select="tpo:UtilCollDetails/tpo:ChassisOrTrailer" mode="manufactureDateMY"/>
								</xsl:when>
								<xsl:when test="tpo:AutomobileInfo">
									<xsl:apply-templates select="tpo:AutomobileInfo" mode="manufactureDateMY"/>
								</xsl:when>
								<xsl:otherwise>отсуствует</xsl:otherwise>
							</xsl:choose>
							<br/>
							<xsl:text> Категория: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TransportCategoryCode | tpo:UtilCollDetails/tpo:Vehicle/tpo:UCTransportCategoryCode">
									<xsl:apply-templates select="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TransportCategoryCode | tpo:UtilCollDetails/tpo:Vehicle/tpo:UCTransportCategoryCode"/>
								</xsl:when>
								<xsl:when test="tpo:AutomobileInfo/tpo:TransportCategoryCode">
									<xsl:apply-templates select="tpo:AutomobileInfo/tpo:TransportCategoryCode"/>
								</xsl:when>
								<xsl:otherwise>отсутствует</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$TPO/tpo:Goods/tpo:UtilCollDetails/tpo:ChassisOrTrailerCode = 2">
									<br/>
									<xsl:text> объем двигателя: отсутствует </xsl:text>
									<br/>
									<xsl:text> модель/номер двигателя: отсутствует </xsl:text>
									<br/>
									<xsl:text> тип двигателя: отсутствует </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<br/>
									<xsl:text> объем двигателя: </xsl:text>
									<xsl:value-of select="tpo:AutomobileInfo/tpo:EngineVolumeQuanity"/>
									<xsl:if test="not(tpo:AutomobileInfo/tpo:EngineVolumeQuanity)">отсутствует</xsl:if>
									<br/>
									<xsl:text> модель/номер двигателя: </xsl:text>
									<xsl:if test="tpo:AutomobileInfo/tpo:EngineModel|tpo:AutomobileInfo/tpo:EngineId">
										<xsl:value-of select="tpo:AutomobileInfo/tpo:EngineModel"/>/<xsl:value-of select="tpo:AutomobileInfo/tpo:EngineId"/>
									</xsl:if>
									<xsl:if test="not(tpo:AutomobileInfo/tpo:EngineModel)">отсутствует</xsl:if>
									<br/>
									<xsl:text> тип двигателя: </xsl:text>
										<xsl:variable name="engineKind" select="tpo:AutomobileInfo/tpo:EngineKindCode"/>
										<xsl:if test="string($engineKind) != ''">
											<xsl:choose>
												<xsl:when test="$engineKind = 1">бензиновый</xsl:when>
												<xsl:when test="$engineKind = 2">дизельный</xsl:when>
												<xsl:when test="$engineKind = 3">электрический</xsl:when>
												<xsl:when test="$engineKind = 4">гибридный на основе бензинового</xsl:when>
												<xsl:when test="$engineKind = 5">гибридный на основе дизельного</xsl:when>
												<xsl:when test="$engineKind = 6">конв. для работы на газе</xsl:when>
												<xsl:otherwise>иной</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="not(tpo:AutomobileInfo/tpo:EngineKindCode)">отсутствует</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<br/>
							<xsl:text> грузоподъемность: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TotalWeight">
									<xsl:value-of select="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TotalWeight"/>
								</xsl:when>
								<xsl:when test="tpo:AutomobileInfo/tpo:TransportCarryingCapacityMeasure">
									<xsl:value-of select="tpo:AutomobileInfo/tpo:TransportCarryingCapacityMeasure"/>
								</xsl:when>
								<xsl:otherwise>отсутствует</xsl:otherwise>
							</xsl:choose>
							-->
							<xsl:text>Дата выпуска: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailerCode">
									<xsl:apply-templates select="tpo:UtilCollDetails/tpo:ChassisOrTrailer" mode="manufactureDate"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="tpo:AutomobileInfo" mode="manufactureDate"/>
								</xsl:otherwise>
							</xsl:choose>
							<br/>
							<xsl:text>Категория: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:Vehicle/tpo:UCTransportCategoryCode">
									<xsl:value-of select="tpo:UtilCollDetails/tpo:Vehicle/tpo:UCTransportCategoryCode"/>
								</xsl:when>
								<xsl:otherwise>отсутствует</xsl:otherwise>
							</xsl:choose>
							<br/>
							<xsl:text>Грузоподъемность: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailerCode">
									<xsl:value-of select="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TotalWeight"/>
								</xsl:when>
								<xsl:when test="tpo:AutomobileInfo/tpo:TransportCarryingCapacityMeasure">
									<xsl:value-of select="tpo:AutomobileInfo/tpo:TransportCarryingCapacityMeasure"/>
								</xsl:when>
								<xsl:otherwise>отсутствует</xsl:otherwise>
							</xsl:choose>
							<br/>
							<xsl:text>Мощность: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:AutomobileInfo/tpo:EnginePower or tpo:AutomobileInfo/tpo:EnginePowerKVt">
									<xsl:if test="tpo:AutomobileInfo/tpo:EnginePower">
										<xsl:value-of select="tpo:AutomobileInfo/tpo:EnginePower"/>
										<xsl:text> л.с.</xsl:text>
									</xsl:if>
									<xsl:if test="tpo:AutomobileInfo/tpo:EnginePower and tpo:AutomobileInfo/tpo:EnginePowerKVt"> / </xsl:if>
									<xsl:if test="tpo:AutomobileInfo/tpo:EnginePowerKVt">
										<xsl:value-of select="tpo:AutomobileInfo/tpo:EnginePowerKVt"/>
										<xsl:text> КВт</xsl:text>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>отсутствует</xsl:otherwise>
							</xsl:choose>
							<br/>
							<xsl:text>Объем двигателя: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:AutomobileInfo/tpo:EngineVolumeQuanity">
									<xsl:value-of select="tpo:AutomobileInfo/tpo:EngineVolumeQuanity"/>
								</xsl:when>
								<xsl:otherwise>отсутствует</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$MP = 'АС'">
							<xsl:apply-templates select="tpo:GoodsDescription"/>
							<!--br/>
							<xsl:text>Код ТН ВЭД: </xsl:text><xsl:value-of select="tpo:GoodsTNVEDCode"/>
							<br/>
							<xsl:text>Кол-во: </xsl:text>
							<xsl:for-each select="tpo:SupplementaryQuantity">
								<xsl:if test="position() &gt; 1">
									<br/>
								</xsl:if>
								<xsl:apply-templates mode="quantity" select="."/>
							</xsl:for-each-->
							<br/>
							<xsl:text> Стоимость в рублях: </xsl:text><xsl:value-of select="tpo:RubleCost"/>
							<br/>
							<xsl:text> Стоимость в валюте договора: </xsl:text>
							<xsl:for-each select="tpo:ContractCost/*">
								<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
								<xsl:value-of select="."/>
							</xsl:for-each>
							<!--br/>
								<xsl:text> Марки: </xsl:text>
								<xsl:for-each select="tpo:StampsDetails">
									<xsl:choose>
										<xsl:when test="tpo:StampsType = 1">акцизные</xsl:when>
										<xsl:when test="tpo:StampsType = 2">федеральные специальные</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:text>Кол-во: </xsl:text><xsl:value-of select="tpo:StampsSeriesNumber/catESAD_cu:ExciseQuantity"/>
									<xsl:if test="tpo:StampsSeriesNumber/catESAD_cu:ExciseSerieses">
										<br/>
										<xsl:text>Серия: </xsl:text><xsl:value-of select="tpo:StampsSeriesNumber/catESAD_cu:ExciseSerieses"/>
									</xsl:if>
									<xsl:if test="tpo:StampsSeriesNumber/catESAD_cu:ExciseList">
										<xsl:text> Номера: </xsl:text>
										<xsl:for-each select="tpo:StampsSeriesNumber/catESAD_cu:ExciseList/catESAD_cu:ExciseNumber">
											<xsl:if test="position()!=1">, </xsl:if>
											<xsl:value-of select="."/>
										</xsl:for-each>
									</xsl:if>
									<br/>
									<xsl:text>Дата принятия товара: </xsl:text><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="tpo:GoodsRegDate"/></xsl:call-template>
								</xsl:for-each-->
						</xsl:when>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			</td>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.6. Код товара<br/>
				<xsl:choose>
					<xsl:when test="tpo:GoodsTNVEDCode"><xsl:value-of select="tpo:GoodsTNVEDCode"/></xsl:when>
					<xsl:otherwise>-</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.7. Вес товара (кг)<br/>
				<xsl:choose>
					<xsl:when test="tpo:GoodsGrossWeight"><xsl:value-of select="tpo:GoodsGrossWeight"/></xsl:when>
					<xsl:otherwise>-</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.8. Количество<br/>
				<xsl:if test="$MP != 'УС'">
					<xsl:for-each select="tpo:SupplementaryQuantity">
						<xsl:if test="position() &gt; 1">
							<br/>
						</xsl:if>
						<xsl:apply-templates mode="quantity" select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="not(tpo:SupplementaryQuantity)">-</xsl:if>
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.9.<br/>
				<xsl:if test="$MP != 'АС' and $MP != 'УС'">
					<xsl:if test="tpo:AdditionalInformation">
						<xsl:value-of select="tpo:AdditionalInformation"/>
					</xsl:if>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:if>
				<!--xsl:if test="$MP = 'УС'">
					Номер товара <xsl:apply-templates select="." mode="graph69"/>
				</xsl:if-->
				<xsl:if test="not(tpo:AdditionalInformation)">-</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">7. Наименование взимаемых платежей<br/>
				<xsl:for-each select="tpo:PaymentInfo/tpo:PaymentInfoDetails/tpo:PaymentModeCode[not(.=preceding-sibling::tpo:PaymentModeCode)]">
					<xsl:value-of select="."/> 
						<xsl:value-of select="../tpo:PaymentName"/>
					<br/>
				</xsl:for-each>
				<xsl:if test="not(tpo:PaymentInfo/tpo:PaymentInfoDetails/tpo:PaymentModeCode[not(.=preceding-sibling::tpo:PaymentModeCode)])">-</xsl:if>
			</td>
			<td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
						7.1. Стоимость товаров
						</td>
		</tr>
		<tr>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в валюте платежа<br/>
				<xsl:value-of select="tpo:RubleCost"/>
				<xsl:if test="not(tpo:RubleCost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в долларах США<br/>
				<xsl:value-of select="tpo:DollarCost"/>
				<xsl:if test="not(tpo:DollarCost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в евро<br/>
				<xsl:value-of select="tpo:EuroCost"/>
				<xsl:if test="not(tpo:EuroCost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph" rowspan="3" style="border:solid 1pt #000000">8. Платежи</td>
			<td class="graph" colspan="9" style="border:solid 1pt #000000">
				<table border="0pt #ffffff">
					<tr>
						<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Вид</td>
						<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Основа начисления</td>
						<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Ставка</td>
						<td align="center" class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Исчисленная сумма</td>
						<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">СП</td>
						<td align="center" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">Подробности уплаты</td>
					</tr>
					<xsl:variable name="rowcount" select="count(tpo:PaymentInfo/tpo:PaymentInfoDetails)"/>
					<xsl:for-each select="tpo:PaymentInfo/tpo:PaymentInfoDetails">
						<xsl:sort select="tpo:PaymentModeCode" data-type="text" order="ascending"/>
						<!--xsl:choose-->
							<!--<xsl:when test="position()!=last()">-->
							<!--<xsl:for-each select="tpo:PaymentInfo">-->
							<!--xsl:when test="position()!=last() or position() = 1"-->
								<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
									<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
										<xsl:value-of select="tpo:PaymentModeCode"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:choose>
											<xsl:when test="tpo:PaymentModeCode='6020'">
												<xsl:text> </xsl:text>
											</xsl:when>
											<xsl:when test="tpo:PaymentModeCode='1010' and tpo:TaxBase = '1' and tpo:TaxBaseQualifierCode = 'ТАМ.ОПЕРАЦ.'">
												<xsl:text>1 ТАМ.ОПЕРАЦ.</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="tpo:TaxBase"/>
												<xsl:text> </xsl:text>
												<xsl:if test="tpo:PaymentModeCode!='1010'">
													<xsl:choose>
														<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='%'">
															<xsl:call-template name="currency"><xsl:with-param name="value" select="tpo:UnifiedCurrencyN3Code"/></xsl:call-template>
														</xsl:when>
														<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='*'">
															<xsl:value-of select="tpo:TaxBaseQualifierCode"/>
															<xsl:if test="tpo:PaymentModeCode='1010' and not(tpo:TaxBaseQualifierCode)">РУБ</xsl:if>
														</xsl:when>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:choose>
											<xsl:when test="tpo:PaymentModeCode='6020'">
												<xsl:text> </xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
												<xsl:text> </xsl:text>
												<xsl:choose>
													<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='%'">
														<!--xsl:value-of select="tpo:RateDetails/tpo:UnifiedMeasurementUnitCode"/-->
														<xsl:text> %</xsl:text>
													</xsl:when>
													<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='*'">
														<xsl:call-template name="currency"><xsl:with-param name="value" select="tpo:RateDetails/tpo:UnifiedCurrencyN3Code"/></xsl:call-template>
													</xsl:when>
												</xsl:choose>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
										<xsl:value-of select="tpo:CAPaymentAmount"/>
										<xsl:text> РУБ</xsl:text>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
										<xsl:if test="(position() = last()) and ($TPO/tpo:CommonPaymentDetails/tpo:TotalAmount)">
											<br/>
											<xsl:text>ИТОГО </xsl:text>
											<xsl:value-of select="$TPO/tpo:CommonPaymentDetails/tpo:TotalAmount"/>
											<xsl:text> РУБ</xsl:text>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<!--xsl:for-each select="tpo:PaymentDetails">
											<xsl:value-of select="tpo:PaymentWayCode"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each-->
										ИУ
									</td>
									<xsl:variable name="status" select="$TPO/tpo:TPOStatus"/>
									<xsl:variable name="payerINN">
										<xsl:choose>
											<xsl:when test="$TPO/tpo:Payer[tpo:FactPayerIndicator = '1' or translate(tpo:FactPayerIndicator,'TRUE', 'true') = 'true'][1]">
												<xsl:for-each select="$TPO/tpo:Payer[tpo:FactPayerIndicator = '1' or translate(tpo:FactPayerIndicator,'TRUE', 'true') = 'true'][1]">
													<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN|cat_ru:RKOrganizationFeatures/cat_ru:IIN|cat_ru:RBOrganizationFeatures/cat_ru:RAOrganizationFeatures/cat_ru:UNN|cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<xsl:for-each select="$TPO/tpo:Payer[1]">
													<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN|cat_ru:RKOrganizationFeatures/cat_ru:IIN|cat_ru:RBOrganizationFeatures/cat_ru:RAOrganizationFeatures/cat_ru:UNN|cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
												</xsl:for-each>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$payerINN != '' and $status = '1' and position() = 1">
											<!--xsl:variable name="inn" select="tpo:PaymentDetails/tpo:RFOrganizationFeatures/cat_ru:INN"/-->
											<td align="left" class="graph" colspan="3" rowspan="{$rowcount}" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
												
												<!--xsl:for-each select="$TPO//tpo:PaymentInfoDetails[generate-id() = generate-id(key('codes', tpo:PaymentModeCode)[1])]">
													<xsl:sort select="tpo:PaymentModeCode"/>
													<xsl:variable name="modeCode" select="tpo:PaymentModeCode"/>
													<xsl:value-of select="$modeCode"/>
													<xsl:text> - </xsl:text>
													<xsl:value-of select="format-number(sum($TPO//tpo:PaymentInfoDetails[tpo:PaymentModeCode = $modeCode]/tpo:CAPaymentAmount),'0.00')"/>
													<xsl:text> - </xsl:text>
													<xsl:text>643</xsl:text>
													<xsl:text> - </xsl:text>
													<xsl:value-of select="$payerINN"/>
													<br/>
												</xsl:for-each-->
												<xsl:for-each select="$TPO//tpo:CommonPaymentDetails/tpo:FactPaymentDetails">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="paymentDetails">
														<xsl:with-param name="payerINN" select="$payerINN"/>
													</xsl:apply-templates>
												</xsl:for-each>
											</td>
										</xsl:when>
										<xsl:when test="$payerINN = ''">
											<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">

												<xsl:for-each select="tpo:PaymentDetails">
													<xsl:value-of select="tpo:FactPaidAmount"/>
													<!--<xsl:if test="tpo:PaymentMethodCode">(<xsl:value-of select="tpo:PaymentMethodCode"/>)</xsl:if>-->
													<xsl:text> </xsl:text>
													<xsl:if test="tpo:PaymentDocument/tpo:PresentedDocumentModeCode">
														<xsl:value-of select="tpo:PaymentDocument/tpo:PresentedDocumentModeCode"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentName">
														<xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentName"/> </xsl:if>
													<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentNumber">№ <xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentNumber"/> </xsl:if>
													<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentDate">
															(<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="tpo:PaymentDocument/cat_ru:PrDocumentDate"/>
															</xsl:call-template>)
													</xsl:if>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
												
											</td>
										</xsl:when>
									</xsl:choose>
									<!--td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
										<xsl:for-each select="tpo:PaymentDetails">
											<xsl:value-of select="tpo:FactPaidAmount"/-->
											<!--<xsl:if test="tpo:PaymentMethodCode">(<xsl:value-of select="tpo:PaymentMethodCode"/>)</xsl:if>-->
											<!--xsl:text> </xsl:text>
											<xsl:if test="tpo:PaymentDocument/tpo:PresentedDocumentModeCode">
												<xsl:value-of select="tpo:PaymentDocument/tpo:PresentedDocumentModeCode"/>
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentName">
												<xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentName"/> </xsl:if>
											<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentNumber">№ <xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentNumber"/> </xsl:if>
											<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentDate">
													(<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="tpo:PaymentDocument/cat_ru:PrDocumentDate"/>
												</xsl:call-template>)
											</xsl:if>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td-->
								</tr>
							<!--/xsl:when-->
							<!-- </xsl:for-each>-->
							<!--   </xsl:when>-->
							<!-- <xsl:when test="position()=last()">-->
							<!--  <xsl:for-each select="tpo:PaymentInfo">-->
							<!--xsl:when test="position()=last()">
								<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:0pt solid #ffffff;">
									<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0pt solid #ffffff;">
										<xsl:value-of select="tpo:PaymentModeCode"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000;border-bottom:0pt solid #ffffff;">
										<xsl:value-of select="tpo:TaxBase"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000;border-bottom:0pt solid #ffffff;">
										<xsl:value-of select="tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</td>
									<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000;border-bottom:0pt solid #ffffff;">
										<xsl:value-of select="tpo:CAPaymentAmount"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 0pt #000000;border-bottom:0pt solid #ffffff;">
										<xsl:for-each select="tpo:PaymentDetails">
											<xsl:value-of select="tpo:PaymentWayCode"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:0pt solid #ffffff;">
										<xsl:for-each select="tpo:PaymentDetails">
											<xsl:value-of select="tpo:FactPaidAmount"/>
											<xsl:text> </xsl:text>
											<xsl:if test="tpo:PaymentDocument/tpo:PresentedDocumentModeCode">
												<xsl:value-of select="tpo:PaymentDocument/tpo:PresentedDocumentModeCode"/>
											</xsl:if>
											<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentName">
												<xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentName"/> </xsl:if>
											<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentNumber">№ <xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentNumber"/> </xsl:if>
											<xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentDate">
						(<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="tpo:PaymentDocument/cat_ru:PrDocumentDate"/>
												</xsl:call-template>)</xsl:if>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:when-->
							<!--  </xsl:when>-->
						<!--/xsl:choose-->
					</xsl:for-each>
				</table>
			</td>
		</tr>
		<tr>
			<td class="graph" rowspan="2" style="border:solid 1pt #000000">8.1. Всего подлежит уплате</td>
			<td class="graph" style="border:solid 1pt #000000">цифрами</td>
			<td align="center" class="graph" colspan="7" style="border:solid 1pt #000000">
				<xsl:value-of select="//tpo:TotalAmount"/>
			</td>
		</tr>
		<tr>
			<td class="graph" style="border:solid 1pt #000000">прописью</td>
			<td align="center" class="graph" colspan="7" style="border:solid 1pt #000000">
				<xsl:value-of select="//tpo:AmountLetter"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="tpo:Goods[position()!=1]">
		<xsl:variable name="TPO" select="./.."/>
		<xsl:variable name="MP" select="../tpo:TPOTypeCode/tpo:MovementPurpose"/>
		<tr>
			<td class="graph" colspan="5" rowspan="4" style="border:solid 1pt #000000">6.5. Описание товара<br/>
				<xsl:choose>
					<xsl:when test="$MP != 'АС' and $MP != 'УС'">
						<xsl:for-each select="tpo:GoodsDescription">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"> </xsl:if>
						</xsl:for-each>
						<xsl:if test="tpo:OriginCountryCode"> (страна: <xsl:value-of select="tpo:OriginCountryCode"/>)</xsl:if>
						<!--(<xsl:value-of select="tpo:GoodsTNVEDCode"/>)-->
						<br/>
						<xsl:if test="tpo:AutomobileInfo">Сведения о транспортном средстве:<br/>
						</xsl:if>
						<xsl:for-each select="tpo:AutomobileInfo">
							<xsl:value-of select="position()"/>.
							<xsl:if test="tpo:Model">Модель:<xsl:value-of select="tpo:Model"/>
							   ;
							</xsl:if>
									<xsl:if test="tpo:Mark">Марка:<xsl:value-of select="tpo:Mark"/>;
							</xsl:if>
									<!--xsl:if test="tpo:MarkCode">Код марки:<xsl:value-of select="tpo:MarkCode"/>
							   ;
							</xsl:if-->
									<xsl:if test="tpo:OfftakeYear">Год выпуска:<xsl:value-of select="tpo:OfftakeYear"/>
							   ;
							</xsl:if>
									<xsl:if test="tpo:EngineVolumeQuanity">Объем двигателя, куб. см:<xsl:value-of select="tpo:EngineVolumeQuanity"/>
							   ;
							</xsl:if>
									<xsl:if test="tpo:VINID">Идентификационный номер:<xsl:value-of select="tpo:VINID"/>
							   ;
							</xsl:if>
									<xsl:if test="tpo:EnginePower">Мощность двигателя в лошадиных силах:<xsl:value-of select="tpo:EnginePower"/>
							   ;
							</xsl:if>
									<xsl:if test="tpo:EnginePowerKVt">Мощность двигателя в КВт:<xsl:value-of select="tpo:EnginePowerKVt"/>
							   ;
							</xsl:if>
						</xsl:for-each>
						<xsl:if test="tpo:AddGoodsDescriptionDetails">
							<br/>
							<xsl:text>Дополнительные сведения о товаре:</xsl:text>
							<xsl:apply-templates select="tpo:AddGoodsDescriptionDetails"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$MP = 'УС'">
							<!--xsl:apply-templates select="tpo:UtilCollDetails/tpo:Sign"/>
							<br/-->
							<xsl:if test="tpo:GoodsDescription">
								<!--xsl:text>Наименование: </xsl:text-->
								<xsl:apply-templates select="tpo:GoodsDescription"/>
								<br/>
							</xsl:if>
							<xsl:text> VIN: </xsl:text>
							<xsl:apply-templates select="tpo:AutomobileInfo/tpo:VINID"/>
							<xsl:if test="not(tpo:AutomobileInfo/tpo:VINID)">отсуствует</xsl:if>
							<br/>
							<xsl:text> Марка:</xsl:text>
							<xsl:apply-templates select="tpo:AutomobileInfo/tpo:Mark"/>
							<xsl:if test="not(tpo:AutomobileInfo/tpo:Mark)">отсуствует</xsl:if>
							<br/>
							<xsl:text> Модель:</xsl:text>
							<xsl:apply-templates select="tpo:AutomobileInfo/tpo:Model"/>
							<xsl:if test="not(tpo:AutomobileInfo/tpo:Model)">отсуствует</xsl:if>
							<br/>
							<xsl:text> Дата выпуска: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailer/*[contains(local-name(),'Manufact')]">
									<xsl:apply-templates select="tpo:UtilCollDetails/tpo:ChassisOrTrailer" mode="manufactureDateMY"/>
								</xsl:when>
								<xsl:when test="tpo:AutomobileInfo">
									<xsl:apply-templates select="tpo:AutomobileInfo" mode="manufactureDateMY"/>
								</xsl:when>
								<xsl:otherwise>отсуствует</xsl:otherwise>
							</xsl:choose>
							<br/>
							<xsl:text> Категория: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TransportCategoryCode | tpo:UtilCollDetails/tpo:Vehicle/tpo:UCTransportCategoryCode">
									<xsl:apply-templates select="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TransportCategoryCode | tpo:UtilCollDetails/tpo:Vehicle/tpo:UCTransportCategoryCode"/>
								</xsl:when>
								<xsl:when test="tpo:AutomobileInfo/tpo:TransportCategoryCode">
									<xsl:apply-templates select="tpo:AutomobileInfo/tpo:TransportCategoryCode"/>
								</xsl:when>
								<xsl:otherwise>отсутствует</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailerCode = 2">
									<br/>
									<xsl:text> объем двигателя: отсутствует </xsl:text>
									<br/>
									<xsl:text> модель/номер двигателя: отсутствует </xsl:text>
									<br/>
									<xsl:text> тип двигателя: отсутствует </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<br/>
									<xsl:text> объем двигателя: </xsl:text>
									<xsl:value-of select="tpo:AutomobileInfo/tpo:EngineVolumeQuanity"/>
									<xsl:if test="not(tpo:AutomobileInfo/tpo:EngineVolumeQuanity)">отсутствует</xsl:if>
									<br/>
									<xsl:text> модель/номер двигателя: </xsl:text>
									<xsl:if test="tpo:AutomobileInfo/tpo:EngineModel|tpo:AutomobileInfo/tpo:EngineId">
										<xsl:value-of select="tpo:AutomobileInfo/tpo:EngineModel"/>/<xsl:value-of select="tpo:AutomobileInfo/tpo:EngineId"/>
									</xsl:if>
									<xsl:if test="not(tpo:AutomobileInfo/tpo:EngineModel)">отсутствует</xsl:if>
									<br/>
									<xsl:text> тип двигателя: </xsl:text>
										<xsl:variable name="engineKind" select="tpo:AutomobileInfo/tpo:EngineKindCode"/>
										<xsl:if test="string($engineKind) != ''">
											<xsl:choose>
												<xsl:when test="$engineKind = 1">бензиновый</xsl:when>
												<xsl:when test="$engineKind = 2">дизельный</xsl:when>
												<xsl:when test="$engineKind = 3">электрический</xsl:when>
												<xsl:when test="$engineKind = 4">гибридный на основе бензинового</xsl:when>
												<xsl:when test="$engineKind = 5">гибридный на основе дизельного</xsl:when>
												<xsl:when test="$engineKind = 6">конв. для работы на газе</xsl:when>
												<xsl:otherwise>иной</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="not(tpo:AutomobileInfo/tpo:EngineKindCode)">отсутствует</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<br/>
							<xsl:text> грузоподъемность: </xsl:text>
							<xsl:choose>
								<xsl:when test="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TotalWeight">
									<xsl:value-of select="tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TotalWeight"/>
								</xsl:when>
								<xsl:when test="tpo:AutomobileInfo/tpo:TransportCarryingCapacityMeasure">
									<xsl:value-of select="tpo:AutomobileInfo/tpo:TransportCarryingCapacityMeasure"/>
								</xsl:when>
								<xsl:otherwise>отсутствует</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$MP = 'АС'">
								<xsl:apply-templates select="tpo:GoodsDescription"/>
								<br/>
								<xsl:text>Код ТН ВЭД: </xsl:text><xsl:value-of select="tpo:GoodsTNVEDCode"/>
								<br/>
								<xsl:text>Кол-во: </xsl:text>
								<xsl:for-each select="tpo:SupplementaryQuantity">
									<xsl:if test="position() &gt; 1">
										<br/>
									</xsl:if>
									<xsl:apply-templates mode="quantity" select="."/>
								</xsl:for-each>
								<br/>
								<xsl:text> Стоимость в рублях: </xsl:text><xsl:value-of select="tpo:RubleCost"/>
								<br/>
								<xsl:text> Стоимость в валюте договора: </xsl:text>
								<xsl:for-each select="tpo:ContractCost/*">
									<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
									<xsl:value-of select="."/>
								</xsl:for-each>
								<!--br/>
									<xsl:text> Марки: </xsl:text>
									<xsl:for-each select="tpo:StampsDetails">
										<xsl:choose>
											<xsl:when test="tpo:StampsType = 1">акцизные</xsl:when>
											<xsl:when test="tpo:StampsType = 2">федеральные специальные</xsl:when>
										</xsl:choose>
										<br/>
										<xsl:text>Кол-во: </xsl:text><xsl:value-of select="tpo:StampsSeriesNumber/catESAD_cu:ExciseQuantity"/>
										<xsl:if test="tpo:StampsSeriesNumber/catESAD_cu:ExciseSerieses">
											<br/>
											<xsl:text>Серия: </xsl:text><xsl:value-of select="tpo:StampsSeriesNumber/catESAD_cu:ExciseSerieses"/>
										</xsl:if>
										<xsl:if test="tpo:StampsSeriesNumber/catESAD_cu:ExciseList">
											<xsl:text>Номера: </xsl:text>
											<xsl:for-each select="tpo:StampsDetails/tpo:StampsSeriesNumber/catESAD_cu:ExciseList/catESAD_cu:ExciseNumber">
												<xsl:if test="position()!=1">, </xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</xsl:if>
										<br/>
										<xsl:text>Дата принятия товара: </xsl:text><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="tpo:GoodsRegDate"/></xsl:call-template>
									</xsl:for-each-->
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.6. Код товара<br/>
				<xsl:if test="$MP != 'АС' and $MP != 'УС'">
					<xsl:value-of select="tpo:GoodsTNVEDCode"/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:if>
				<xsl:if test="not(tpo:GoodsTNVEDCode)"/>
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.7. Вес товара (кг)<br/>
				<xsl:choose>
					<xsl:when test="tpo:GoodsGrossWeight"><xsl:value-of select="tpo:GoodsGrossWeight"/></xsl:when>
					<xsl:otherwise>-</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.8. Количество<br/>
				<xsl:if test="$MP != 'АС' and $MP != 'УС'">
					<xsl:for-each select="tpo:SupplementaryQuantity">
						<xsl:if test="position() != 1">
							<br/>
						</xsl:if>
						<xsl:apply-templates mode="quantity" select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="not(tpo:SupplementaryQuantity)">-</xsl:if>
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.9.<br/>
				<xsl:if test="$MP != 'АС' and $MP != 'УС'">
					<xsl:if test="tpo:AdditionalInformation">
						<xsl:value-of select="tpo:AdditionalInformation"/>
					</xsl:if>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:if>
				<!--xsl:if test="$MP = 'УС'">
					Номер товара <xsl:apply-templates select="." mode="graph69"/>
				</xsl:if-->
				<xsl:if test="not(tpo:AdditionalInformation)">-</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
						7.1. Стоимость товаров
						</td>
		</tr>
		<tr>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в валюте платежа<br/>
				<xsl:value-of select="tpo:RubleCost"/>
				<xsl:if test="not(tpo:RubleCost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в долларах США<br/>
				<xsl:value-of select="tpo:DollarCost"/>
				<xsl:if test="not(tpo:DollarCost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в евро<br/>
				<xsl:value-of select="tpo:EuroCost"/>
				<xsl:if test="not(tpo:EuroCost)">-</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph" style="border:solid 1pt #000000">8. Платежи</td>
			<td align="center" class="graph" colspan="9" style="border:solid 1pt #000000">
				<table>
					<tbody>
						<tr>
							<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Вид</td>
							<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Основа начисления</td>
							<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Ставка</td>
							<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #000000; border-bottom:1px solid #0000000;">Исчисленная сумма</td>
						</tr>
						<xsl:for-each select="tpo:PaymentInfo/tpo:PaymentInfoDetails">
							<xsl:sort select="tpo:PaymentModeCode" data-type="text" order="ascending"/>
							<!--xsl:if test="position()!=last()"-->
								<tr>
									<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
										<xsl:value-of select="tpo:PaymentModeCode"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:choose>
											<xsl:when test="tpo:PaymentModeCode='6020'">
												<xsl:text> </xsl:text>
											</xsl:when>
											<xsl:when test="tpo:PaymentModeCode='1010' and tpo:TaxBase = '1' and tpo:TaxBaseQualifierCode = 'ТАМ.ОПЕРАЦ.'">
												<xsl:text>1 ТАМ.ОПЕРАЦ.</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="tpo:TaxBase"/>
												<xsl:text> </xsl:text>
												<xsl:if test="tpo:PaymentModeCode!='1010'">
													<xsl:choose>
														<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='%'">
															<xsl:call-template name="currency"><xsl:with-param name="value" select="tpo:UnifiedCurrencyN3Code"/></xsl:call-template>
														</xsl:when>
														<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='*'">
															<xsl:value-of select="tpo:TaxBaseQualifierCode"/>
															<xsl:if test="tpo:PaymentModeCode='1010' and not(tpo:TaxBaseQualifierCode)">РУБ</xsl:if>
														</xsl:when>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:choose>
											<xsl:when test="tpo:PaymentModeCode='6020'">
												<xsl:text> </xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
												<xsl:text> </xsl:text>
												<xsl:choose>
													<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='%'">
														<!--xsl:value-of select="tpo:RateDetails/tpo:UnifiedMeasurementUnitCode"/-->
														<xsl:text> %</xsl:text>
													</xsl:when>
													<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='*'">
														<xsl:call-template name="currency"><xsl:with-param name="value" select="tpo:RateDetails/tpo:UnifiedCurrencyN3Code"/></xsl:call-template>
													</xsl:when>
												</xsl:choose>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
										<xsl:value-of select="tpo:CAPaymentAmount"/>
										<xsl:text> РУБ</xsl:text>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
										<xsl:if test="(position() = last()) and ($TPO/tpo:CommonPaymentDetails/tpo:TotalAmount)">
											<br/>
											<xsl:text>ИТОГО </xsl:text>
											<xsl:value-of select="$TPO/tpo:CommonPaymentDetails/tpo:TotalAmount"/>
											<xsl:text> РУБ</xsl:text>
										</xsl:if>
									</td>
									
								
									<!--td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
										<xsl:value-of select="tpo:PaymentModeCode"/>
									</td>
									<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
										<xsl:value-of select="tpo:TaxBase"/>
									</td>
									<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
										<xsl:value-of select="tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
										<xsl:if test="tpo:RateDetails/tpo:RateQualifierCode">(<xsl:value-of select="tpo:RateDetails/tpo:RateQualifierCode"/>)</xsl:if>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #000000; border-bottom:1px solid #0000000;">
										<xsl:value-of select="tpo:CAPaymentAmount"/>
									</td-->
								</tr>
							<!--/xsl:if-->
							<!--xsl:if test="position()=last()">
								<tr>
									<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
										<xsl:value-of select="tpo:PaymentModeCode"/>
									</td>
									<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
										<xsl:value-of select="tpo:TaxBase"/>
									</td>
									<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
										<xsl:value-of select="tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
									</td>
									<td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #000000; border-bottom:0px solid #ffffff;">
										<xsl:value-of select="tpo:CAPaymentAmount"/>
									</td>
								</tr>
							</xsl:if-->
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="manufactureDate">
		<xsl:choose>
			<xsl:when test="tpo:ManufactureDate">
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="tpo:ManufactureDate"/></xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="tpo:ManufactureMonth"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="tpo:ManufactureYear"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tpo:AddGoodsDescriptionDetails">
		<br/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:if test="local-name() = 'Manufacturer'">производитель</xsl:if>
			<xsl:if test="local-name() = 'TradeMark'">тов.знак</xsl:if>
			<xsl:if test="local-name() = 'GoodsMark'">марка</xsl:if>
			<xsl:if test="local-name() = 'GoodsMarking'">артикул</xsl:if>
			<xsl:if test="local-name() = 'GoodsStandard'">стандарт</xsl:if>
			<xsl:text>: </xsl:text>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="position()!=last()">; </xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="currencyCodeToName">
		<xsl:choose>
			<xsl:when test=". = '643'"> руб</xsl:when>
			<xsl:when test=". = '840'"> долл</xsl:when>
			<xsl:when test=". = '978'"> евро</xsl:when>
			<xsl:otherwise> (<xsl:value-of select="."/>)</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="paymentDetails">
		<xsl:param name="payerINN"/>
		<xsl:value-of select="tpo:PaymentModeCode"/>
		<xsl:text> - </xsl:text>
		<xsl:value-of select="tpo:PaymentAmount"/>
		<xsl:text> - 643 - </xsl:text>
		<xsl:value-of select="$payerINN"/>
	</xsl:template>
	<xsl:template match="*" mode="graph69">
		<xsl:choose>
			<xsl:when test="tpo:UtilCollDetails/tpo:GoodsDTNumber">
				<xsl:text>по ДТ: </xsl:text>
				<xsl:value-of select="tpo:UtilCollDetails/tpo:GoodsDTNumber"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>п/п: </xsl:text>
				<xsl:value-of select="tpo:GoodsNumber"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template mode="manufactureDateMY" match="*">
		<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="tpo:ManufactureDate"/></xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tpo:ManufactureYear"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tpo:ManufactureMonth"/>
	</xsl:template>
	<xsl:template mode="GTDID" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="GTDdate">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="GTDdate">
		<xsl:param name="dateIn"/>
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
	<xsl:template match="*" mode="quantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="currency">
		<xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="string($value)='643'">РУБ</xsl:when>
			<xsl:when test="string($value)='978'">ЕВРО</xsl:when>
			<xsl:when test="string($value)='840'">ДОЛЛ</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
