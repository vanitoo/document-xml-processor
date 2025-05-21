<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.20.0" xmlns:ecmc="urn:customs.ru:Information:CustomsDocuments:E_CommerceMPOCustomMarkOut:5.20.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа E_CommerceMPOCustomMarkOutType -->
	<xsl:template match="ecmc:E_CommerceMPOCustomMarkOut">
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
										<b>Внешние отметки таможенного органа декларации товаров трансграничной (внешней) электронной торговли</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ecmc:EComMPORegistration">
						<div class="title marg-top">Регистрационный номер декларации товаров трансграничной (внешней) электронной торговли </div>
						<div>
							<xsl:apply-templates select="ecmc:EComMPORegistration">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ecmc:Resolution">
						<div class="title marg-top">Принятое решение по МПО</div>
						<div>
							<xsl:apply-templates select="ecmc:Resolution">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ecmc:CustomsMark">
						<div class="title marg-top">Служебные отметки</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Обозначение графы (подраздела графы) </td>
									<td class="graphMain bordered">Идентификатор проставленной технологической отметки - 1 (номер этапа)</td>
									<td class="graphMain bordered">Идентификатор проставленной технологической отметки  -  2 (тип примечания)</td>
									<td class="graphMain bordered">Код типа информации </td>
									<td class="graphMain bordered">Описание отметки</td>
									<td class="graphMain bordered">Служебная запись </td>
									<td class="graphMain bordered">Информация о документе</td>
									<td class="graphMain bordered">Код основания продления срока выпуска товаров</td>
									<td class="graphMain bordered">Код вида платежа </td>
									<td class="graphMain bordered">Сумма платежа</td>
									<td class="graphMain bordered">Код случая, когда обязанность по уплате таможенных пошлин, налогов прекращается </td>
									<td class="graphMain bordered">Срок</td>
									<td class="graphMain bordered">Должностное лицо таможенного органа, заверившее запись</td>
									<td class="graphMain bordered">Дата и время проставления отметки</td>
								</tr>
								<xsl:for-each select="ecmc:CustomsMark">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ecmc:CustomsMarkType -->
	<xsl:template match="ecmc:CustomsMark">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:GRNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:StageMarkIdentifier"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:NoteMarkIdentifier"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:InformationTypeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:StageDescription"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:MarkDescription"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ecmc:DocumentInfo">
						<xsl:apply-templates select="ecmc:DocumentInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:DeadlineReason"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:PaymentTypeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:PayAmount" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:TerminateObligations"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:Deadline" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ecmc:CustomsPerson">
						<xsl:apply-templates select="ecmc:CustomsPerson">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmc:DecisionDate"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:CustomsPersonDetails -->
	<xsl:template match="ecmc:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="ecmc:DocumentInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ecmc:EComMPORegistrationType -->
	<xsl:template match="ecmc:EComMPORegistration">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ecmc:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ecmc:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер по сквозной нумерации </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ecmc:Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ecmc:ResolutionType -->
	<xsl:template match="ecmc:Resolution">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Принятое решение:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ecmc:DecisionCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время принятия решения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ecmc:DecisionDate" mode="russian_date_time"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ecmc:ReasonCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код причины отказа в выпуске</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ecmc:ReasonCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ecmc:Reason">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание причины отказа в выпуске</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ecmc:Reason"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ecmc:CustomsPerson">
				<div class="title marg-top">Должностное лицо таможенного органа, заверившее запись</div>
				<div>
					<xsl:apply-templates select="ecmc:CustomsPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
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
	<xsl:template match="//*[local-name()='E_CommerceMPOCustomMarkOut']//*" priority="-1">
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
