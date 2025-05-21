<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tpo="urn:customs.ru:Information:CustomsDocuments:TPO:5.16.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.16.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.16.0">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:key name="codes" match="tpo:PaymentInfoDetails" use="tpo:PaymentModeCode"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="tpo:TPO">
		<html>
			<head>
				<title>Таможенный приходный ордер (ТПО)</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
					<table>
						<tr>
							<td class="graph" colspan="5" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #000000;">Таможенный приходный ордер</td>
							<td class="graph" colspan="3" rowspan="2" style="border:solid 1pt #000000">1. Тип ордера<br/>
								<xsl:value-of select="tpo:TPOTypeCode/tpo:MovementPurpose"/>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="tpo:TPOTypeCode/tpo:MovementWay"/>
								<xsl:text>/</xsl:text>
								<xsl:choose>
									<xsl:when test="tpo:TPOTypeCode/tpo:MovementPurpose = 'ПЛ' and tpo:TPOTypeCode/tpo:TransportKindCode = '1'">--</xsl:when>
									<xsl:otherwise><xsl:value-of select="tpo:TPOTypeCode/tpo:TransportKindCode"/></xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" colspan="2" rowspan="2" style="border:solid 1pt #000000">2. Доб.лист<br/>
								<!--<xsl:if test="//tpo:AdditionalSheetNumber"><xsl:value-of select="//tpo:AdditionalSheetNumber"/></xsl:if>-->
								<xsl:choose>
									<xsl:when test="tpo:AdditionalSheetNumber">
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
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">4. Плательщик<br/>
								<xsl:apply-templates select="tpo:Payer"/>
							</td>
							<td class="graph" colspan="5" style="border:solid 1pt #000000">5. Валюта платежа<br/>
								<xsl:value-of select="tpo:PaymentCurrency/tpo:CurrencyA3Code"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tpo:PaymentCurrency/tpo:CurrencyN3Code"/>
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
							</td>
							<td class="graph" colspan="2" style="border:solid 1pt #000000">5.1. Курс доллара США<br/>
								<xsl:value-of select="tpo:PaymentCurrency/tpo:CurrencyDollarRate"/>
							</td>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">5.2. Курс евро<br/>
								<xsl:value-of select="tpo:PaymentCurrency/tpo:CurrencyEuroRate"/>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">6. Представляемые сведения/Дополнительная информация<br/>
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
								<xsl:value-of select="tpo:TotalWeight"/>
							</td>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">6.2. Общая стоимость в валюте платежа<br/>
								<xsl:value-of select="tpo:TotalCost"/>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 1pt #000000">6.3. Общая стоимость в долларах США<br/>
								<xsl:value-of select="tpo:DollarTotalCost"/>
							</td>
							<td class="graph" colspan="3" style="border:solid 1pt #000000">6.4. Общая стоимость в евро<br/>
								<xsl:value-of select="tpo:EuroTotalCost"/>
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
				<xsl:apply-templates mode="doc" select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="tpo:PreviousDocDocDetails">
			<xsl:text>Предшествующие документы:</xsl:text>
			<br/>
			<xsl:for-each select="tpo:PreviousDocDocDetails">
				<xsl:if test="position()!=1">
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
		<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<br/>
			<span class="header">Адрес: <br/>
			</span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
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
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
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
		<tr>
			<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">6.5. Описание товара<br/>
			</td>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.6. Код товара<br/>
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.7. Вес товара (кг)<br/>
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
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.9.<br/>
				<xsl:if test="tpo:AdditionalInformation">
					<xsl:value-of select="tpo:AdditionalInformation"/>
				</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">7. Наименование взимаемых платежей<br/>
				<xsl:for-each select="tpo:PaymentInfo/tpo:PaymentModeCode[not(.=preceding::tpo:PaymentModeCode)]">
					<xsl:value-of select="."/> 
					<xsl:value-of select="../tpo:PaymentName"/>
					<br/>
				</xsl:for-each>
			</td>
			<td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
			7.1. Стоимость товаров
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в валюте платежа<br/>
				<xsl:value-of select="tpo:Cost"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в долларах США<br/>
				<xsl:value-of select="tpo:DollarCost"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в евро<br/>
				<xsl:value-of select="tpo:EuroCost"/>
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
					<xsl:choose>
						<!-- xsl:when test="tpo:UtilSign = 'true' or tpo:UtilSign = '1'" -->
						<xsl:when test="tpo:TPOSign = '1'">
							<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
								<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/catESAD_cu:PaymentModeCode"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<!--xsl:if test="tpo:UtilSign = 'true' or tpo:UtilSign = '1'"-->
									<!--xsl:if test="tpo:TPOSign = '1'"-->
										<xsl:value-of select="tpo:UtilCollDetails/tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="tpo:UtilCollDetails/tpo:RateDetails/tpo:UnifiedMeasurementUnitCode"/>
										<xsl:if test="tpo:UtilCollDetails/tpo:RateDetails/tpo:RateQualifierCode">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="tpo:UtilCollDetails/tpo:RateDetails/tpo:RateQualifierCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									<!--/xsl:if-->
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<!--xsl:if test="tpo:UtilSign = 'true' or tpo:UtilSign = '1'"-->
									<!--xsl:if test="tpo:TPOSign = '1'"-->
										<xsl:value-of select="tpo:UtilCollDetails/tpo:Coefficient"/>
									<!--/xsl:if-->
								</td>
								<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/catESAD_cu:PaymentAmount"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
								
								</td>
								<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
									<xsl:for-each select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:PaymentDocDetails">
										<xsl:value-of select="tpo:DocName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="tpo:DocId"/>
										<xsl:text> </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="tpo:DocCreationDate"/>
										</xsl:call-template>
										<xsl:if test="tpo:PaymentDate">
											<xsl:text> дата платежа </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="tpo:PaymentDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="not(tpo:DocName) and not(tpo:DocId) and not(tpo:DocCreationDate) and not(tpo:CustomsReceiptRegNumber)">
											<xsl:text> ИНН </xsl:text>
											<xsl:value-of select="tpo:TaxpayerDetails/cat_ru:INN"/>
										</xsl:if>
										<xsl:if test="tpo:CustomsReceiptRegNumber">
											<xsl:text> № таможенной расписки </xsl:text>
											<xsl:apply-templates mode="reg_num" select="tpo:CustomsReceiptRegNumber"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="tpo:TPOSign &gt; 1">
							<tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
								<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/catESAD_cu:PaymentModeCode"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<xsl:choose>
										<xsl:when test="tpo:TPOSign = 2">
											<xsl:value-of select="tpo:NoGoodsDetails/tpo:GoodsNumber"/>
											<xsl:text> трансп.ср.</xsl:text>
										</xsl:when>
										<xsl:when test="tpo:TPOSign = 3">
											<xsl:value-of select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:TaxBase"/>
											<xsl:text> 100 кг*сут</xsl:text>
										</xsl:when>
										<xsl:when test="tpo:TPOSign = 4">
											<xsl:value-of select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:TaxBase"/>
										</xsl:when>
									</xsl:choose>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
									<xsl:choose>
										<xsl:when test="tpo:NoGoodsDetails/tpo:CBRate">
											<xsl:value-of select="tpo:NoGoodsDetails/tpo:CBRate"/>
											<xsl:text> / 360</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
									<xsl:value-of select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails/catESAD_cu:PaymentAmount"/>
								</td>
								<td align="center" class="graph" style="border:solid 1pt #000000">
								
								</td>
								<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails">
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
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
									
									</td>
									<td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
										<xsl:for-each select="tpo:PaymentDocDetails">
											<xsl:value-of select="tpo:DocName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="tpo:DocId"/>
											<xsl:text> </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="tpo:DocCreationDate"/>
											</xsl:call-template>
											<xsl:if test="tpo:PaymentDate">
												<xsl:text> дата платежа </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="tpo:PaymentDate"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="not(tpo:DocName) and not(tpo:DocId) and not(tpo:DocCreationDate) and not(tpo:CustomsReceiptRegNumber)">
												<xsl:text> ИНН </xsl:text>
												<xsl:value-of select="tpo:TaxpayerDetails/cat_ru:INN"/>
											</xsl:if>
											<xsl:if test="tpo:CustomsReceiptRegNumber">
												<xsl:text> № таможенной расписки </xsl:text>
												<xsl:apply-templates mode="reg_num" select="tpo:CustomsReceiptRegNumber"/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
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
		<tr>
			<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">6.5. Описание товара<br/>
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
			</td>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.6. Код товара<br/>
				<xsl:value-of select="tpo:GoodsTNVEDCode"/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.7. Вес товара (кг)<br/>
				<xsl:value-of select="tpo:GoodsGrossWeight"/>
				<xsl:if test="position()!=last()">, </xsl:if>
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
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.9.<br/>
				<xsl:if test="tpo:AdditionalInformation">
					<xsl:value-of select="tpo:AdditionalInformation"/>
				</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">7. Наименование взимаемых платежей<br/>
				<xsl:for-each select="tpo:PaymentInfo/tpo:PaymentModeCode[not(.=preceding::tpo:PaymentModeCode)]">
					<xsl:value-of select="."/> 
						<xsl:value-of select="../tpo:PaymentName"/>
					<br/>
				</xsl:for-each>
			</td>
			<td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
						7.1. Стоимость товаров
						</td>
		</tr>
		<tr>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в валюте платежа<br/>
				<xsl:value-of select="tpo:Cost"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в долларах США<br/>
				<xsl:value-of select="tpo:DollarCost"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в евро<br/>
				<xsl:value-of select="tpo:EuroCost"/>
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
												<xsl:text> </xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="tpo:TaxBase"/>
												<xsl:text> </xsl:text>
												<xsl:choose>
													<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='%'">
														<xsl:call-template name="currency"><xsl:with-param name="value" select="tpo:UnifiedCurrencyN3Code"/></xsl:call-template>
													</xsl:when>
													<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='*'">
														<xsl:value-of select="tpo:TaxBaseQualifierCode"/>
														<xsl:if test="tpo:PaymentModeCode='1010' and not(tpo:TaxBaseQualifierCode)">РУБ</xsl:if>
													</xsl:when>
												</xsl:choose>
												
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
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:for-each select="tpo:PaymentDetails">
											<!-- <xsl:if test="tpo:PaymentMethodCode">-->
											<xsl:value-of select="tpo:PaymentWayCode"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
											<!-- </xsl:if>-->
										</xsl:for-each>
									</td>
									<xsl:choose>
										<xsl:when test="tpo:PaymentDetails/tpo:RFOrganizationFeatures/cat_ru:INN and position() = 1">
											<xsl:variable name="inn" select="tpo:PaymentDetails/tpo:RFOrganizationFeatures/cat_ru:INN"/>
											<td align="left" class="graph" colspan="3" rowspan="{$rowcount}" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
												
												<xsl:for-each select="$TPO//tpo:PaymentInfoDetails[generate-id() = generate-id(key('codes', tpo:PaymentModeCode)[1])]">
													<xsl:sort select="tpo:PaymentModeCode"/>
													<xsl:variable name="modeCode" select="tpo:PaymentModeCode"/>
													<xsl:value-of select="$modeCode"/>
													<xsl:text> - </xsl:text>
													<xsl:value-of select="format-number(sum($TPO//tpo:PaymentInfoDetails[tpo:PaymentModeCode = $modeCode]/tpo:CAPaymentAmount),'0.00')"/>
													<xsl:text> - </xsl:text>
													<xsl:text>643</xsl:text>
													<xsl:text> - </xsl:text>
													<xsl:value-of select="$inn"/>
													<br/>
												</xsl:for-each>
												
											</td>
										</xsl:when>
										<xsl:when test="not(tpo:PaymentDetails/tpo:RFOrganizationFeatures/cat_ru:INN)">
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
		<tr>
			<td class="graph" colspan="5" rowspan="4" style="border:solid 1pt #000000">6.5. Описание товара<br/>
				<xsl:for-each select="tpo:GoodsDescription">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()"> </xsl:if>
				</xsl:for-each>
				<xsl:if test="tpo:OriginCountryCode"> (страна: <xsl:value-of select="tpo:OriginCountryCode"/>)</xsl:if>
				<!--(<xsl:value-of select="//tpo:GoodsTNVEDCode"/>)-->
				<br/>
				<xsl:if test="tpo:AutomobileInfo">Сведения о транспортном средстве:<br/>
				</xsl:if>
				<xsl:variable name="avto_num" select="count(tpo:AutomobileInfo)"/>
				<xsl:for-each select="tpo:AutomobileInfo">
					<xsl:if test="$avto_num>1">
						<xsl:value-of select="position()"/>.</xsl:if>
					<xsl:if test="tpo:Model">Модель:<xsl:value-of select="tpo:Model"/>
						<br/>
					</xsl:if>
					<xsl:if test="tpo:Mark">Марка:<xsl:value-of select="tpo:Mark"/>;
            </xsl:if>
					<!--xsl:if test="tpo:MarkCode"> Код марки:<xsl:value-of select="tpo:MarkCode"/>;</xsl:if-->
					<xsl:if test="tpo:OfftakeYear"> Год выпуска:<xsl:value-of select="tpo:OfftakeYear"/>;</xsl:if>
					<xsl:if test="tpo:EngineVolumeQuanity"> Объем двигателя, куб. см:<xsl:value-of select="tpo:EngineVolumeQuanity"/>;</xsl:if>
					<xsl:if test="tpo:VINID"> Идентификационный номер:<xsl:value-of select="tpo:VINID"/>;</xsl:if>
					<xsl:if test="tpo:EnginePower or tpo:EnginePowerKVt"> Мощность двигателя: <xsl:if test="tpo:EnginePower">
							<xsl:value-of select="tpo:EnginePower"/> лошадиных сил;</xsl:if>
						<xsl:if test="tpo:EnginePowerKVt">
							<xsl:text> </xsl:text>
							<xsl:value-of select="tpo:EnginePowerKVt"/>КВт;</xsl:if>
					</xsl:if>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graph" colspan="2" style="border:solid 1pt #000000">6.6. Код товара<br/>
				<xsl:value-of select="tpo:GoodsTNVEDCode"/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.7. Вес товара (кг)<br/>
				<xsl:value-of select="tpo:GoodsGrossWeight"/>
				<xsl:if test="position()!=last()">, </xsl:if>
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
			</td>
			<td class="graph" colspan="3" style="border:solid 1pt #000000">6.9.<br/>
				<xsl:if test="tpo:AdditionalInformation">
					<xsl:value-of select="tpo:AdditionalInformation"/>
				</xsl:if>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
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
				<xsl:value-of select="tpo:Cost"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в долларах США<br/>
				<xsl:value-of select="tpo:DollarCost"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</td>
			<td class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в евро<br/>
				<xsl:value-of select="tpo:EuroCost"/>
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
												<xsl:text> </xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="tpo:TaxBase"/>
												<xsl:text> </xsl:text>
												<xsl:choose>
													<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='%'">
														<xsl:call-template name="currency"><xsl:with-param name="value" select="tpo:UnifiedCurrencyN3Code"/></xsl:call-template>
													</xsl:when>
													<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='*'">
														<xsl:value-of select="tpo:TaxBaseQualifierCode"/>
														<xsl:if test="tpo:PaymentModeCode='1010' and not(tpo:TaxBaseQualifierCode)">РУБ</xsl:if>
													</xsl:when>
												</xsl:choose>
												
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
	<!-- Шаблон для типа cat_ru:GTDIDType -->
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
