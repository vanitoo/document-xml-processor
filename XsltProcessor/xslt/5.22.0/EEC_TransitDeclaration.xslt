<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:csdo="urn:EEC:M:SimpleDataObjects:v0.4.14" xmlns:ccdo="urn:EEC:M:ComplexDataObjects:v0.4.14" xmlns:casdo="urn:EEC:M:CA:SimpleDataObjects:v1.8.1" xmlns:cacdo="urn:EEC:M:CA:ComplexDataObjects:v1.8.1" xmlns:td="urn:EEC:R:048:TransitDeclaration:v1.0.0">
	
	<xsl:param name="TYPE"/><!-- типы ТС -->

	<xsl:variable name="k" select="1"/>
	<xsl:template match="td:TransitDeclaration">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>body {background: #CCCCCC; font-size: 9pt;}
              div.page {
              width: 210mm;
              margin: 10px auto;
              padding: 5mm 10mm;
              background: white;
              border: solid 1px black;
              page-break-before: always;
              }

              div.page_album {
              width: 297mm;
              margin: 10px auto;
              padding: 10mm;
              background: white;
              border: solid 1px black;
              page-break-before: always;
              }

              div.page.nobreak {
              page-break-before: avoid;
              }
              
              /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
              @media print {div.page {border: none; margin: 0; padding: 0;}}
              div.goods {background: white;}
              .bordered {
              border: solid 1px black;
              padding-top: 4pt;
              padding-bottom: 4pt;
              font-family: Arial;
              font-size: 9pt;
              font-weight: bold;
              }
              .underlined {border-bottom: solid 0.8pt black;}
              p.NumberDate {font-weight: bold;}
              .graph {font-family: Arial; font-size: 7pt;}
              .graphColumn {font-family: Arial; font-size: 6.5pt;}
              .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
              .graphMain {font-family: Arial; font-size: 9pt; font-weight: bold; }
              .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
              .graphNo {font-size: 7pt; font-weight: bold;}
              h1{font-size: 12pt;}
              table.addInfo {border-collapse: collapse; vertical-align: top;}
              table.addInfo th {border: 1px solid black; background-color: LightGrey;}
              table.addInfo td {border: 1px solid black; vertical-align: top;}
              hr {border: 0; border-bottom: 1px solid black; margin: 0;}
              .tr {border-right: 1px solid black;}
              .tl {border-left: 1px solid black;}
              .tb {border-bottom: 1px solid black;}
              .tt {border-top: 1px solid black;}
              .br {border-right: 2px solid black;}
              .bl {border-left: 2px solid black;}
              .bb {border-bottom: 2px solid black;}
              .bt {border-top: 2px solid black;}
              .db {border-bottom: 1px dashed black;}
              .dl {border-left: 1px dashed black;}
              .number {
              text-align: center;
              color: black;
              font-size: 11pt;
              font-weight: bold;
              vertical-align: middle;
              }
                </style>
			</head>
			<body>
				<div class="page nobreak">
					<xsl:apply-templates select="cacdo:TDGoodsShipmentDetails[1]"/>
				</div>
				<!--Выводим товары 2 - ..., группируя их по 5 шт. на лист-->
				<xsl:for-each select="cacdo:TDGoodsShipmentDetails[1]/cacdo:TransitGoodsItemDetails">
					<xsl:if test="(position() - 1) mod 5 = 1">
						<xsl:variable name="firstEntryPos" select="position()"/>
						<div class="page">
							<xsl:call-template name="td4Head"/>
							<xsl:for-each select="//cacdo:TDGoodsShipmentDetails[1]/cacdo:TransitGoodsItemDetails">
								<xsl:if test="position() >= $firstEntryPos and position() &lt;= $firstEntryPos + 4">
									<xsl:apply-templates select="."/>
								</xsl:if>
							</xsl:for-each>
							<table cellpadding="0" cellspacing="0" style="width: 100%; margin: 0;">
								<tr>
									<td class="bt" style="vertical-align: top; border: 0.8pt solid black;">
										<br/>
									</td>
								</tr>
							</table>
						</div>
					</xsl:if>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<!--Товарная партия-->
	<xsl:template match="cacdo:TDGoodsShipmentDetails">
		<xsl:variable name="root" select="./.."/>
		<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
			<tr>
				<td class="graphMain" colspan="2" style="width:{103*$k}mm;">ТРАНЗИТНАЯ ДЕКЛАРАЦИЯ</td>
				<td style="width:{26.4*$k}mm;"/>
				<td class="graph" style="width:{60.6*$k}mm;border-left:solid 0.8pt black;" valign="top">
					<xsl:text>А. Таможенный орган отправления</xsl:text>
					<br>
						<!--xsl:choose>
						<xsl:when test="//*[@DocumentModeID='1006078E']/goom:GTDID">
							<xsl:apply-templates select="//*[@DocumentModeID='1006078E']/goom:GTDID" mode="graf_A"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="//*[@DocumentModeID='1004051E']/nGTDr:GTDID" mode="graf_A"/>
						</xsl:otherwise>
					</xsl:choose-->
					</br>
				</td>
			</tr>
			<tr>
				<td class="graphMain" colspan="2" style="width:{103*$k}mm;">
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td class="graph" style="width:{26.4*$k}mm;border-top:solid 1pt black;border-left:solid 1pt black;border-right:solid 1pt black;">
					<span class="graphNo">1</span>
					<span class="graph">ДЕКЛАРАЦИЯ</span>
				</td>
				<td class="graph" rowspan="3" style="width:{60.6*$k}mm;border-bottom:solid 0.8pt black;" valign="top">
					<!--xsl:if test="//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark/catESAD_ru:GRNumber='A' or //*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark/catESAD_ru:GRNumber='А'">
					<xsl:for-each select="//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark[catESAD_ru:GRNumber='A' or catESAD_ru:GRNumber='А']">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="catESAD_ru:StageMarkIdentifier"/>
						<xsl:text>.</xsl:text>
						<xsl:apply-templates select="catESAD_ru:NoteMarkIdentifier"/>
						<xsl:if test="catESAD_ru:MarkDescription">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catESAD_ru:MarkDescription"/>
						</xsl:if>
						<xsl:if test="catESAD_ru:Deadline">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catESAD_ru:Deadline" mode="date"/>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="catESAD_ru:Deadline"/>
							</xsl:call-template-->
					<!--/xsl:if>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="catESAD_ru:PersonName"/>
					</xsl:for-each>
				</xsl:if-->
				</td>
			</tr>
			<tr valign="top">
				<td align="center" class="graphNum" style="width:{17*$k}mm;border:solid 1pt black;">1</td>
				<td rowspan="3" style="width:{86*$k}mm;border:solid 0.8pt black;background:#FFFFFF;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{43*$k}mm;">
								<span class="graphNo">2</span>
								<span class="graph">Отправитель</span>
							</td>
							<td class="graph" style="width:{43*$k}mm;">
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:apply-templates select="cacdo:ConsignorDetails"/>
							</td>
						</tr>
					</table>
				</td>
				<td style="width:{26.4*$k}mm;border-left:solid 1pt black;border-right:solid 1pt black;border-bottom:solid 1pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td align="center" class="graph" rowspan="2" style="width:{8.8*$k}mm;border-right:solid 0.8pt black;background:#FFFFFF;">
								<xsl:apply-templates select="$root/casdo:DeclarationKindCode"/>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{4.4*$k}mm;">
								<xsl:apply-templates select="$root/casdo:TransitFeatureCode"/>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<xsl:apply-templates select="$root/casdo:TransitProcedureCode"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td rowspan="8" style="width:{17*$k}mm;border-left:solid 1pt black;border-right:solid 1pt black;"/>
				<td style="width:{26.4*$k}mm;border:solid 0.8pt black;background:#FFFFFF;" valign="bottom">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{13.2*$k}mm;border-right:solid 0.8pt black;">
								<span class="graphNo">3</span>
								<span class="graph">Формы</span>
							</td>
							<td class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt black;">
								<!--span class="graphNo">4</span>
								<span class="graph" style="white-space: nowrap;">Отгр. спец.</span>
								<br/-->
								<!--xsl:apply-templates select="catESAD_cu:SpecificationNumber"/>
								<xsl:if test="catESAD_cu:SpecificationNumber and catESAD_cu:SpecificationListNumber">
									<xsl:text> / </xsl:text>
								</xsl:if>
								<xsl:apply-templates select="catESAD_cu:SpecificationListNumber"/-->
							</td>
						</tr>
						<tr valign="top">
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-right:solid 0.8pt black;">1</td>
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<!--xsl:apply-templates select="catESAD_cu:TotalSheetNumber"/-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td align="center" class="graph" style="width:{13.2*$k}mm;border-right:solid 0.8pt black;background:#FFFFFF;">
								<span class="graphNo">5</span>
								<span class="graph">Всего т-ов</span>
								<br/>
								<xsl:apply-templates select="casdo:GoodsQuantity"/>
							</td>
							<td align="center" class="graph" style="width:{18.4*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;background:#FFFFFF;">
								<span class="graphNo">6</span>
								<span class="graph">Всего мест</span>
								<br/>
								<xsl:apply-templates select="casdo:CargoQuantity"/>
								<!--xsl:choose>
									<xsl:when test="catESAD_cu:TotalPackageNumber!=''">
										<xsl:apply-templates select="catESAD_cu:TotalPackageNumber"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose-->
							</td>
							<td class="graph" style="width:{45.4*$k}mm;border-left:solid 0.8pt black;">
								<span class="graphNo">7</span>
								<span class="graph">Справочный номер</span>
								<br/>
								<!--xsl:apply-templates select="//ESADout_CU:DeclarationKind"/-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td style="width:{86*$k}mm;border:solid 0.8pt black;background:#FFFFFF;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{86*$k}mm;">
								<span class="graphNo">8</span>
								<span class="graph">Получатель</span>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:apply-templates select="cacdo:ConsigneeDetails"/>
							</td>
						</tr>
					</table>
				</td>
				<td class="graph" colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<span class="graphNo">9</span>
					<span class="graph"> Таможенный представитель</span>
					<br/>
					<xsl:apply-templates select="$root" mode="graph9"/>
				</td>
			</tr>
			<!--tr valign="top">
				<td colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{15.4*$k}mm;">
								<span class="graphNo">10</span>
								<span class="graph">Стр.перв.назнач/</span>
							</td>
							<td class="graph" colspan="2" style="width:{16.2*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">11</span>
								<span class="graph">Торг.страна</span>
							</td>
							<td class="graph" rowspan="2" style="width:{43.6*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">12</span>
								<span class="graph">Общая таможенная стоимость</span>
								<br/>
								<br/>
							</td>
							<td class="graph" rowspan="2" style="width:{11.8*$k}mm;border-left:solid 0.8pt black;word-break: break-all;">
								<span class="graphNo">13</span>
								<span class="graph"> </span>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph" style="width:{8.8*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td align="center" class="graph" style="width:{8.8*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">
								<span class="graph">посл.отп.</span>
							</td>
							<td align="center" class="graph" style="width:{8.8*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">e>
							</td>
							<td align="center" class="graph" style="width:{8.8*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
							</td>
						</tr>
					</table>
				</td>
			</tr-->
			<tr valign="top">
				<td rowspan="2" style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{43*$k}mm;">
								<span class="graphNo">14</span>
								<span class="graph">Декларант</span>
							</td>
							<td class="graph" style="width:{43*$k}mm;">
								<!--xsl:if test="ESADout_CU:ESADout_CUDeclarant/RUDECLcat:AEORegistryIdDetails/catESAD_cu:DocId">
									<xsl:text>№ </xsl:text>
									<xsl:apply-templates select="ESADout_CU:ESADout_CUDeclarant/RUDECLcat:AEORegistryIdDetails/catESAD_cu:DocId"/>
								</xsl:if-->
							</td>
						</tr>
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:apply-templates select="$root/cacdo:DeclarantDetails"/>
								<!--xsl:if test="ESADout_CU:ESADout_CUDeclarant">
									<xsl:apply-templates mode="org" select="ESADout_CU:ESADout_CUDeclarant"/>
								</xsl:if-->
							</td>
						</tr>
					</table>
				</td>
				<td colspan="2" style="vertical-align: bottom;border-right:solid 0.8pt black;" valign="top">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{43.5*$k}mm;background:#FFFFFF; border-right:0.8pt solid black;">
								<span class="graphNo">15</span>
								<span class="graph">Страна отправления</span>
								<br/>
								<xsl:apply-templates select="casdo:DepartureCountryCode"/>
								<!--xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DispatchCountryName"/-->
							</td>
							<td style="width:{43.5*$k}mm; vertical-align: bottom;">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{43.5*$k}mm; border-right: solid 0.8pt black; height: 100%;">
								<!--span class="graphNo">16</span>
								<span class="graph">Страна происхождения</span-->
								<!--br/-->
								<br/>
								<!--xsl:if test="catESAD_cu:OriginCountryName">
									<xsl:apply-templates select="catESAD_cu:OriginCountryName"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:OriginCountryCode">
									<xsl:text> (</xsl:text>
									<xsl:apply-templates select="catESAD_cu:OriginCountryCode"/>
									<xsl:text>)</xsl:text>
								</xsl:if-->
							</td>
							<td class="graph" style="width:{43.5*$k}mm;background:#FFFFFF;">
								<span class="graphNo">17</span>
								<span class="graph">Страна назначения</span>
								<br/>
								<xsl:apply-templates select="casdo:DestinationCountryCode"/>
								<!--xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DestinationCountryName"/-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<table cellpadding="0" cellspacing="0" style="border-left:solid 0.8pt black;" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{60.4*$k}mm;background:#FFFFFF;">
								<span class="graphNo">18</span>
								<span class="graph">Идентификация и страна регистрации трансп.средства при отправлении/прибытии</span>
							</td>
							<td align="center" class="graph" style="width:{26*$k}mm;border-left:solid 1pt black;border-bottom:solid 0pt black;border-right:solid 1pt black;background:#FFFFFF;">
								<span class="graphNo">19</span>
								<span class="graph">Контейнер</span>
							</td>
							<td class="graph" colspan="3" style="width:{91.1*$k}mm; border-right: 1pt solid black;">
							</td>
						</tr>
						<tr>
							<td class="graph">
								<table>
									<xsl:choose>
										<xsl:when test="not($root/cacdo:TransportMeansItemDetails)">
											<tr>
												<td style="width:{56.3*$k}mm; border-right: 1pt solid black;"><br/><br/></td>
												<td/>
											</tr>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="$root/cacdo:TransportMeansItemDetails">
												<tr>
													<td class="graph" style="width:{56.3*$k}mm; border-right: 1pt solid black;">
														<xsl:apply-templates select="csdo:ObjectOrdinal"/>
														<xsl:if test="casdo:TransportTypeCode">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="casdo:TransportTypeCode"/><!-- расшифровка типа из параметра -->
														</xsl:if>
														<xsl:if test="csdo:TransportMeansRegId">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:TransportMeansRegId"/>
														</xsl:if>
														<xsl:if test="csdo:VehicleMakeCode">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:VehicleMakeCode"/>
														</xsl:if>
														<xsl:if test="csdo:VehicleModelName">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:VehicleModelName"/>
														</xsl:if>
														<xsl:if test="csdo:VehicleId">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:VehicleId"/>
														</xsl:if>
														<xsl:if test="csdo:DocId">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:DocId"/>
														</xsl:if>
													</td>
													<td class="graph">
														<xsl:apply-templates select="casdo:RegistrationNationalityCode"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								
								</table>
										
							</td>
							<td align="center" class="graph" style="width:{10*$k}mm;border-left:solid 1pt black;border-bottom:solid 0pt black;border-right:solid 1pt black;" valign="top">
								<xsl:choose>
									<xsl:when test="$root/casdo:ContainerIndicator = 1 or translate(substring($root/casdo:ContainerIndicator, 1, 1), 'T', 't') = 't'">1</xsl:when>
									<xsl:otherwise>0</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" style="width:{53.3*$k}mm;" valign="bottom">
								<table>
									<tbody>
										<tr>
											<td style="width:{10*$k}mm;border-right:solid 1pt black;">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td class="graph" style="width:{12*$k}mm;border-bottom:solid 0pt black;border-left:solid 1pt black;">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="width:{173*$k}mm;border:solid 0.8pt black;" valign="top">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{88*$k}mm;border-right:solid 1pt black;background:#FFFFFF;">
								<span class="graphNo">20</span>
								<span class="graph">Средства идентификации</span>
							</td>
							<td class="graph" colspan="2" style="width:{37.5*$k}mm;border-left:solid 1pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">22</span>
								<span class="graph">Валюта и общая сумма по счету</span>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{19*$k}mm;border-left:solid 1pt black;border-right:solid 0.8pt black;">
							</td>
							<td class="graph" colspan="3" style="width:{28.5*$k}mm;">
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:{78*$k}mm;background:#FFFFFF;">
								<xsl:for-each select="$root/cacdo:CustomsIdentificationDetails">
									<xsl:if test="position() != 1"><br/></xsl:if>
									<xsl:apply-templates select="casdo:SealQuantity"/>
									<xsl:if test="casdo:SealQuantity and casdo:CustomsIdentificationMeansKindCode">/</xsl:if>
									<xsl:apply-templates select="casdo:CustomsIdentificationMeansKindCode"/>
								</xsl:for-each>
							</td>
							<td align="center" class="graph" style="width:{7.8*$k}mm;border-left:solid 1pt black;border-bottom:solid 1pt black;border-right:solid 1pt black;">
								<xsl:apply-templates select="casdo:TotalAmount/@currencyCode"/>
							</td>
							<td align="center" class="graph" style="width:{29.7*$k}mm;border-right:solid 0.8pt black;">
								<xsl:apply-templates select="casdo:TotalAmount"/>
							</td>
							<td align="center" class="graph" style="width:{10.4*$k}mm;border-right:solid 0.8pt black;">
								<!--xsl:apply-templates select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:DealNatureCode"/-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph" style="width:{10.1*$k}mm;border-right:solid 0.8pt black;">
								<!--xsl:apply-templates select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:DealFeatureCode"/-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph" style="width:{9*$k}mm;">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{18.8*$k}mm;background:#FFFFFF;">
								<!--span class="graphNo">25</span>
								<span class="graph">Вид транспорта</span-->
							</td>
							<td class="graph" colspan="2" style="width:{18.8*$k}mm;border-left:solid 1pt black;border-right:solid 0.8pt black;">
								<!--span class="graphNo">26</span>
								<span class="graph">Вид транспорта</span-->
							</td>
							<td class="graph" style="width:{48.4*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<!--span class="graphNo">27</span>
								<span class="graph">Место погрузки/разгрузки</span-->
							</td>
						</tr>
						<tr>
							<!-- при транзите менять местами значения в 25 и 26 графах -->
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-bottom:solid 1pt black;border-right:solid 1pt black;background:#FFFFFF;">
								<!--xsl:choose>
									<xsl:when test="..//ESADout_CU:CustomsProcedure = 'ТТ'">
										<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportModeCode">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode!=''">
										<xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose-->
							</td>
							<td class="graph" style="width:{12.2*$k}mm;background:#FFFFFF;">
								<!--span class="graph">на границе</span-->
							</td>
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 1pt black;border-bottom:solid 1pt black;border-right:solid 1pt black;">
								<!--xsl:choose>
									<xsl:when test="..//ESADout_CU:CustomsProcedure = 'ТТ'">
										<xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode"/>
									</xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportModeCode!=''">
										<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportModeCode">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose-->
							</td>
							<td class="graph" style="width:{12.2*$k}mm;border-right:solid 0.8pt black;">
								<!--span class="graph">внутри страны</span-->
							</td>
							<td class="graph" style="width:{48.4*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<!--xsl:apply-templates select="ESADout_CU:ESADoutConsigment/ESADout_CU:ESADoutLoadingPlace"/-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
				<td class="graph" colspan="2" rowspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<!--span class="graphNo">28</span>
					<span class="graph">Финансовые и банковские сведения</span-->
					<br/>
				</td>
			</tr>
			<tr>
				<td align="center" class="graphNum" style="width:{17*$k}mm;border:solid 1pt black;">
                    1
                </td>
				<td style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{41.4*$k}mm;border-right:solid 0.8pt black;">
								<!--span class="graphNo">29</span>
								<span class="graph">Орган въезда/выезда</span-->
								<br/>
								<!--xsl:for-each select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:BorderCustomsOffice">
									<xsl:apply-templates select="cat_ru:Code"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="cat_ru:OfficeName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each-->
							</td>
							<td class="graph" style="width:{44.6*$k}mm;border-left:solid 0.8pt black;">
								<!--span class="graphNo">30</span>
								<span class="graph">Местонахождение товаров</span-->
								<br/>
								<!--xsl:for-each select="ESADout_CU:ESADout_CUGoodsLocation">
									<xsl:if test="ESADout_CU:InformationTypeCode">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ESADout_CU:InformationTypeCode"/>
									</xsl:if>
									<xsl:if test="ESADout_CU:CustomsOffice">,
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ESADout_CU:CustomsOffice"/>,
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="ESADout_CU:Address">
										<br/>
										<xsl:apply-templates mode="ru_address" select="ESADout_CU:Address"/>
										<br/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="ESADout_CU:LocationName">
										<xsl:apply-templates select="ESADout_CU:LocationName"/>
									</xsl:if>,<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="ESADout_CU:GoodsLocationWarehouse">
										<xsl:apply-templates select="ESADout_CU:GoodsLocationWarehouse/cat_ru:PrDocumentName"/-->
								<!--N добавил,  как  в  примере pdp -->
										<!--N--><!--xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ESADout_CU:GoodsLocationWarehouse/cat_ru:PrDocumentNumber"/>
										<xsl:if test="ESADout_CU:GoodsLocationWarehouse/cat_ru:PrDocumentDate">
										от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates mode="date" select="ESADout_CU:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
										</xsl:if>
									,</xsl:if>
									<xsl:if test="ESADout_CU:RegisterDocumentIdDetails/catESAD_cu:DocId">
										<xsl:text> св-во: </xsl:text>
										<xsl:apply-templates select="ESADout_CU:RegisterDocumentIdDetails/catESAD_cu:DocId"/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="ESADout_CU:GoodsLocationPlace"-->
								<!--N добавил,  как  в  примере. pdp -->
										<!--N--><!--xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ESADout_CU:GoodsLocationPlace/catESAD_cu:NumberCustomsZone"/>,
									</xsl:if>
									<xsl:if test="ESADout_CU:Transport">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ESADout_CU:Transport/catESAD_cu:TransporKind"/>:<xsl:for-each select="ESADout_CU:Transport/catESAD_cu:TransporIdentifier">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">;</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<br/>
								</xsl:for-each-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<xsl:apply-templates select="cacdo:TransitGoodsItemDetails[position() = 1]"/>
		<!--table cellpadding="0" cellspacing="0" style="width:100%;">
			<tr valign="top">
				<td class="graph" style="border-right:solid 1px black; border-top: solid 1px black; border-bottom: solid 1px black; width: 73px;" valign="top">
					<span class="graphNo">47</span>
					<span class="graphColumn">Исчисление платежей</span>
				</td>
				<td class="graph" style="width: 45%;">
				</td>
				<td class="graph tl tr">
					<table cellpadding="1px" cellspacing="0" style="width: 100%">
						<tr>
							<td class="tb tr" style="width: 50%; vertical-align: top; min-height: 15pt;">
								<span class="graphNo">48</span>
								<span class="graph">Отсрочка платежей</span>
							</td>
							<td class="tb" style="vertical-align: top;">
								<span class="graphNo">49</span>
								<span class="graph">Реквизиты склада</span>
							</td>
						</tr>
					</table>
					<span class="graphNo">B</span>
					<span class="graph">ПОДРОБНОСТИ ПОДСЧЕТА</span>
					<table cellpadding="1px" cellspacing="0" style="width:100%;">
						<tr>
							<td class="graph" style="width:{83*$k}mm;" valign="top">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table-->
		<table cellpadding="0" cellspacing="0" style="width:100%;">
			<xsl:if test="../cacdo:TranshipmentDetails">
				<tr valign="top">
					<td class="graph" style="border-right: 1px solid black; border-bottom: solid 1px black; border-top: 1px solid black; width: 73px;" valign="top">
						<span class="graphNo">55</span>
						<span class="graphColumn">Перегрузки</span>
					</td>
					<td class="graph" colspan="5" style="background:#FFFFFF;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<xsl:for-each select="../cacdo:TranshipmentDetails">
									<td>
										<table cellpadding="0" cellspacing="0" style="width:100%;">
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Место и страна:</span>
													<!--xsl:value-of select="catESAD_cu:ReloadCountryCode"/>
													<xsl:apply-templates select="catESAD_cu:ReloadCountryName"/>
													<xsl:apply-templates select="catESAD_cu:ReloadingCustomsOffice/cat_ru:Code"/>
													<xsl:apply-templates select="catESAD_cu:ReloadingCustomsOffice/cat_ru:OfficeName"/-->
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Идентификация и страна регистрации нового транспортного
                                        средства:
                                    </span>
													<!--xsl:apply-templates select="catESAD_cu:ReloadingTransportMeans/cat_ru:TransportKindCode"/>,
													<xsl:for-each select="catESAD_cu:ReloadingTransportMeans/cat_ru:TransportIdentifier">
														<xsl:apply-templates select="."/>,
													</xsl:for-each>
													<xsl:if test="catESAD_cu:ReloadingTransportMeans/cat_ru:VIN">
														<xsl:apply-templates select="catESAD_cu:ReloadingTransportMeans/cat_ru:VIN"/>,
													</xsl:if>
													<xsl:if test="catESAD_cu:ReloadingTransportMeans/cat_ru:TransportMeansNationalityCode">
														<xsl:apply-templates select="catESAD_cu:ReloadingTransportMeans/cat_ru:TransportMeansNationalityCode"/>
													</xsl:if-->
												</td>
											</tr>
											<tr>
												<td class="graph" style="width:{20*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Контейнер</span>
												</td>
												<td align="center" class="graph" style="width:{10*$k}mm;border:solid 1pt black;" valign="top">
													<!--xsl:value-of select="number(boolean(catESAD_cu:ContainerIndicator))"/-->
													1
												</td>
												<td class="graph" style="width:{147*$k}mm;border:solid 0.8pt black;" valign="top">
													<!--span class="graph">(1) Номер нового контейнера </span-->
													<!--xsl:for-each select="catESAD_cu:ReloadContainer/catESAD_cu:ContainerNumber">
														<xsl:apply-templates select="."/>, 
													</xsl:for-each-->
													2
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Порядковый номер перевозчика</span>
												</td>
											</tr>
										</table>
									</td>
								</xsl:for-each>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td style="width:{73*$k}mm;border:solid 0.8pt black;">
					<span class="graphNo">F. </span>
					<span class="graphColumn">Подтверждение компетентных органов</span>
				</td>
				<td style="width:{88*$k}mm;border:solid 0.8pt black;"></td>
				<td style="width:{89*$k}mm;border:solid 0.8pt black;"></td>
			</tr>
			<tr valign="top">
				<td class="graph" colspan="6" style="width:{190*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" style="width:100%;">
						<tr>
							<td class="graph" style="width:{40*$k}mm;background:#FFFFFF; border-right: solid 0.8pt black;">
								<span class="graphNo">50</span>
								<span class="graph">Перевозчик</span>
							</td>
							<td class="graph" style="width:{60*$k}mm;background:#FFFFFF; border-right: solid 0.8pt black;">
								<span class="graphNo">51</span>
								<span class="graph">Дата, подпись, печать</span>
							</td>
							<td class="graph" rowspan="4" style="width:{57*$k}mm;border-left:solid 0.8pt black;" valign="top">
								<span class="graphNo">С</span>
								<span class="graph">Таможенный орган отправления</span>
								<br/>
								<!--xsl:if test="//*[@DocumentModeID='1006078E']/goom:GTDOutResolution">
									<xsl:for-each select="//*[@DocumentModeID='1006078E']/goom:GTDOutResolution">
										<xsl:for-each select="*[local-name()='DecisionCode' or local-name()='ResolutionDescription' or local-name()='DateInf']">
											<xsl:choose>
												<xsl:when test="local-name()='DateInf'">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="."/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="."/>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
											<xsl:if test="position()=last()"><br/></xsl:if>
										</xsl:for-each>
										<xsl:value-of select="catESAD_ru:LNP"/>
									</xsl:for-each>
								</xsl:if-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td class="graph" colspan="6">
					<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr>
							<td class="graph" rowspan="2" style="width:{13*$k}mm;border-bottom:solid 0.8pt black;border-top:solid 0.8pt black; border-left: solid 0.8pt black;" valign="top">
								<span class="graphNo">52</span>
								<span class="graphColumn">Гарантия</span>
							</td>
							<td class="graph" rowspan="2" style="width:{120*$k}mm;border-top:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;" valign="top">
								<!--xsl:choose>
									<xsl:when test="ESADout_CU:TDGuarantee">
										<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:DocNumber"> № 
									<xsl:apply-templates select="ESADout_CU:TDGuarantee/catESAD_cu:DocNumber"/>
										</xsl:if> от
									<xsl:apply-templates select="ESADout_CU:TDGuarantee/catESAD_cu:DocDate" mode="date"/>
										<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:GuaranteeName">
									БИК <xsl:apply-templates select="ESADout_CU:TDGuarantee/catESAD_cu:GuaranteeName"/>, 
								</xsl:if>
										<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:UNP">
									 УНП <xsl:apply-templates select="ESADout_CU:TDGuarantee/catESAD_cu:UNP"/>, 
								</xsl:if>
										<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:BIC">
									БИК <xsl:apply-templates select="ESADout_CU:TDGuarantee/catESAD_cu:BIC"/>, 
								</xsl:if>
										<xsl:if test="ESADout_CU:TDGuarantee/catESAD_cu:GuaranteeAmount">
											<xsl:text>, сумма: </xsl:text>
											<xsl:apply-templates select="ESADout_CU:TDGuarantee/catESAD_cu:GuaranteeAmount"/>
										</xsl:if>
									</xsl:when>
								</xsl:choose-->
							</td>
							<td class="graph" rowspan="2" style="width:{70*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;" valign="top">
								<span class="graphNo">53</span>
								<span class="graph">Таможенный орган назначения/пункт назначения</span>
								<br/>
								<!--xsl:if test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:TDDeliveryPlace/ESADout_CU:DeliveryCustomsOffice">
									<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:TDDeliveryPlace/ESADout_CU:DeliveryCustomsOffice/*">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td valign="top" class="graph" colspan="6" style="width:{190*$k}mm;border-top:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" style="width:100%;">
						<tr>
							<!--xsl:choose>
								<xsl:when test="//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark/catESAD_ru:GRNumber='D'">
									<td valign="top" class="graph" style="width:{103*$k}mm;" colspan="2">
										<span class="graphNo">D</span>
										<xsl:for-each select="//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark[catESAD_ru:GRNumber='D']">
											<br/>
											<xsl:apply-templates select="catESAD_ru:StageMarkIdentifier"/>
											<xsl:text>.</xsl:text>
											<xsl:apply-templates select="catESAD_ru:NoteMarkIdentifier"/>
											<xsl:if test="catESAD_ru:MarkDescription">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:MarkDescription"/>
											</xsl:if>
											<xsl:if test="catESAD_ru:Deadline">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:Deadline" mode="date"/>
											</xsl:if>
											<xsl:if test="catESAD_ru:DocumentInfo/cat_ru:PrDocumentNumber">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:DocumentInfo/cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="catESAD_ru:DocumentInfo/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:DocumentInfo/cat_ru:PrDocumentDate" mode="date"/>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="catESAD_ru:PersonName"/>
										</xsl:for-each>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td valign="top" class="graph" style="width:{43*$k}mm;">
										<span class="graphNo">D</span>
									</td>
									<td class="graph" style="width:{60*$k}mm;"/>
								</xsl:otherwise>
							</xsl:choose-->
							<td valign="top" class="graph" style="width:{95*$k}mm;border-right:solid 0.8pt black;">
								<span class="graphNo">D.</span>
								<span class="graph"> Отметки таможенного органа отправления</span>
							</td>
							<td class="graph" rowspan="6" style="width:{95*$k}mm;border-left:solid 0.8pt black;">
								<span class="graphNo">I. </span>
								<span class="graph">Контроль таможенного органа назначения</span>
								<br/>
								<!--xsl:for-each select="//ESADout_CU:CUESADCustomsRepresentative">
									<span class="graph">1) </span>
										Свид. о включении в Реестр таможенных представителей № <xsl:apply-templates select="RUDECLcat:BrokerRegistryDocDetails/RUDECLcat:RegisterDocumentDetails/RUScat_ru:RegistrationNumberId"/>;<br/>
									<xsl:for-each select="RUDECLcat:RepresentativeContractDetails">
											Договор таможенного представителя с декларантом № 
											 <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="cat_ru:PrDocumentDate">
											от 
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
										</xsl:if>; <br/>
									</xsl:for-each>
									<br/>
								</xsl:for-each-->
								<br/>
								<!--span class="graph">Подпись и фамилия декларанта/представителя</span-->
								<br/>
								<!--xsl:for-each select="//ESADout_CU:FilledPerson">
									<span class="graph">2)</span>
									<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonMiddleName"/>
									<xsl:text> </xsl:text>
									<br/>
									<xsl:for-each select="RUDECLcat:SignatoryPersonIdentityDetails">
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
										<xsl:if test="not(RUScat_ru:IdentityCardName)">
											<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
										</xsl:if>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="date"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
										<br/>
									</xsl:for-each>
									<xsl:if test="RUDECLcat:SigningDetails/cat_ru:PersonPost">
										<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonPost"/>
										<br/>
									</xsl:if>
									<xsl:for-each select="RUDECLcat:SigningDetails/RUScat_ru:CommunicationDetails">
											Телефон <xsl:for-each select="cat_ru:Phone">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<br/>
									</xsl:for-each>
									<xsl:for-each select="RUDECLcat:PowerOfAttorneyDetails">
										<span class="graph">3)</span>
										<xsl:if test="cat_ru:PrDocumentName">
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>, 
											</xsl:if>
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>, 
											<xsl:if test="cat_ru:PrDocumentDate">
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
										</xsl:if>
										<xsl:if test="RUScat_ru:DocValidityDate">
											<span class="graph">до </span>
											<xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="date"/>
											</xsl:if>
										<br/>
									</xsl:for-each>
								</xsl:for-each-->
								<!--Графа 4)-->
								<!--xsl:if test="//ESADout_CU:RegNumberDoc">
									<span class="graph">4)  Исходящий номер регистрации документов</span>
									<br/>
								</xsl:if>
								<xsl:apply-templates select="//ESADout_CU:RegNumberDoc"/>
								<xsl:text> </xsl:text>
								<br/>
								<xsl:if test="//ESADout_CU:SecurityLabelCode"> Код защитной наклейки
										<xsl:apply-templates select="//ESADout_CU:SecurityLabelCode"/>
								</xsl:if>
								<p align="right">
									<xsl:choose>
										<xsl:when test="(//ESADout_CU:CustomsProcedure ='TT') or (//ESADout_CU:CustomsProcedure ='ТТ')">
											<xsl:text> </xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:choose>
												<xsl:when test="//ESADout_CU:FilledPerson/RUDECLcat:SigningDetails/RUScat_ru:SigningDate">
													<xsl:apply-templates select="//ESADout_CU:FilledPerson/RUDECLcat:SigningDetails/RUScat_ru:SigningDate" mode="date"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="//ESADout_CU:EECEDocHeaderAddInfo/RUScat_ru:EDocDateTime" mode="date"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</p>
								<br/-->
								<!--/xsl:for-each-->
							</td>
						</tr>
						<!--xsl:if test="not(//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark/catESAD_ru:GRNumber='D')">
							<tr>
								<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Результат:</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{43*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Наложенные пломбы:</span>
								</td>
								<td/>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Номер:</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Срок доставки (дата):</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Подпись:</span>
								</td>
							</tr>
						</xsl:if-->
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="graph9">
		<xsl:apply-templates select="cacdo:SignatoryRepresentativeDetails/cacdo:RegisterDocumentIdDetails/casdo:RegistrationNumberId"/>
		<xsl:if test="cacdo:SignatoryRepresentativeDetails/cacdo:RepresentativeContractDetails">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cacdo:SignatoryRepresentativeDetails/cacdo:RepresentativeContractDetails" mode="doc"/>
		</xsl:if>
		<xsl:if test="cacdo:SignatoryPersonV2Details/casdo:QualificationCertificateId">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cacdo:SignatoryPersonV2Details/casdo:QualificationCertificateId"/>
		</xsl:if>
		<xsl:if test="cacdo:SignatoryPersonV2Details/cacdo:PowerOfAttorneyDetails">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cacdo:SignatoryPersonV2Details/cacdo:PowerOfAttorneyDetails" mode="doc"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="csdo:DocKindCode"/>
		<xsl:if test="csdo:DocKindCode and csdo:DocId">/</xsl:if>
		<xsl:apply-templates select="csdo:DocId"/>
		<xsl:if test="csdo:DocCreationDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cacdo:ConsignorDetails|cacdo:ConsigneeDetails|cacdo:DeclarantDetails">
		<xsl:apply-templates select="csdo:SubjectName"/>
		<xsl:if test="not(csdo:SubjectName) and csdo:SubjectBriefName">
			<xsl:value-of select="csdo:SubjectBriefName"/>
		</xsl:if>
		
		<xsl:if test="ccdo:SubjectAddressDetails">
			<br/>
			<xsl:apply-templates select="ccdo:SubjectAddressDetails"/>
		</xsl:if>
		
		<xsl:if test="ccdo:IdentityDocV3Details">
			<br/>
			<xsl:apply-templates select="ccdo:IdentityDocV3Details" mode="identity"/>
		</xsl:if>
		
		<xsl:if test="casdo:CAUniqueCustomsNumberId">
			<br/>
			<xsl:text>№ </xsl:text>
			<xsl:apply-templates select="casdo:CAUniqueCustomsNumberId"/>
		</xsl:if>
		
		<xsl:if test="csdo:UnifiedCountryCode">
			<br/>
			<xsl:apply-templates select="csdo:UnifiedCountryCode"/>
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template match="*" mode="identity">
		<xsl:apply-templates select="csdo:IdentityDocKindCode"/>
		<xsl:if test="csdo:IdentityDocKindCode">, </xsl:if>
		<xsl:apply-templates select="csdo:UnifiedCountryCode"/>
		<xsl:if test="csdo:DocSeriesId or csdo:DocId">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="csdo:DocSeriesId"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="csdo:DocId"/>
		</xsl:if>
		<xsl:if test="csdo:DocCreationDate">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date2"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="ccdo:SubjectAddressDetails">
		<xsl:if test="position() != 1">; </xsl:if>
		<xsl:choose>
			<xsl:when test="csdo:AddressKindCode=1"> Адрес регистрации: </xsl:when>
			<xsl:when test="csdo:AddressKindCode=2"> Фактический адрес: </xsl:when>
			<xsl:when test="csdo:AddressKindCode=3"> Почтовый адрес: </xsl:when>
		</xsl:choose>
		<xsl:for-each select="*[local-name() != 'AddressKindCode']">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<!--Верхняя часть листа ТД4-->
	<xsl:template name="td4Head">
	<table width="100%" style="border-collapse: collapse;" cellpadding="0" cellspacing="0">
			<tr>
				<td style="width:77%;">
					<table style="width: 100%; vertical-align: top; border-collapse: collapse; font-size: 7pt;" cellpadding="0" cellspacing="0">
						<tr>
							<td style="width: 71px;"/>
							<td class="header nowrap graphMain" colspan="2">ДОБАВОЧНЫЙ ЛИСТ ТРАНЗИТНОЙ ДЕКЛАРАЦИИ</td>
						</tr>
						<tr>
							<td/>
							<td class="tb">
								<table class="inline">
									<tr>
										<td class="header graphMain"/>
										<td class="number blankNumber" title="Номер бланка"/>
									</tr>
								</table>
							</td>
							<td class="bl bt br" colspan="4">
								<b>1</b> ДЕКЛАРАЦИЯ</td>
							<td colspan="6"/>
						</tr>
						<tr>
							<td/>
							<td class="tl green">
								<table width="100%" class="inline">
									<tr>
										<td class="nowrap" style="width: 50%; border-right: 0.8pt solid black;">
											<span class="graphNo">2</span>
											<span class="graphColumn">Отправитель</span>
										</td>
										<td class="nowrap" style="width: 50%;">
											<span class="graphNo">8</span>
											<span class="graphColumn">Получатель</span>
										</td>
									</tr>
								</table>
							</td>
							<td class="bl br" colspan="4"/>
							<td colspan="3"/>
						</tr>
						<tr>
							<td/>
							<td class="tl green br" rowspan="3" style="border-bottom:solid 0.8pt black;">
							</td>
							<td class="bl bb br containTable" colspan="4" style="vertical-align: bottom;">
								<table class="inline">
									<tr>
										<td align="center" class="graph" rowspan="2" style="width:{8.8*$k}mm;border-right:solid 0.8pt black;background:#FFFFFF;">
											<!--xsl:apply-templates select="//ESADout_CU:CustomsProcedure"/-->
										</td>
										<td align="center" class="graph" rowspan="2" style="width:{4.4*$k}mm;">
											<!--xsl:choose>
												<xsl:when test="(..//ESADout_CU:CustomsProcedure = 'ТТ') or (..//ESADout_CU:CustomsProcedure = 'TT')">
													<xsl:apply-templates select="//ESADout_CU:TransitFeature"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="//ESADout_CU:CustomsModeCode"/>
												</xsl:otherwise>
											</xsl:choose-->
										</td>
										<td align="center" class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
											<!--xsl:if test="//ESADout_CU:ElectronicDocumentSign">
												<xsl:value-of select="'ЭД '"/>
											</xsl:if-->
											<!--xsl:apply-templates select="//ESADout_CU:ElectronicDocumentSign"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="//ESADout_CU:DocUsageCode"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="//ESADout_CU:TransitDirectionCode"/-->
										</td>
									</tr>
								</table>
							</td>
							<td/>
						</tr>
						<tr>
							<td/>
							<td class="nowrap" colspan="2">
								<b>3</b> Формы
						<!--xsl:apply-templates select="catESAD_cu:AdditionalSheetCount"/-->
								<xsl:text> | </xsl:text>
								<!--xsl:apply-templates select="//catESAD_cu:TotalSheetNumber"/-->
							</td>
							<td class="br tb bl number" rowspan="2">1</td>
							<td class="br tb bl number" rowspan="2">6</td>
							<td/>
						</tr>
						<tr>
							<td class="tb"/>
							<td class="tb"/>
							<td class="tb"/>
							<td class="tb"/>
						</tr>
					</table>
				</td>
				<td class="graph" style="width:23%;">
					А. Таможенный орган отправления
				</td>
			</tr>
	</table>
		</xsl:template>
	<!--Товар-->
	<xsl:template match="cacdo:TransitGoodsItemDetails">
		<div class="goods">
			<xsl:attribute name="id"><xsl:text>generate-id(.)</xsl:text></xsl:attribute>
			<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
				<tr>
					<td class="graph" rowspan="3" style="width:68px; border-right:solid 0.8pt black;border-top:solid 0.8pt black;" valign="top">
						<span class="graphNo">31</span>
						<span class="graphColumn">Грузовые места<br/>и описание<br/>товаров</span>
					</td>
					<td class="graph" style="width:{98.8*$k}mm;border-top:solid 0.8pt black;background:#FFFFFF;" valign="top">
						<!--span class="graph">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</span-->
					</td>
					<td class="graph" style="width:{11*$k}mm; border-top:solid 0.8pt black; background:#FFFFFF;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<td class="graph" style="width:{11*$k}mm; border-left:solid 1pt black;">
									<span class="graphNo">32</span>
									<span class="graph">Товар</span>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph" style="border-left:solid 1pt black;border-bottom:solid 1pt black;border-right:solid 1pt black;">
									<xsl:choose>
										<xsl:when test="casdo:ConsignmentItemOrdinal">
											<xsl:apply-templates select="casdo:ConsignmentItemOrdinal"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="graph" style="width:{20.6*$k}mm;border-top:solid 0.8pt black;border-left:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;">
						<span class="graphNo">33</span>
						<span class="graph">Код товара</span>
						<br/>
						<xsl:apply-templates select="csdo:CommodityCode"/>
					</td>
					<td class="graph" colspan="2" style="border:solid 0.8pt black; vertical-align: bottom;">
						<table cellpadding="0" cellspacing="0" style="width:100%; vertical-align:bottom;">
							<tr class="graph" align="center">
								<td colspan="2" style="width:{23.8*$k}mm; border-right:solid 0.8pt black;">
									<br/>
								</td>
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black; ">
									<br/>
								</td>
								<td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;">
									<br/>
								</td>
							</tr>
							<tr class="graph" align="center">
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black;">
								</td>
								<td style="width:{17.8*$k}mm; border-right:solid 0.8pt black;">
								</td>
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black; ">
								</td>
								<td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="graph" colspan="2" rowspan="2" style="width:{122.8*$k}mm; border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;" valign="top">
						<!--span class="graph">1)</span>
						<xsl:if test="ESADout_CU:MilitaryProducts ='true' or ESADout_CU:MilitaryProducts ='t' or ESADout_CU:MilitaryProducts ='1'">
                               Продукция военного назначения
                            </xsl:if>
						<xsl:for-each select="catESAD_cu:GoodsDescription">
							<xsl:apply-templates select="."/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:for-each-->
						<!-- Сначала описание без характеристик групп -->
						<!--xsl:for-each select="catESAD_cu:GoodsGroupDescription[not (catESAD_cu:GoodsGroupInformation)]">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:for-each select="catESAD_cu:GoodsDescription">
								<xsl:apply-templates select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="catESAD_cu:GoodsGroupDescription[catESAD_cu:GoodsGroupInformation]">
							<br/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:if test="//ESADout_CU:DeclarationKind='ОКТ'">
								<xsl:if test="position()=1">1.1 </xsl:if>
							</xsl:if>
							<xsl:for-each select="catESAD_cu:GoodsDescription">
								<xsl:apply-templates select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
							<xsl:if test="catESAD_cu:ObjectOrdinal"> / <xsl:apply-templates select="catESAD_cu:ObjectOrdinal"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:if>
							<xsl:if test="catESAD_cu:RKTNVED">
								<xsl:apply-templates select="catESAD_cu:RKTNVED"/>
							</xsl:if>
							<xsl:for-each select="catESAD_cu:GoodsGroupInformation">
								<xsl:if test="catESAD_cu:InfoDescription">
									<xsl:text> Наим. артикула </xsl:text>
									<xsl:apply-templates select="catESAD_cu:InfoDescription"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:Manufacturer">
									<xsl:text> Производитель </xsl:text>
									<xsl:apply-templates select="catESAD_cu:Manufacturer"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:TradeMark">
									<xsl:text> Тов.знак </xsl:text>
									<xsl:apply-templates select="catESAD_cu:TradeMark"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsMark">
									<xsl:text> Торг. знак, марка </xsl:text>
									<xsl:apply-templates select="catESAD_cu:GoodsMark"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsModel">
									<xsl:text> Модель </xsl:text>
									<xsl:apply-templates select="catESAD_cu:GoodsModel"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsMarking">
									<xsl:text> Артикул </xsl:text>
									<xsl:apply-templates select="catESAD_cu:GoodsMarking"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsStandard">
									<xsl:text> Стандарт </xsl:text>
									<xsl:apply-templates select="catESAD_cu:GoodsStandard"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsSort">
									<xsl:text> Сорт: </xsl:text>
									<xsl:apply-templates select="catESAD_cu:GoodsSort"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:WoodDescriptionDetails">
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
										<xsl:text> Наим.сортимента: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
										<xsl:text> Порода древесины: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
										<xsl:text> Наименование сорта:</xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
										<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
										<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
										<xsl:text> Диапазон диаметров: </xsl:text>
										<xsl:for-each select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
											<xsl:if test="position()=2">, </xsl:if>
											<xsl:apply-templates select="catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
											<xsl:if test="catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
										<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
										<xsl:text> Фактический объем товара: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="catESAD_cu:Dimensions">
									<xsl:text> Размеры </xsl:text>
									<xsl:apply-templates select="catESAD_cu:Dimensions"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:DateIssue">
									<xsl:text> Дата выпуска </xsl:text>
									<xsl:apply-templates select="catESAD_cu:DateIssue" mode="date"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:SerialNumber">
									<xsl:text> Серийный номер: </xsl:text>
									<xsl:for-each select="catESAD_cu:SerialNumber">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="catESAD_cu:GoodsGroupQuantity">
									<xsl:text> Кол-во </xsl:text>
									<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
										<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
											<xsl:text> (</xsl:text>
											<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="//ESADout_CU:DeclarationKind='ОКТ'">
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:if test="catESAD_cu:WoodCodeDetails">
							<br/>
							<xsl:text>Сведения о лесоматериалах:</xsl:text>
							<xsl:for-each select="catESAD_cu:WoodCodeDetails">
								<br/>
								<xsl:apply-templates select="catESAD_cu:Numeric"/>
								<xsl:text>. ОКПД 2 - </xsl:text>
								<xsl:apply-templates select="catESAD_cu:NationalCommodityCode"/>
								<xsl:text>,</xsl:text>
								<xsl:if test="catESAD_cu:VolumeMeasure">
									<xsl:text> Объем без учета коры и припусков: </xsl:text>
									<xsl:apply-templates select="catESAD_cu:VolumeMeasure/cat_ru:GoodsQuantity"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="catESAD_cu:VolumeMeasure/cat_ru:MeasureUnitQualifierName"/>
									<xsl:if test="catESAD_cu:VolumeMeasure/cat_ru:MeasureUnitQualifierCode"> (<xsl:apply-templates select="catESAD_cu:VolumeMeasure/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
								</xsl:if>
								<xsl:if test="catESAD_cu:FactVolumeMeasure">
									<xsl:text> Объем с учетом коры и припусков: </xsl:text>
									<xsl:apply-templates select="catESAD_cu:FactVolumeMeasure/cat_ru:GoodsQuantity"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="catESAD_cu:FactVolumeMeasure/cat_ru:MeasureUnitQualifierName"/>
									<xsl:if test="catESAD_cu:FactVolumeMeasure/cat_ru:MeasureUnitQualifierCode"> (<xsl:apply-templates select="catESAD_cu:FactVolumeMeasure/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
								</xsl:if>
								<xsl:if test="catESAD_cu:HumidityMeasure">
									<xsl:text> Влажность: </xsl:text>
									<xsl:apply-templates select="catESAD_cu:HumidityMeasure/cat_ru:GoodsQuantity"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="catESAD_cu:HumidityMeasure/cat_ru:MeasureUnitQualifierName"/>
									<xsl:if test="catESAD_cu:HumidityMeasure/cat_ru:MeasureUnitQualifierCode"> (<xsl:apply-templates select="catESAD_cu:HumidityMeasure/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
								</xsl:if>
								<xsl:if test="catESAD_cu:ItemQuantity">
									<xsl:text> Бирок: </xsl:text>
									<xsl:apply-templates select="catESAD_cu:ItemQuantity"/>
									<xsl:if test="catESAD_cu:LabelId or catESAD_cu:LabelRangeDetails">
										<xsl:text> Номера бирок: </xsl:text>
										<xsl:for-each select="catESAD_cu:LabelId">
											<xsl:if test="position()!=1">; </xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
										<xsl:if test="catESAD_cu:LabelId and catESAD_cu:LabelRangeDetails">, </xsl:if>
										<xsl:for-each select="catESAD_cu:LabelRangeDetails">
											<xsl:if test="position()!=1">; </xsl:if>
											<xsl:apply-templates select="catESAD_cu:FirstLabelId"/>
											<xsl:text>-</xsl:text>
											<xsl:apply-templates select="catESAD_cu:LastLabelId"/>
										</xsl:for-each>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<br/>
						<xsl:if test="catESAD_cu:OilField"> Месторождения товара:
							<xsl:apply-templates select="catESAD_cu:OilField"/>
						</xsl:if>
						<xsl:if test="catESAD_cu:OriginCountryName">
							<br/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:apply-templates select="catESAD_cu:OriginCountryName"/>
						</xsl:if>
						<xsl:if test="ESADout_CU:SupplementaryGoodsQuantity">
							<br/>
							<xsl:apply-templates select="ESADout_CU:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:apply-templates select="ESADout_CU:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
							<xsl:if test="ESADout_CU:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"> (<xsl:apply-templates select="ESADout_CU:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
						</xsl:if>
						<xsl:for-each select="ESADout_CU:SupplementaryGoodsQuantity1">
							<br/>
							<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:if test="cat_ru:MeasureUnitQualifierCode"> (<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
						</xsl:for-each>
						<xsl:if test="(catESAD_cu:BeginPeriodDate!='') or (catESAD_cu:EndPeriodDate!='')">
							<br/>
							<xsl:if test="catESAD_cu:BeginPeriodDate">
								<span class="graph">Начало периода</span>
								<xsl:apply-templates select="catESAD_cu:BeginPeriodDate" mode="date"/>
							</xsl:if>
							<xsl:if test="catESAD_cu:EndPeriodDate">
								<span class="graph">Окончание периода</span>
								<xsl:apply-templates select="catESAD_cu:EndPeriodDate" mode="date"/>
							</xsl:if>
						</xsl:if>
						<xsl:if test="catESAD_cu:IPObjectRegistryNum">
							<xsl:if test="count(catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']) &gt; 0">
								<br/>
								<span class="graph">Единый ТРОИС ЕАЭС: </span>
								<xsl:for-each select="catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']">
									<xsl:if test="catESAD_cu:CountryCode">
										<span class="graph">(</span>
										<xsl:apply-templates select="catESAD_cu:CountryCode"/>
										<span class="graph">) </span>
									</xsl:if>
									<xsl:apply-templates select="catESAD_cu:IPORegistryNumber"/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="count(catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']) &gt; 0">
								<br/>
								<span class="graph">Национальный ТРОИС: </span>
								<xsl:for-each select="catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']">
									<xsl:if test="catESAD_cu:CountryCode">
										<span class="graph">(</span>
										<xsl:apply-templates select="catESAD_cu:CountryCode"/>
										<span class="graph">) </span>
									</xsl:if>
									<xsl:apply-templates select="catESAD_cu:IPORegistryNumber"/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</xsl:if>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADGoodsPackaging">
							<br/>
							<span class="graph">2)</span>
							<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageQuantity!=''">
								<xsl:apply-templates select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageQuantity"/>&#160;
								<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity">
                                        (<xsl:apply-templates select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity"/>-часть
                                        места)
                                    ,
                                </xsl:if>
								<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0' or catESAD_cu:InfoKindCode='2']">
									<xsl:for-each select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0' or catESAD_cu:InfoKindCode='2']">
										<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
										<xsl:if test="catESAD_cu:PalleteQuantity">
											<span class="graph">-</span>
											<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
										</xsl:if>
										<span class="graph">,</span>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
                                    Поддоны:
									<xsl:for-each select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
										<xsl:if test="catESAD_cu:CargoDescriptionText">
											<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
										</xsl:if>
										<span class="graph">,</span>
										<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/> /
										<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='1' or catESAD_cu:InfoKindCode='4']">
									<br/>2.1
									<xsl:for-each select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='1' or catESAD_cu:InfoKindCode='4']">
										<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
										<xsl:if test="catESAD_cu:PalleteQuantity">
											<span class="graph">-</span>
											<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
										</xsl:if>
										<span class="graph">,</span>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=0">
                                без упаковки
                            </xsl:if>
							<xsl:if test="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=2">
                                без упаковки/
								<xsl:for-each select="ESADout_CU:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
									<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
									<span class="graph">,</span>
								</xsl:for-each>
							</xsl:if>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADContainer">
							<br/>
							<span class="graph">3) </span>
							<xsl:for-each select="ESADout_CU:ESADContainer">
								<xsl:apply-templates select="catESAD_cu:ContainerQuantity"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:apply-templates select="catESAD_cu:ContainerKind"/>: <xsl:for-each select="catESAD_cu:ContainerNumber">
									<xsl:apply-templates select="catESAD_cu:ContainerIdentificaror"/>
									<xsl:if test="catESAD_cu:FullIndicator='2'">
										<span class="graph">часть</span>
									</xsl:if>
									<span class="graph">,</span>
								</xsl:for-each>
								<xsl:if test="position()!=last()">
									<span class="graph">; </span>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADExcise">
							<br/>
							<span class="graph">4) </span>
							<xsl:for-each select="ESADout_CU:ESADExcise">
								<xsl:apply-templates select="catESAD_cu:ExciseSerieses"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:ExciseList">
									<xsl:for-each select="catESAD_cu:ExciseNumber">
										<xsl:apply-templates select="."/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="catESAD_cu:ExciseRange">
									<xsl:apply-templates select="catESAD_cu:ExciseFirstNumber"/>
									<xsl:text disable-output-escaping="yes">-</xsl:text>
									<xsl:apply-templates select="catESAD_cu:ExciseLastNumber"/>
									<xsl:if test="position()!=last()">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:if>
								</xsl:for-each>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:apply-templates select="catESAD_cu:ExciseQuantity"/>
								<span class="graph">;</span>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="catESAD_cu:CUESADDeliveryTerms">
							<br/>
							<span class="graph">5) </span>
							<xsl:for-each select="catESAD_cu:CUESADDeliveryTerms">
								<xsl:apply-templates select="cat_ru:DeliveryTermsStringCode"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="cat_ru:DeliveryPlace"> - 
									<xsl:apply-templates select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="cat_ru:TransferPlace">
									<xsl:apply-templates select="cat_ru:TransferPlace"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions">
							<br/>
							<span class="graph">6) </span>
							<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:RateOutputGoods">
								<xsl:apply-templates select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
							<br/>
							<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct">
							Продукт переработки:
							<xsl:apply-templates select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct/catESAD_cu:GoodsTNVEDCode"/>
								<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct/catESAD_cu:GoodsDescription">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct/catESAD_cu:ProcessingGoodsQuantity">
									<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:ProcessingProduct/catESAD_cu:ProcessingGoodsQuantity">
										<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
										<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											(<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>) 
										</xsl:if>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<br/>
							<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts">
							Отходы:
							<xsl:apply-templates select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts/catESAD_cu:GoodsTNVEDCode"/>
								<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts/catESAD_cu:GoodsDescription">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts/catESAD_cu:ProcessingGoodsQuantity">
									<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:WasteProducts/catESAD_cu:ProcessingGoodsQuantity">
										<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
										<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											(<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>) 
										</xsl:if>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<br/>
							<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels">
							Остатки:
							<xsl:apply-templates select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels/catESAD_cu:GoodsTNVEDCode"/>
								<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels/catESAD_cu:GoodsDescription">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels/catESAD_cu:ProcessingGoodsQuantity">
									<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Heels/catESAD_cu:ProcessingGoodsQuantity">
										<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
										<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											(<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>) 
										</xsl:if>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<br/>
							<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:GoodsIdentificationMethod">
							Способ идентификации:
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:apply-templates select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
							<br/>
							<xsl:if test="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Substitute">
							Сведения о замене иностранных товаров эквивалентными товарами:
							<xsl:for-each select="ESADout_CU:ESADout_CUCustomsConditions/RUDECLcat:Substitute">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</xsl:if>
						</xsl:if>
						<xsl:if test="(catESAD_cu:DeliveryTime) or (catESAD_cu:DeliveryTimeEND)">
							<br/>
							<span class="graph">7) Поставка в период</span> с
							<xsl:apply-templates select="catESAD_cu:DeliveryTime" mode="date"/>
							<xsl:if test="catESAD_cu:DeliveryTimeEND">
								по <xsl:apply-templates select="catESAD_cu:DeliveryTimeEND" mode="date"/>
							</xsl:if>
						</xsl:if>
						<xsl:if test="catESAD_cu:QuantityFact/cat_ru:GoodsQuantity">
							<br/>
							<span class="graph">8) </span>
							<xsl:apply-templates select="catESAD_cu:QuantityFact/cat_ru:GoodsQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:apply-templates select="catESAD_cu:QuantityFact/cat_ru:MeasureUnitQualifierName"/>
							<xsl:if test="catESAD_cu:QuantityFact/cat_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
								<xsl:apply-templates select="catESAD_cu:QuantityFact/cat_ru:MeasureUnitQualifierCode"/>
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
						<xsl:if test="(ESADout_CU:ElectricalEnergReceived) or (ESADout_CU:ElectricalEnergGiven)">
							<br/>
							<span class="graph">9) </span>
							<xsl:for-each select="ESADout_CU:ElectricalEnergReceived">
								принято <xsl:apply-templates select="catESAD_cu:ElectricalEnergyQuantity"/> тыс. кВт.ч
								<xsl:if test="catESAD_cu:QualifierCode">
									(<xsl:apply-templates select="catESAD_cu:QualifierCode"/>)
								</xsl:if>, 
							</xsl:for-each>
							<xsl:for-each select="ESADout_CU:ElectricalEnergGiven">
								отдано <xsl:apply-templates select="catESAD_cu:ElectricalEnergyQuantity"/> тыс. кВт.ч
								<xsl:if test="catESAD_cu:QualifierCode">
									(<xsl:apply-templates select="catESAD_cu:QualifierCode"/>)
								</xsl:if>, 
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="catESAD_cu:CIMIdDetails">
							<br/>
							<xsl:for-each select="catESAD_cu:CIMIdDetails">
								<span class="graph">10) </span>
								<xsl:apply-templates select="catESAD_cu:CIMQuantity"/>
								<xsl:text>:</xsl:text>
								<xsl:for-each select="catESAD_cu:CIMList">
									<xsl:apply-templates select="catESAD_cu:CIMID"/>
									<xsl:if test="position()!=last()">
										<xsl:text>,</xsl:text>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="catESAD_cu:CIMList and catESAD_cu:CIMRange">
									<xsl:text>,</xsl:text>
								</xsl:if>
								<xsl:for-each select="catESAD_cu:CIMRange">
									<xsl:apply-templates select="catESAD_cu:FirstCIMID"/>
									<xsl:text>-</xsl:text>
									<xsl:apply-templates select="catESAD_cu:LastCIMID"/>
									<xsl:if test="position()!=last()">,</xsl:if>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:if>
						<xsl:for-each select="catESAD_cu:GoodsSTZ">
							<br/>
							<span class="graph">11) </span>
							<br/>
							Номер строки в гр 40 <xsl:apply-templates select="catESAD_cu:LineNumber"/>
							<br/>
							<xsl:for-each select="catESAD_cu:GoodsDescription">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
							Кол-во 
							<xsl:for-each select="catESAD_cu:SupplementaryQuantity">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
								<xsl:if test="cat_ru:MeasureUnitQualifierCode">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(
                                    <xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>)
                                </xsl:if>
							</xsl:for-each-->
							<!-- Сначала описание без характеристик групп -->
							<!--xsl:for-each select="catESAD_cu:GoodsGroupDescription[not (catESAD_cu:GoodsGroupInformation)]">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:GoodsDescription">
									<xsl:apply-templates select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="catESAD_cu:GoodsGroupDescription[catESAD_cu:GoodsGroupInformation]">
								<br/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:GoodsDescription">
									<xsl:apply-templates select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:for-each>
								<xsl:if test="catESAD_cu:ObjectOrdinal"> / <xsl:apply-templates select="catESAD_cu:ObjectOrdinal"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:if>
								<xsl:if test="catESAD_cu:RKTNVED">
									<xsl:apply-templates select="catESAD_cu:RKTNVED"/>
								</xsl:if>
								<xsl:for-each select="catESAD_cu:GoodsGroupInformation">
									<xsl:if test="catESAD_cu:InfoDescription">
										<xsl:text> Наим. артикула </xsl:text>
										<xsl:apply-templates select="catESAD_cu:InfoDescription"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:Manufacturer">
										<xsl:text> Производитель </xsl:text>
										<xsl:apply-templates select="catESAD_cu:Manufacturer"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:TradeMark">
										<xsl:text> Тов.знак </xsl:text>
										<xsl:apply-templates select="catESAD_cu:TradeMark"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsMark">
										<xsl:text> Торг. знак, марка </xsl:text>
										<xsl:apply-templates select="catESAD_cu:GoodsMark"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsModel">
										<xsl:text> Модель </xsl:text>
										<xsl:apply-templates select="catESAD_cu:GoodsModel"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsMarking">
										<xsl:text> Артикул</xsl:text>
										<xsl:apply-templates select="catESAD_cu:GoodsMarking"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsStandard">
										<xsl:text> Стандарт </xsl:text>
										<xsl:apply-templates select="catESAD_cu:GoodsStandard"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsSort">
										<xsl:text> Сорт: </xsl:text>
										<xsl:apply-templates select="catESAD_cu:GoodsSort"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:WoodDescriptionDetails">
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
											<xsl:text> Наим.сортимента: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
											<xsl:text> Порода древесины: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
											<xsl:text> Наименование сорта:</xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
											<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
											<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
											<xsl:text> Диапазон диаметров: </xsl:text>
											<xsl:for-each select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
												<xsl:if test="position()=2">, </xsl:if>
												<xsl:apply-templates select="catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
												<xsl:if test="catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
											<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
										</xsl:if>
										<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
											<xsl:text> Фактический объем товара: </xsl:text>
											<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
										</xsl:if>
									</xsl:if>
									<xsl:if test="catESAD_cu:Dimensions">
										<xsl:text> Размеры </xsl:text>
										<xsl:apply-templates select="catESAD_cu:Dimensions"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:DateIssue">
										<xsl:text> Дата выпуска </xsl:text>
										<xsl:apply-templates select="catESAD_cu:DateIssue" mode="date"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:SerialNumber">
										<xsl:text> Серийный номер: </xsl:text>
										<xsl:for-each select="catESAD_cu:SerialNumber">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="catESAD_cu:GoodsGroupQuantity">
										<xsl:text> Кол-во </xsl:text>
										<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
											<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
												<xsl:text> (</xsl:text>
												<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:if test="catESAD_cu:DTIdentificationMeansDetails">
							<br/>
							<xsl:for-each select="catESAD_cu:DTIdentificationMeansDetails">
								<span class="graph">13) </span>
								<xsl:if test="catESAD_cu:CIMQuantity">
									<xsl:apply-templates select="catESAD_cu:CIMQuantity"/>
									<xsl:text>:</xsl:text>
								</xsl:if>
								<xsl:if test="catESAD_cu:IdentificationMeansDetails">
									<xsl:for-each select="catESAD_cu:IdentificationMeansDetails">
										<xsl:apply-templates select="catESAD_cu:AggregationKindCode"/>
										<xsl:text>/</xsl:text>
										<xsl:variable name="IdentMeans" select="catESAD_cu:IdentificationMeansListDetails/catESAD_cu:IdentificationMeansItemDetails/catESAD_cu:IdentificationMeansDataUnitDetails/catESAD_cu:IdentifacationMeansUnitCharacterValueId"/>
										<xsl:for-each select="$IdentMeans[position() &lt; 11]">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">,</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($IdentMeans) &gt; 10">
											<xsl:text> - список средств идентификации сокращен </xsl:text>
										</xsl:if>
										<xsl:if test="catESAD_cu:IdentificationMeansListDetails and catESAD_cu:IdentificationMeansRangeDetails">
											<xsl:text>,</xsl:text>
										</xsl:if>
										<xsl:for-each select="catESAD_cu:IdentificationMeansRangeDetails">
											<xsl:for-each select="catESAD_cu:FirstIdentificationMeansItemDetails">
												<xsl:apply-templates select="catESAD_cu:IdentificationMeansDataUnitDetails/catESAD_cu:IdentifacationMeansUnitCharacterValueId"/>
											</xsl:for-each>
											<xsl:text> - </xsl:text>
											<xsl:for-each select="catESAD_cu:LastIdentificationMeansItemDetails">
												<xsl:apply-templates select="catESAD_cu:IdentificationMeansDataUnitDetails/catESAD_cu:IdentifacationMeansUnitCharacterValueId"/>
											</xsl:for-each>
											<xsl:if test="position()!=last()">,</xsl:if>
										</xsl:for-each>
										<xsl:if test="position()!=last()">;</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="catESAD_cu:CIMMarkingCode='ПВ'"> Нанесены после выпуска товаров</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="ESADout_CU:DestinationCountryDetails[catESAD_cu:CountryName]">
							<br/>
							<span class="graph">14) </span>
							<xsl:for-each select="ESADout_CU:DestinationCountryDetails/catESAD_cu:CountryName">
								<xsl:if test="position() != 1">, </xsl:if>
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="catESAD_cu:GoodsTraceabilityCode">
							<br/>
							<span class="graph">15) </span>
							<xsl:apply-templates select="catESAD_cu:GoodsTraceabilityMeasureDetails/catESAD_cu:GoodsQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:apply-templates select="catESAD_cu:GoodsTraceabilityMeasureDetails/catESAD_cu:MeasureUnitQualifierName"/>
							<xsl:if test="catESAD_cu:GoodsTraceabilityMeasureDetails/catESAD_cu:MeasureUnitQualifierCode"> (<xsl:apply-templates select="catESAD_cu:GoodsTraceabilityMeasureDetails/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
						</xsl:if-->
					</td>
					<td colspan="3" style="width:{67.2*$k}mm; vertical-align: top; border-right:solid 0.8pt black;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr class="graph" align="left" style="vertical-align: top">
								<td width="3%"/>
								<td width="14%"/>
								<td width="3%"/>
								<td width="11%"/>
								<td width="46%"/>
								<td width="23%"/>
							</tr>
							<tr class="graph" align="left" style="vertical-align: top">
								<td colspan="4" style="border-left:solid 1pt black; border-right:solid 1pt black;">
									<!--span class="graphNo">34</span>
									<span class="graph">Код страны происх.</span-->
								</td>
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">35</span>
									<span class="graph">Масса брутто (кг)</span>
								</td>
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<!--span class="graphNo">36</span>
									<span class="graph">Преференция</span-->
								</td>
							</tr>
							<tr class="graph" align="center" style="vertical-align: bottom">
								<td style="border-left:solid 1pt black;border-right:solid 0.8pt black;border-bottom:solid 1pt black;word-break: break-all;"><!--a--></td>
								<td style="border-right:solid 0.8pt black; border-bottom:solid 1pt black;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<!--xsl:choose>
										<xsl:when test="catESAD_cu:OriginCountryCode!=''">
											<xsl:apply-templates select="catESAD_cu:OriginCountryCode"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose-->
								</td>
								<td style="border-right:solid 0.8pt black; border-bottom:solid 1pt black;word-break: break-all;"><!--b--></td>
								<td style="border-right:solid 1pt black; border-bottom:solid 1pt black;word-break: break-all;">
									<!--xsl:apply-templates select="catESAD_cu:PrefOriginCountry/catESAD_cu:CountryCode"/-->
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="left" style="border-right:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
									<xsl:choose>
										<xsl:when test="csdo:UnifiedGrossMassMeasure &lt; 0.001">
											<xsl:apply-templates select="csdo:UnifiedGrossMassMeasure" mode="format_number_6"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="csdo:UnifiedGrossMassMeasure" mode="format_number_3"/>
										</xsl:otherwise>
									</xsl:choose>
									
								</td>
								<td align="left" style="border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;word-break: break-all;">
									<!--xsl:choose>
										<xsl:when test="catESAD_cu:Preferencii">
											<xsl:apply-templates select="catESAD_cu:Preferencii/catESAD_cu:CustomsTax"/>
											<xsl:apply-templates select="catESAD_cu:Preferencii/catESAD_cu:CustomsDuty"/>
											<xsl:apply-templates select="catESAD_cu:Preferencii/catESAD_cu:Excise"/>
											<xsl:apply-templates select="catESAD_cu:Preferencii/catESAD_cu:Rate"/>
										</xsl:when>
										<xsl:otherwise>
											<br/>
										</xsl:otherwise>
									</xsl:choose-->
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: top">
								<td colspan="4" style="border-left:solid 1pt black;border-right:solid 1pt black;word-break: break-all;">
									<!--span class="graphNo">37</span>
									<span class="graph">Процедура</span-->
									<br/>
								</td>
								<!--td style="width:{30.8*$k}mm; border-right:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<!--span class="graphNo">38</span>
									<span class="graph">Вес нетто (кг)</span-->
								</td>
								<!--td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<!--span class="graphNo">39</span>
									<span class="graphTitleIt">Квота</span-->
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: bottom">
								<td colspan="2" align="center" style="border-left:solid 1pt black; border-right:solid 0.8pt black; border-bottom:solid 1pt black;word-break: break-all;">
									<!--xsl:choose>
										<xsl:when test="ESADout_CU:ESADCustomsProcedure">
											<xsl:apply-templates select="ESADout_CU:ESADCustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
											<xsl:apply-templates select="ESADout_CU:ESADCustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose-->
								</td>
								<td colspan="2" align="center" style="border-right:solid 1pt black;border-bottom:solid 1pt black;word-break: break-all;">
									<!--xsl:choose>
										<xsl:when test="ESADout_CU:ESADCustomsProcedure">
											<xsl:apply-templates select="ESADout_CU:ESADCustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose-->
								</td>
								<td style="border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;word-break: break-all;">
									<!--xsl:apply-templates select="catESAD_cu:NetWeightQuantity"/>
									<xsl:if test="catESAD_cu:NetWeightQuantity2">/<xsl:apply-templates select="catESAD_cu:NetWeightQuantity2"/>
									</xsl:if>
									<xsl:if test="ESADout_CU:TotalNetMassMeasure"> / <xsl:apply-templates select="ESADout_CU:TotalNetMassMeasure/cat_ru:GoodsQuantity"/>
									</xsl:if-->
								</td>
								<td style="border-right:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
									<!--xsl:for-each select="ESADout_CU:ESADGoodsQuota">
										<xsl:if test="catESAD_cu:ESADCurrencyQuota">
											<xsl:for-each select="catESAD_cu:ESADCurrencyQuota">
												<xsl:apply-templates select="catESAD_cu:QuotaCurrencyQuantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="catESAD_cu:QuotaCurrencyName"/>
												(<xsl:apply-templates select="catESAD_cu:QuotaCurrencyCode"/>)
											</xsl:for-each>
										</xsl:if>
										<br/>
										<xsl:if test="catESAD_cu:ESADProductQuantityQuota">
											<xsl:for-each select="catESAD_cu:ESADProductQuantityQuota">
												<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
												(<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>)
											</xsl:for-each>
										</xsl:if>
									</xsl:for-each-->
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="graph" style="vertical-align: bottom;">
					<td colspan="3" style="width:{67.2*$k}mm; border-right:solid 0.8pt black; border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr class="graph" align="left" style="vertical-align: top">
								<td colspan="2" style="width:{67.2*$k}mm; border-left:solid 0.8pt black; border-top:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">40</span>
									<span class="graph">Предшествующий документ</span>
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: bottom">
								<td colspan="2" style="width:{67.2*$k}mm; border-left:solid 0.8pt black;word-break: break-all;">
									<xsl:if test="not(cacdo:TDPrecedingDocDetails)">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:if>
									<xsl:for-each select="cacdo:TDPrecedingDocDetails">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="csdo:DocKindCode"/>
										<xsl:for-each select="cacdo:CustomsDocIdDetails">
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date_gtd"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="casdo:CustomsDocumentId"/>
											<xsl:if test="casdo:CustomsDocumentOrdinalId">
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="casdo:CustomsDocumentOrdinalId"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="cacdo:TIRIdDetails">
											<xsl:text>/</xsl:text>
											<xsl:for-each select="*">
												<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="csdo:DocId">
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
										<xsl:if test="casdo:CustomsProcedureCode">
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="casdo:CustomsProcedureCode"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:{33.6*$k}mm; vertical-align: top; border:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">41</span>
									<span class="graph">Доп.единицы измерения</span>
									<br/>
									<!--xsl:for-each select="ESADout_CU:SupplementaryGoodsQuantity">
										<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierName">
											<xsl:text disable-output-escaping="yes">/</xsl:text>
											<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
										</xsl:if>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											<xsl:text disable-output-escaping="yes">/</xsl:text>
											<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
										</xsl:if>
									</xsl:for-each-->
								</td>
								<td class="graph" style="width:{33.6*$k}mm; vertical-align: top; border-top:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">42</span>
									<span class="graph">Валюта и стоимость товара</span>
									<br/>
									<!--xsl:if test="catESAD_cu:InvoicedCost">
										<xsl:apply-templates select="catESAD_cu:InvoicedCost" mode="format_number_2"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:InvoicedCurrencyCode">/<xsl:apply-templates select="catESAD_cu:InvoicedCurrencyCode"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:InvoicedCurrencyRate">/<xsl:apply-templates select="catESAD_cu:InvoicedCurrencyRate" mode="format_number_4"/>
									</xsl:if-->
								</td>
							</tr>
						
						</table>
					</td>
				</tr>
				<tr valign="top">
					<td class="graph" style="width:{13*$k}mm;border-right:solid 0.8pt black;border-top:solid 0.4pt black;border-bottom:solid 0.8pt black;word-break: break-all;" valign="top">
						<span class="graphNo">44</span>
						<span class="graphColumn">Дополнит. информация/ Представл. документы/ Сертификаты и разрешения</span>
					</td>
					<td class="graph" colspan="2" style="width:{122.8*$k}mm;border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;">
					</td>
					<td class="graph" colspan="3" style="width:{67.2*$k}mm;border-bottom:solid 0.8pt black; border-right:solid 0.8pt black;word-break: break-all;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<td class="graph" style="width:{27.2*$k}mm; vertical-align: top; border:solid 0.8pt black;word-break: break-all;">
									<!--span class="graphNo">41</span>
									<span class="graph">Доп.единицы измерения</span>
									<br/-->
									<!--xsl:for-each select="ESADout_CU:SupplementaryGoodsQuantity">
										<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
										<xsl:if test="cat_ru:MeasureUnitQualifierName">
											<xsl:text disable-output-escaping="yes">/</xsl:text>
											<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
										</xsl:if>
										<xsl:if test="cat_ru:MeasureUnitQualifierCode">
											<xsl:text disable-output-escaping="yes">/</xsl:text>
											<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
										</xsl:if>
									</xsl:for-each-->
								</td>
								<td class="graph" style="width:{28*$k}mm; vertical-align: top; border-top:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
									<!--span class="graphNo">42</span>
									<span class="graph">Валюта и стоимость товара</span>
									<br/-->
									<!--xsl:if test="catESAD_cu:InvoicedCost">
										<xsl:apply-templates select="catESAD_cu:InvoicedCost" mode="format_number_2"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:InvoicedCurrencyCode">/<xsl:apply-templates select="catESAD_cu:InvoicedCurrencyCode"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:InvoicedCurrencyRate">/<xsl:apply-templates select="catESAD_cu:InvoicedCurrencyRate" mode="format_number_4"/>
									</xsl:if-->
								</td>
								<td style="vertical-align: bottom; border:solid 0.8pt black; border-left:solid 1pt black;word-break: break-all;">
									<!--table cellpadding="0" cellspacing="0" style="width:100%;">
										<tr>
											<td align="left" class="graph" colspan="2" style="width:{15.8*$k}mm;word-break: break-all;">
												<span class="graphNo">43</span>
												<span class="graph">Код МОС</span>
											</td>
										</tr>
										<tr>
											<td align="center" class="graph" style="width:{8.8*$k}mm; border-bottom:solid 1pt black; border-right:solid 1pt black;word-break: break-all;">
											</td>
											<td align="left" class="graph" style="width:{7*$k}mm;word-break: break-all;">
												<br/>
											</td>
										</tr>
									</table-->
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" style="width:100%">
							<tr class="graph">
								<td rowspan="2" style="width:{27.2*$k}mm;background:#FFFFFF;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:{10*$k}mm;border-right:solid 1pt black;background:#FFFFFF;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td rowspan="2" style="width:{30*$k}mm; border-top:solid 0.8pt black;word-break: break-all;" valign="top">
									<!--span class="graphNo">45</span>
									<span class="graph">Таможенная стоимость</span-->
									<br/>
									<!--xsl:if test="catESAD_cu:CustomsCost">
										<xsl:apply-templates select="catESAD_cu:CustomsCost" mode="format_number_2"/>
									</xsl:if-->
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:{10*$k}mm;border-right:solid 1pt black;border-bottom:solid 1pt black;border-left:solid 1pt black;background:#FFFFFF;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<td class="graph" style="width:{27.2*$k}mm; border-bottom:solid 0.4pt silver; border-top:solid 0.4pt silver; border-left:solid 0.4pt silver; background:#FFFFFF;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td class="graph" style="width:{40*$k}mm; border:solid 0.8pt black;word-break: break-all;">
									<!--span class="graphNo">46</span>
									<span class="graph">Статистическая стоимость</span-->
									<br/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<!--xsl:if test="catESAD_cu:StatisticalCost">
										<xsl:apply-templates select="catESAD_cu:StatisticalCost" mode="format_number_2"/>
									</xsl:if>
									<xsl:if test="catESAD_cu:TotalStatisticValueAmount"> / <xsl:apply-templates select="catESAD_cu:TotalStatisticValueAmount" mode="format_number_2"/>
									</xsl:if-->
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
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
	<xsl:template name="russian_date2">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='TransitDeclaration']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date2">
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
	<xsl:template match="*" mode="format_number_3">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.000')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="format_number_6">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.000000')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
