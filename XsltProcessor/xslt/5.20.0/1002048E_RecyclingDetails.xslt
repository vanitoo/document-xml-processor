<?xml version="1.0" encoding="utf-8"?>
<!-- (в ред. Постановлений Правительства РФ от 06.02.2016 № 81, от 06.10.2017 № 1215, от 18.11.2020 № 1866) (Форма расчета УС по ПП 81_С) -->
<!-- (в ред. Постановления Правительства РФ от 31.05.2018 № 639) (Форма расчета УС по ПП 1291_К) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.20.0" xmlns:rd="urn:customs.ru:Information:CommercialFinanceDocuments:RecyclingDetails:5.20.0">
	<xsl:key name="typeKC" match="rd:UtilCollDetails" use="rd:TPORegNumber" />
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
	<xsl:template match="//*[local-name()='RecyclingDetails']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="transl">
		<xsl:variable name="xpath_transl">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_transl}">
			<xsl:value-of select="translate(., '.', ',')"/>
		</element>
	</xsl:template>
	<!-- Шаблон для типа RecyclingDetailsType -->
	<xsl:template match="rd:RecyclingDetails">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Индивидуальная накладная при экспресс перевозке</title>
				<style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    div.pagePortrait {
                        width: 210mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    div.pageAlbum {
                        width: 297mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    .bold {
                        font-weight: bold;
                    }


                    .bold2 {
                        font-weight: bold;
                    }
                    td {
                        vertical-align: top;
                    }

                    table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
                    
					td { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }					
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }										
					td.value { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }					
					td.border-left { border-left: medium none; border-right: .5pt solid black; }					
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }					
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 					
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 					
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 					
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 					
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 					
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 					
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }					
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }					
					td.border-left-right-top { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }					
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }					
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }					
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }					
					td.border-left-top { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 					
					td.border-right-top { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }                     
					th { font-weight: bold;font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }					

					.bold{
						font-weight: bold;
						font-family:Arial;
						font-size: 13pt;
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
					.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					text-align: center;
					}
					.graph8Bold {
					font-family: Arial;
					font-size: 8pt;
					font-weight: bold;
					}				
                    
                    @media print {
                        div.pageAlbum {
                            border: none;
                        }
                    }
                </style>
			</head>
			<body>
<!-- ************************************************************************************************************************************************************************************************************** -->						
<!-- *** реализация для (Форма расчета УС по ПП 1291_К) ******************************************************************************************************************************************** -->						
<!-- ************************************************************************************************************************************************************************************************************** -->	
				<xsl:if test="rd:UtilCollDetails[rd:Sign = 'К' or rd:Sign = 'K']"> <!-- реализация для (Форма расчета УС по ПП 1291_К) -->
					<div class="pageAlbum">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b><xsl:text>Р А С Ч Е Т</xsl:text></b><br/>
												<b><xsl:text>суммы утилизационного сбора в отношении колесных транспортных средств (шасси) и (или) прицепов к ним, уплачиваемого лицами, указанными в абзаце втором пункта 3 статьи 24.1 Федерального закона "Об отходах производства и потребления"</xsl:text></b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tr>
									<td class="graphMain" width="2%"></td>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="42%"/>
									<td class="graphMain" width="32%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="3%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="9%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="3%"/>
									<td class="graphMain" width="5%"/>
									<td class="graphMain" width="2%"/>
									<td class="graphMain" width="3%"/>
								</tr>
								<tr valign="bottom" align="center">
									<td class="graphMain" width="2%">
										<xsl:text>В</xsl:text>
									</td>
									<td colspan="2" class="border-bottom">
										<xsl:apply-templates select="rd:Customs/cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rd:Customs/cat_ru:OfficeName"/>
									</td>
									<td class="graphMain"/>
									<td class="graphMain" align="center">
										<xsl:text>"</xsl:text>
									</td>
									<td class="border-bottom">
										<xsl:value-of select="substring(rd:CalculateDate, 9, 2)"/>
									</td>
									<td class="graphMain" align="center">
										<xsl:text>"</xsl:text>
									</td>
									<td class="graphMain"/>
									<td class="border-bottom">
										<xsl:variable name="month" select="substring(rd:CalculateDate, 6, 2)"/>
										<xsl:choose>
											<xsl:when test="$month = '01'">января</xsl:when>
											<xsl:when test="$month = '02'">февраля</xsl:when>
											<xsl:when test="$month = '03'">марта</xsl:when>
											<xsl:when test="$month = '04'">апреля</xsl:when>
											<xsl:when test="$month = '05'">мая</xsl:when>
											<xsl:when test="$month = '06'">июня</xsl:when>
											<xsl:when test="$month = '07'">июля</xsl:when>
											<xsl:when test="$month = '08'">августа</xsl:when>
											<xsl:when test="$month = '09'">сентября</xsl:when>
											<xsl:when test="$month = '10'">октября</xsl:when>
											<xsl:when test="$month = '11'">ноября</xsl:when>
											<xsl:when test="$month = '12'">декабря</xsl:when>
										</xsl:choose>
									</td>
									<td class="graphMain"/>
									<td class="graphMain" width="3%">
										<xsl:text>20</xsl:text>
									</td>
									<td class="border-bottom">
										<xsl:value-of select="substring(rd:CalculateDate, 3, 2)"/>
									</td>
									<td class="graphMain"/>
									<td class="graphMain">
										<xsl:text>г.</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="graphLittle">
										<xsl:text>(указывается наименование таможенного органа)</xsl:text>
									</td>
									<td colspan="11" class="graphMain"/>
								</tr>
							</table>
							<br/>
							<table border="1" style="table-layout:fixed;word-wrap:break-word;width:297mm;">
								<tr>
									<th width="5%">№ п/п (№ товара ДТ)</th>
									<th width="7%">Идентифи-кационный номер (VIN) или номер машины (рамы)</th>
									<th width="7%">Марка</th>
									<th width="7%">Модель</th>
									<th width="7%">Дата выпуска <sup>1</sup></th>
									<th width="7%">Категория (вид) транспортного средства<sup>2</sup></th>
									<th width="7%">Рабочий объем двигателя (куб. см)</th>
									<th width="7%">Модель, номер двигателя</th>
									<th width="7%">Тип двигателя</th>
									<th width="7%">Технически допустимая макси-мальная масса (тонн)</th>
									<th width="7%">Базовая ставка</th>
									<th width="4%">Коэффициент</th>
									<th width="7%">Сумма утилизационного сбора, уплаченного в отношении базового колесного транспортного средства (шасси) и (или) прицепа к нему (при наличии)</th>
									<th width="7%">Сумма утилизационного сбора, подлежащая уплате</th>
									<th width="7%">Номер бланка паспорта транспортного средства (паспорта шасси транспортного средства) или уникальный номер электронного паспорта транспортного средства (электронного паспорта шасси транспортного средства)</th>
								</tr>
								<tr>
									<td align="center">1</td>
									<td align="center">2</td>
									<td align="center">3</td>
									<td align="center">4</td>
									<td align="center">5</td>
									<td align="center">6</td>
									<td align="center">7</td>
									<td align="center">8</td>
									<td align="center">9</td>
									<td align="center">10</td>
									<td align="center">11</td>
									<td align="center">12</td>
									<td align="center">13</td>
									<td align="center">14</td>
									<td align="center">15</td>
								</tr>
								<xsl:for-each select="rd:UtilCollDetails[rd:Sign = 'К' or rd:Sign = 'K']">
									<tr>
										<td align="center">
											<xsl:apply-templates select="rd:GoodsRecNumber"/>
											<xsl:if test="rd:GoodsDTNumber">
												<xsl:text> (</xsl:text>
												<xsl:apply-templates select="rd:GoodsDTNumber"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
										<td align="center"><xsl:apply-templates select="rd:VINID"/></td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:Mark"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:Model"/>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth">
													<xsl:apply-templates select="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/ManufactureYear">
													<xsl:if test="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:apply-templates select="rd:Vehicle/rd:VehicleProdDate/ManufactureYear"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Chassis/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:ManufactureMonth">
													<xsl:apply-templates select="rd:Chassis/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/ManufactureYear">
													<xsl:if test="rd:Chassis/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:apply-templates select="rd:Chassis/ManufactureYear"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Trailer/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:ManufactureMonth">
													<xsl:apply-templates select="rd:Trailer/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/ManufactureYear">
													<xsl:if test="rd:Trailer/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:apply-templates select="rd:Trailer/ManufactureYear"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:TransportCategoryCode">
													<xsl:value-of select="rd:Vehicle/rd:TransportCategoryCode"/>
												</xsl:when>
												<xsl:when test="rd:Chassis">
													<xsl:value-of select="'Шасси транспортного средства'"/>
												</xsl:when>
												<xsl:when test="rd:Trailer">
													<xsl:value-of select="'Прицеп'"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:EngineVolumeQuanity">
													<xsl:apply-templates select="rd:Vehicle/rd:EngineVolumeQuanity"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:Engine/rd:EngineModel"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="rd:Vehicle/rd:EngineId"/>
										</td>
										<td align="center">
											<xsl:for-each select="rd:Vehicle/rd:Engine[rd:EngineModeCode]">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:choose>
													<xsl:when test="rd:EngineModeCode = 1">бензиновый</xsl:when>
													<xsl:when test="rd:EngineModeCode = 2">дизельный</xsl:when>
													<xsl:when test="rd:EngineModeCode = 3">электрический</xsl:when>
													<xsl:when test="rd:EngineModeCode = 4">гибридный на основе бензинового</xsl:when>
													<xsl:when test="rd:EngineModeCode = 5">гибридный на основе дизельного</xsl:when>
													<xsl:when test="rd:EngineModeCode = 6">конв. для работы на газе</xsl:when>
													<xsl:when test="rd:EngineModeCode = 7">иной</xsl:when>
													<xsl:otherwise>
														<xsl:apply-templates select="rd:EngineModeCode"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:TotalWeight">
													<xsl:apply-templates select="rd:Vehicle/rd:TotalWeight"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:TotalWeight">
													<xsl:apply-templates select="rd:Chassis/rd:TotalWeight"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:TotalWeight">
													<xsl:apply-templates select="rd:Trailer/rd:TotalWeight"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:value-of select="rd:DutyTaxFeeRateValue"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:Coefficient"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:PreviousUtilAmount" mode="transl"/>
										</td>
										<td align="right">
											<xsl:apply-templates select="rd:UtilAmount" mode="transl"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:VehicleEPassportId"/>
											<xsl:if test="not(rd:VehicleEPassportId) and rd:VehiclePassportNumber">
												<xsl:apply-templates select="rd:VehiclePassportNumber"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td colspan="13" align="right">
										<xsl:text>Общий размер утилизационного сбора, подлежащий уплате: </xsl:text>
									</td>
									<td align="right">
										<!--xsl:value-of select="sum(rd:UtilCollDetails/rd:UtilAmount)"/-->
										<xsl:apply-templates select="rd:TotalUtilAmount" mode="transl"/>
									</td>
									<td align="center"></td>
								</tr>
							</table>
							<br/>
							<xsl:choose>
								<xsl:when test="rd:Payer[rd:FactPayerIndicator='1' or translate(substring(rd:FactPayerIndicator, 1, 1),'t', 'T') = 'T']">
									<xsl:for-each select="rd:Payer[rd:FactPayerIndicator='1' or translate(substring(rd:FactPayerIndicator, 1, 1),'t', 'T') = 'T']">
										<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:call-template name="Payer">
												<xsl:with-param name="payer" select="."/>
												<xsl:with-param name="sign" select="'С'"/>
											</xsl:call-template>
										</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="Payer">
										<xsl:with-param name="payer" select="rd:Payer[1]"/>
										<xsl:with-param name="sign" select="'С'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<br/>
							<br/>
							<table>
								<tr valign="bottom" align="center">
									<td width="40%" class="border-bottom">
										<xsl:apply-templates select="rd:ApproverPerson" mode="FIO"/>
									</td>
									<td width="10%" class="graphMain"/>
									<td width="27%" class="border-bottom"/>
									<td width="2%" class="graphMain"/>
									<td width="20%" class="border-bottom">
										<xsl:apply-templates select="rd:ApproverPerson/cat_ru:IssueDate" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td class="graphLittle">
										<xsl:text>(Ф.И.О. руководителя (полномочного представителя) организации или физического лица)</xsl:text>
									</td>
									<td/>
									<td class="graphLittle">
										<xsl:text>(подпись)</xsl:text>
									</td>
									<td/>
									<td class="graphLittle">
										<xsl:text>(дата)</xsl:text>
									</td>
								</tr>
							</table>
							<br/>
							<br/>
							<table>
								<tr>
									<td><xsl:text>М.П. (при наличии)</xsl:text></td>
								</tr>
							</table>
							<br/>
							<br/>
							<table>
								<tr>
									<td width="3%" class="border-bottom"/>
									<td width="27%" class="border-bottom"/>
									<td width="70%"/>
								</tr>
								<tr>
									<td align="right"><sup>1</sup></td>
									<td colspan="2" width="97%"><xsl:text>При отсутствии документального подтверждения даты выпуска колесного транспортного средства (шасси) или прицепа к нему, имеющего идентификационный номер (VIN), которой является дата изготовления колесного транспортного средства (шасси) или прицепа к нему, год выпуска определяется по коду изготовления, указанному в идентификационном номере колесного транспортного средства (шасси) или прицепа к нему, при этом 3-летний срок исчисляется начиная с 1 июля года изготовления.</xsl:text></td>
								</tr>
								<tr>
									<td align="right"><sup>2</sup></td>
									<td colspan="2" width="97%"><xsl:text>Категории колесных транспортных средств (шасси) и прицепов к ним указываются в соответствии с перечнем видов и категорий колесных транспортных средств (шасси) и прицепов к ним, в отношении которых уплачивается утилизационный сбор, а также размеров утилизационного сбора, утвержденным постановлением Правительства Российской Федерации от 26 декабря 2013 г. № 1291 "Об утилизационном сборе в отношении колесных транспортных средств и шасси и о внесении изменений в некоторые акты Правительства Российской Федерации".</xsl:text></td>
								</tr>
							</table>
					</div>
				</xsl:if>

<!-- ************************************************************************************************************************************************************************************************************** -->						
<!-- *** реализация для (Форма расчета УС по ПП 81_С) *********************************************************************************************************************************************** -->						
<!-- ************************************************************************************************************************************************************************************************************** -->							
				<xsl:if test="rd:UtilCollDetails[rd:Sign = 'С' or rd:Sign = 'C']"> <!-- реализация для (Форма расчета УС по ПП 81_С) -->
					<div class="pageAlbum">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b><xsl:text>Р А С Ч Е Т</xsl:text></b><br/>
												<b><xsl:text>суммы утилизационного сбора в отношении самоходных машин и (или) прицепов к ним, уплачиваемого лицами, указанными в абзаце втором пункта 3 статьи 24.1 Федерального закона "Об отходах производства и потребления"</xsl:text></b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tr>
									<td class="graphMain" width="2%"></td>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="42%"/>
									<td class="graphMain" width="32%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="3%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="9%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="3%"/>
									<td class="graphMain" width="5%"/>
									<td class="graphMain" width="2%"/>
									<td class="graphMain" width="3%"/>
								</tr>
								<tr valign="bottom" align="center">
									<td class="graphMain">
										<xsl:text>В</xsl:text>
									</td>
									<td colspan="2" class="border-bottom" valign="bottom">
										<xsl:apply-templates select="rd:Customs/cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rd:Customs/cat_ru:OfficeName"/>
									</td>
									<td class="graphMain"/>
									<td class="graphMain" align="center">
										<xsl:text>"</xsl:text>
									</td>
									<td class="border-bottom">
										<xsl:value-of select="substring(rd:CalculateDate, 9, 2)"/>
									</td>
									<td class="graphMain" align="center">
										<xsl:text>"</xsl:text>
									</td>
									<td class="graphMain"/>
									<td class="border-bottom">
										<xsl:variable name="month" select="substring(rd:CalculateDate, 6, 2)"/>
										<xsl:choose>
											<xsl:when test="$month = '01'">января</xsl:when>
											<xsl:when test="$month = '02'">февраля</xsl:when>
											<xsl:when test="$month = '03'">марта</xsl:when>
											<xsl:when test="$month = '04'">апреля</xsl:when>
											<xsl:when test="$month = '05'">мая</xsl:when>
											<xsl:when test="$month = '06'">июня</xsl:when>
											<xsl:when test="$month = '07'">июля</xsl:when>
											<xsl:when test="$month = '08'">августа</xsl:when>
											<xsl:when test="$month = '09'">сентября</xsl:when>
											<xsl:when test="$month = '10'">октября</xsl:when>
											<xsl:when test="$month = '11'">ноября</xsl:when>
											<xsl:when test="$month = '12'">декабря</xsl:when>
										</xsl:choose>
									</td>
									<td class="graphMain"/>
									<td class="graphMain" width="3%">
										<xsl:text>20</xsl:text>
									</td>
									<td class="border-bottom">
										<xsl:value-of select="substring(rd:CalculateDate, 3, 2)"/>
									</td>
									<td class="graphMain"/>
									<td class="graphMain">
										<xsl:text>г.</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="graphLittle">
										<xsl:text>(указывается наименование таможенного органа)</xsl:text>
									</td>
									<td colspan="11" class="graphMain"/>
								</tr>
							</table>
							<br/>
							<table border="1" style="table-layout:fixed;word-wrap:break-word;width:297mm;">
								<tr>
									<th width="5%">№ п/п (№ товара ДТ)</th>
									<th width="7%">Идентификационный номер или заводской номер</th>
									<th width="7%">Марка</th>
									<th width="7%">Модель</th>
									<th width="7%">Дата изготовления <sup>1</sup></th>
									<th width="%">Вид самоходной машины или прицепа<sup>2</sup></th>
									<th width="8%">Мощность силовой установки</th>
									<th width="8%">Модель, номер двигателя</th>
									<th width="8%">Тип двигателя</th>
									<th width="7%">Грузоподъемность (тонн)</th>
									<th width="8%">Базовая ставка</th>
									<th width="4%">Коэффициент</th>
									<th width="8%">Сумма утилизационного сбора, уплаченного в отношении базовой самоходной машины и (или) прицепа (при наличии)</th>
									<th width="8%">Сумма утилизацион-ного сбора, подлежащая уплате</th>
								</tr>
								<tr>
									<td align="center">1</td>
									<td align="center">2</td>
									<td align="center">3</td>
									<td align="center">4</td>
									<td align="center">5</td>
									<td align="center">6</td>
									<td align="center">7</td>
									<td align="center">8</td>
									<td align="center">9</td>
									<td align="center">10</td>
									<td align="center">11</td>
									<td align="center">12</td>
									<td align="center">13</td>
									<td align="center">14</td>
								</tr>
								<xsl:for-each select="rd:UtilCollDetails[rd:Sign = 'С' or rd:Sign = 'C']">
									<tr>
										<td align="center">
											<xsl:apply-templates select="rd:GoodsRecNumber"/>
											<xsl:if test="rd:GoodsDTNumber">
												<xsl:text> (</xsl:text>
												<xsl:apply-templates select="rd:GoodsDTNumber"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
										<td align="center"><xsl:value-of select="rd:VINID"/></td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:Mark"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:Model"/>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth">
													<xsl:value-of select="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/ManufactureYear">
													<xsl:if test="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:value-of select="rd:Vehicle/rd:VehicleProdDate/ManufactureYear"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Chassis/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:ManufactureMonth">
													<xsl:value-of select="rd:Chassis/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/ManufactureYear">
													<xsl:if test="rd:Chassis/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:value-of select="rd:Chassis/ManufactureYear"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Trailer/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:ManufactureMonth">
													<xsl:value-of select="rd:Trailer/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/ManufactureYear">
													<xsl:if test="rd:Trailer/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:value-of select="rd:Trailer/ManufactureYear"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:TransportCategoryCode">
													<xsl:value-of select="rd:Vehicle/rd:TransportCategoryCode"/>
												</xsl:when>
												<xsl:when test="rd:Chassis">
													<xsl:value-of select="'Шасси транспортного средства'"/>
												</xsl:when>
												<xsl:when test="rd:Trailer">
													<xsl:value-of select="'Прицеп'"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:EnginePowerQuanityType">
													<xsl:value-of select="rd:Vehicle/rd:EnginePowerQuanityType"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:EngineModel"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="rd:Vehicle/rd:EngineId"/>
										</td>
										<td align="center">
											<xsl:for-each select="rd:Vehicle/rd:Engine[rd:EngineModeCode]">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:choose>
													<xsl:when test="rd:EngineModeCode = 1">бензиновый</xsl:when>
													<xsl:when test="rd:EngineModeCode = 2">дизельный</xsl:when>
													<xsl:when test="rd:EngineModeCode = 3">электрический</xsl:when>
													<xsl:when test="rd:EngineModeCode = 4">гибридный на основе бензинового</xsl:when>
													<xsl:when test="rd:EngineModeCode = 5">гибридный на основе дизельного</xsl:when>
													<xsl:when test="rd:EngineModeCode = 6">конв. для работы на газе</xsl:when>
													<xsl:when test="rd:EngineModeCode = 7">иной</xsl:when>
													<xsl:otherwise>
														<xsl:apply-templates select="rd:EngineModeCode"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:TotalWeight">
													<xsl:value-of select="rd:Vehicle/rd:TotalWeight"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:TotalWeight">
													<xsl:value-of select="rd:Chassis/rd:TotalWeight"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:TotalWeight">
													<xsl:value-of select="rd:Trailer/rd:TotalWeight"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:value-of select="rd:DutyTaxFeeRateValue"/>
										</td>
										<td align="center">
											<xsl:value-of select="rd:Coefficient"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:PreviousUtilAmount" mode="transl"/>
										</td>
										<td align="right">
											<xsl:value-of select="rd:UtilAmount"/>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td colspan="13" align="right">
										<xsl:text>Общий размер утилизационного сбора, подлежащий уплате: </xsl:text>
									</td>
									<td align="right">
										<xsl:value-of select="sum(rd:UtilCollDetails/rd:UtilAmount)"/>
									</td>
								</tr>
							</table>
							<br/>
							<xsl:choose>
								<xsl:when test="rd:Payer[rd:FactPayerIndicator='1' or translate(substring(rd:FactPayerIndicator, 1, 1),'t', 'T') = 'T']">
									<xsl:for-each select="rd:Payer[rd:FactPayerIndicator='1' or translate(substring(rd:FactPayerIndicator, 1, 1),'t', 'T') = 'T']">
										<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:call-template name="Payer">
												<xsl:with-param name="payer" select="."/>
												<xsl:with-param name="sign" select="'К'"/>
											</xsl:call-template>
										</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="Payer">
										<xsl:with-param name="payer" select="rd:Payer[1]"/>
										<xsl:with-param name="sign" select="'К'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose><br/>
							<br/>
							<table>
								<tr valign="bottom" align="center">
									<td width="40%" class="border-bottom">
										<xsl:apply-templates select="rd:ApproverPerson" mode="FIO"/>
									</td>
									<td width="10%" class="graphMain"/>
									<td width="27%" class="border-bottom"/>
									<td width="2%" class="graphMain"/>
									<td width="20%" class="border-bottom">
										<xsl:apply-templates select="rd:ApproverPerson/cat_ru:IssueDate" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td class="graphLittle">
										<xsl:text>(Ф.И.О. руководителя (полномочного представителя) организации или физического лица)</xsl:text>
									</td>
									<td/>
									<td class="graphLittle">
										<xsl:text>(подпись)</xsl:text>
									</td>
									<td/>
									<td class="graphLittle">
										<xsl:text>(дата)</xsl:text>
									</td>
								</tr>
							</table>
							<br/>
							<br/>
							<table>
								<tr>
									<td><xsl:text>М.П. (при наличии)</xsl:text></td>
								</tr>
							</table>
							<br/>
							<br/>
							<table>
								<tr>
									<td width="3%" class="border-bottom"/>
									<td width="27%" class="border-bottom"/>
									<td width="70%"/>
								</tr>
								<tr>
									<td align="right"><sup>1</sup></td>
									<td colspan="2" width="97%"><xsl:text>Дата изготовления самоходных машин определяется в соответствии с порядком определения момента выпуска и объема двигателя авто-, мототранспортного средства, установленным в приложении 6 к Соглашению о порядке перемещения физическими лицами товаров для личного пользования через таможенную границу Таможенного союза и совершения таможенных операций, связанных с их выпуском, от 18 июня 2010 г.</xsl:text></td>
								</tr>
								<tr>
									<td align="right"><sup>2</sup></td>
									<td colspan="2" width="97%"><xsl:text>Вид самоходной машины или прицепа указывается в соответствии с перечнем видов и категорий самоходных машин и прицепов к ним, в отношении которых уплачивается утилизационный сбор, а также размеров утилизационного сбора, утвержденным постановлением Правительства Российской Федерации от 6 февраля 2016 г. N 81 "Об утилизационном сборе в отношении самоходных машин и (или) прицепов к ним и о внесении изменений в некоторые акты Правительства Российской Федерации".</xsl:text></td>
								</tr>
							</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="Payer">
		<xsl:param name="payer"/>
		<xsl:param name="sign"/>
		<table>
			<tr>
				<td colspan="2"><xsl:text>Полное наименование плательщика (Ф.И.О. физического лица):</xsl:text></td>
			</tr>
			<tr>
				<td colspan="2" class="border-bottom">
					<xsl:if test="$payer/rd:PayerName">
						<xsl:apply-templates select="$payer/rd:PayerName"/>
						<xsl:if test="$payer/rd:PayerName and $payer/cat_ru:ShortName">
							<xsl:text> (</xsl:text>
						</xsl:if>
						<xsl:apply-templates select="$payer/cat_ru:ShortName"/>
						<xsl:if test="$payer/rd:PayerName and $payer/cat_ru:ShortName">
							<xsl:text> )</xsl:text>
						</xsl:if>
					</xsl:if>
					<xsl:if test="$payer/rd:Person">
						<xsl:apply-templates select="$payer/rd:PayerName/rd:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="$payer/rd:PayerName/rd:PersonName"/>
						<xsl:if test="$payer/rd:Person/rd:PersonMiddleName">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="$payer/rd:PayerName/rd:PersonMiddleName"/>
						</xsl:if>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td width="30%"><xsl:text>ИНН/КПП (при наличии):</xsl:text></td>
				<td width="70%" class="border-bottom">
					<xsl:apply-templates select="$payer/rd:RFOrganizationFeatures/cat_ru:INN"/>
					<xsl:if test="$payer/rd:RFOrganizationFeatures/cat_ru:INN">
						<xsl:text> / </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="$payer/rd:RFOrganizationFeatures/cat_ru:KPP"/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><xsl:text>ОГРН, дата регистрации (паспортные данные физического лица):</xsl:text></td>
			</tr>
			<tr>
				<td colspan="2" class="border-bottom">
					<xsl:apply-templates select="$payer/rd:RFOrganizationFeatures/cat_ru:OGRN"/>
					<xsl:if test="$payer/rd:RFOrganizationFeatures/cat_ru:OGRN and $payer/rd:IdentityDoc">
						<xsl:text>, паспорт: </xsl:text>
					</xsl:if>
					<xsl:apply-templates mode="IdentityCard" select="$payer/rd:IdentityDoc"/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><xsl:text>Место государственной регистрации (место жительства (адрес) физического лица):</xsl:text></td>
			</tr>
			<tr>
				<td colspan="2" class="border-bottom">
					<xsl:choose>
						<xsl:when test="$payer/rd:TPOAddress">
							<xsl:apply-templates mode="ru_address" select="$payer/rd:TPOAddress"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>отсутствует</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2"><xsl:text>Номер декларации на товары (таможенного приходного ордера) при таможенном</xsl:text></td>
			</tr>
			<tr>
				<td><xsl:text>декларировании (при наличии):</xsl:text></td>
				<td class="border-bottom">
					<!--xsl:apply-templates mode="TPORegNum" select="rd:TPORegNumber"/-->
					<xsl:for-each select="$payer/../rd:UtilCollDetails[rd:Sign=$sign][generate-id() = generate-id(key('typeKC', rd:TPORegNumber)[1])]">
						<xsl:if test="position()!=1">, </xsl:if>
						<xsl:apply-templates select="rd:TPORegNumber" mode="TPORegNum"/>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="FIO">
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonName']"/>
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']"/>
	</xsl:template>
	
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
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:apply-templates select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:apply-templates select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rd:VehicleDetailsType -->
	<xsl:template match="rd:Chassis">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="rd:ManufactureDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата производства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureYear">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Год выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureYear"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureMonth">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Месяц выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureMonth"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:TotalWeight">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полная масса (т) / Грузоподъемность (т)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:TotalWeight" mode="transl"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template mode="CommunicationDetails" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='Phone'">
					<xsl:text>тел: </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='Fax'">
					<xsl:text>факс: </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='Telex'">
					<xsl:text>телекс: </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='E_mail'">
					<xsl:text>e-mail: </xsl:text>
				</xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--rd:TPORegNumberType-->
	<xsl:template match="*" mode="TPORegNum">
		<xsl:apply-templates select="rd:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="rd:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="rd:DocNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="*" mode="GTDID">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template mode="IdentityCard" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:variable name="xpath_AddressKindCode">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="RUScat_ru:AddressKindCode"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_AddressKindCode}">
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						</xsl:choose>
					</element>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
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
							<xsl:variable name="xpath_AddressKindCode1">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_AddressKindCode1}">
								<xsl:choose>
									<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
									<xsl:when test=".='2'">Фактический адрес: </xsl:when>
									<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								</xsl:choose>
							</element>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа rd:TPORegNumberType -->
	<xsl:template match="rd:TPORegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="rd:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="rd:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа по журналу регистрации/типографский номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="rd:DocNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rd:VehicleDetailsType -->
	<xsl:template match="rd:Trailer">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="rd:ManufactureDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата производства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureYear">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Год выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureYear"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureMonth">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Месяц выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureMonth"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:TotalWeight">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полная масса (т) / Грузоподъемность (т)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:TotalWeight" mode="transl"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rd:UtilCollDetailsType -->
	<xsl:template match="rd:UtilCollDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="position() != 1">
				<br/>
				<br/>
			</xsl:if>
			<xsl:if test="rd:VehicleEPassportId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер электронного паспорта транспортного средства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:VehicleEPassportId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:Vehicle">
				<div class="title marg-top">Транспортное средство</div>
				<div>
					<xsl:apply-templates select="rd:Vehicle">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="rd:Chassis">
				<div class="title marg-top">Шасси транспортного средства</div>
				<div>
					<xsl:apply-templates select="rd:Chassis">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="rd:Trailer">
				<div class="title marg-top">Прицепы </div>
				<div>
					<xsl:apply-templates select="rd:Trailer">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="rd:VINID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер (VIN)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:VINID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:Lifetime">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Срок эксплуатации для утилизационных сборов (лет) </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:Lifetime"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:GoodsDTNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер товара в ДТ </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:GoodsDTNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:GoodsTNVEDCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код товара по ТН ВЭД ЕАЭС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:GoodsTNVEDCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:Chassis2017Indicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ТС произведено на базе шасси ТС 2017 года выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:variable name="xpath_Chassis2017Indicator">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="rd:Chassis2017Indicator"/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_Chassis2017Indicator}">
								<xsl:choose>
									<xsl:when test="rd:Chassis2017Indicator='true' or rd:Chassis2017Indicator='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="rd:Chassis2017Indicator='false' or rd:Chassis2017Indicator='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:Chassis2017Indicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</element>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManualInputCoefficient">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Ручной ввод коэффициента</td>
						<td class="value graphMain" style="width:50%">
							<xsl:variable name="xpath_ManualInputCoefficient">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="rd:ManualInputCoefficient"/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_ManualInputCoefficient}">
								<xsl:choose>
									<xsl:when test="rd:ManualInputCoefficient='true' or rd:ManualInputCoefficient='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="rd:ManualInputCoefficient='false' or rd:ManualInputCoefficient='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:ManualInputCoefficient"/>
									</xsl:otherwise>
								</xsl:choose>
							</element>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:Coefficient">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Коэффициент для расчета утилизационного сбора</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:Coefficient" mode="transl"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:DutyTaxFeeRateValue">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Ставка платежа, используемая при расчете (руб)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:DutyTaxFeeRateValue" mode="transl"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:UtilAmount">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сумма утилизационного сбора, подлежащая уплате (руб)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:UtilAmount" mode="transl"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:PayDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Крайний срок уплаты</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:PayDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rd:VehicleType -->
	<xsl:template match="rd:Vehicle">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="rd:TransportCategoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код категории транспортного средства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:TransportCategoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:PersonalUseIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак автомобиля для личных целей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:variable name="xpath_PersonalUseIndicator">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="rd:PersonalUseIndicator"/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_PersonalUseIndicator}">
								<xsl:choose>
									<xsl:when test="rd:PersonalUseIndicator='true' or rd:PersonalUseIndicator='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="rd:PersonalUseIndicator='false' or rd:PersonalUseIndicator='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:PersonalUseIndicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</element>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:EngineTypeIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак электрического двигателя </td>
						<td class="value graphMain" style="width:50%">
							<xsl:variable name="xpath_EngineTypeIndicator">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="rd:EngineTypeIndicator"/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_EngineTypeIndicator}">
								<xsl:choose>
									<xsl:when test="rd:EngineTypeIndicator='true' or rd:EngineTypeIndicator='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="rd:EngineTypeIndicator='false' or rd:EngineTypeIndicator='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:EngineTypeIndicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</element>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:TempImpIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак временного ввоза грузового ТС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:variable name="xpath_TempImpIndicator">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="rd:TempImpIndicator"/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_TempImpIndicator}">
								<xsl:choose>
									<xsl:when test="rd:TempImpIndicator='true' or rd:TempImpIndicator='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="rd:TempImpIndicator='false' or rd:TempImpIndicator='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:TempImpIndicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</element>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:STrIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак ТС - седельный тягач</td>
						<td class="value graphMain" style="width:50%">
							<xsl:variable name="xpath_STrIndicator">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="rd:STrIndicator"/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_STrIndicator}">
								<xsl:choose>
									<xsl:when test="rd:STrIndicator='true' or rd:STrIndicator='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="rd:STrIndicator='false' or rd:STrIndicator='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:STrIndicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</element>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:SpecTransportIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак специализированного ТС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:variable name="xpath_SpecTransportIndicator">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="rd:SpecTransportIndicator"/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_SpecTransportIndicator}">
								<xsl:choose>
									<xsl:when test="rd:SpecTransportIndicator='true' or rd:SpecTransportIndicator='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="rd:SpecTransportIndicator='false' or rd:SpecTransportIndicator='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:SpecTransportIndicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</element>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:SpecTrfnsportIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак ТС - автобетоносмеситель</td>
						<td class="value graphMain" style="width:50%">
							<xsl:variable name="xpath_SpecTrfnsportIndicator">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="rd:SpecTrfnsportIndicator"/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_SpecTrfnsportIndicator}">
								<xsl:choose>
									<xsl:when test="rd:SpecTrfnsportIndicator='true' or rd:SpecTrfnsportIndicator='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="rd:SpecTrfnsportIndicator='false' or rd:SpecTrfnsportIndicator='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:SpecTrfnsportIndicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</element>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:EngineVolumeQuanity">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Объем двигателя, куб. см</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:EngineVolumeQuanity" mode="transl"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:EnginePower">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Мощность двигателя в лошадиных силах</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:EnginePower" mode="transl"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:TotalWeight">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полная масса (т)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:TotalWeight" mode="transl"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:VehicleProdDate">
				<div class="title marg-top">Дата производства транспортного средства (шасси транспортного средства)</div>
				<div>
					<xsl:apply-templates select="rd:VehicleProdDate">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rd:VehicleProdDateType -->
	<xsl:template match="rd:VehicleProdDate">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="rd:ManufactureDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата производства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureYear">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Год выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureYear"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureMonth">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Месяц выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rd:ManufactureMonth"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template name="gtd_date">
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
