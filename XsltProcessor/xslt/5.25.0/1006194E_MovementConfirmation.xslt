<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:mvcf="urn:customs.ru:Information:CustomsDocuments:MovementConfirmation:5.25.0">
	<!-- Шаблон для типа MovementConfirmationType -->
	<xsl:template match="mvcf:MovementConfirmation">
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
										<b>
											<xsl:text>Уведомление </xsl:text>
											<xsl:choose>
												<xsl:when test="mvcf:DocSign='0'">
													<xsl:text>о ввозе</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='1'">
													<xsl:text>об убытии товаров</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='2'">
													<xsl:text>уведомление о завершении действия пропуска</xsl:text>
												</xsl:when>
												<!--xsl:when test="mvcf:DocSign='3'">
													<xsl:text>уведомление о прибытии МПО в ММПО</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='4'">
													<xsl:text>о прибытии в   автоматизированный КПП</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='5'">
													<xsl:text>об убытии из автоматизированного КПП</xsl:text>
												</xsl:when-->
												<xsl:otherwise>
													<xsl:value-of select="mvcf:DocSign"/>
												</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="mvcf:Customs">
						<div class="title marg-top">Код и наименование таможенного органа</div>
						<div>
							<xsl:apply-templates select="mvcf:Customs">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата фактического ввоза/вывоза товаров (дата завершения действия пропуска)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="mvcf:MovementDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mvcf:RegistrationNumber">
						<div class="title marg-top">Регистрационный номер уведомления о ввозе/вывозе</div>
						<div>
							<xsl:apply-templates select="mvcf:RegistrationNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mvcf:DocumentNumber">
						<div class="title marg-top">Номер транспортного (перевозочного) или коммерческого документа (при ввозе)</div>
						<div>
							<xsl:apply-templates select="mvcf:DocumentNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mvcf:ImExRegistrationNumber">
						<div class="title marg-top">Регистрационный номер разрешения на ввоз/вывоз</div>
						<div>
							<xsl:apply-templates select="mvcf:ImExRegistrationNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mvcf:MPO_Number">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:MPO_Number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:PTDNum">
						<div class="title marg-top">Номер предварительной таможенной декларации</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Код таможенного органа, зарегистрировавшего документ</td>
									<td class="graphMain bordered">Дата регистрации документа</td>
									<td class="graphMain bordered">Порядковый номер документа по журналу регистрации</td>
								</tr>
								<xsl:for-each select="mvcf:PTDNum">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:TransportWeight">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Вес транспортного средства по результатам взвешивания на КПП, кг</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:TransportWeight" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:TransportIdentifier">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер транспортного средства</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:TransportIdentifier"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:Comments">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Примечание</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:Comments"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:PersonSignature">
						<div class="title marg-top">Подпись уполномоченного представителя Заявителя </div>
						<div>
							<xsl:apply-templates select="mvcf:PersonSignature">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="mvcf:Customs">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="mvcf:DocumentNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mvcf:ImExRegistrationNumberType -->
	<xsl:template match="mvcf:ImExRegistrationNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:Number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="mvcf:AddNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">4-ая часть номера</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mvcf:AddNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="mvcf:PTDNum">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="mvcf:PersonSignature">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonSurname">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Фамилия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonSurname"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Имя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
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
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mvcf:RegistrationNumberType -->
	<xsl:template match="mvcf:RegistrationNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="mvcf:AddNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Первая часть регистрационного номера документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mvcf:AddNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mvcf:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mvcf:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:Number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="mvcf:DocKind">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Четвертая часть регистрационного номера документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mvcf:DocKind"/>
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
	<xsl:template match="//*[local-name()='MovementConfirmation']//*" priority="-1">
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
