<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.21.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.21.0" xmlns:ecmrc="urn:customs.ru:Information:CustomsDocuments:E_CommerceMPOReqCorrect:5.21.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа E_CommerceMPOReqCorrectType -->
	<xsl:template match="ecmrc:E_CommerceMPOReqCorrect">
		<xsl:param name="w" select="270"/>
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
										<b>Требование на внесение изменений в декларацию товаров трансграничной (внешней) электронной торговли, помещаемых под таможенную процедуру выпуска для внутреннего потребления</b>
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
					<xsl:if test="ecmrc:ApplicationRegNumber">
						<div class="title marg-top">Регистрационный номер декларации товаров трансграничной (внешней) электронной торговли, помещаемых под таможенную процедуру выпуска для внутреннего потребления</div>
						<div>
							<xsl:apply-templates select="ecmrc:ApplicationRegNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время принятого решения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ecmrc:DecisionDateTime"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ecmrc:LimitDateTime">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Предельный срок подачи изменений</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ecmrc:LimitDateTime"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ecmrc:IdentifiedViolations">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Выявленные нарушения</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="ecmrc:IdentifiedViolations">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный номер МПО, получателем которого является физическое лицо</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ecmrc:MPO_Number"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ecmrc:Reason">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Описание необходимости внесения изменений</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ecmrc:Reason"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ecmrc:ChangeDetails">
						<div class="title marg-top">Вносимые изменения</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Описание типа корректируемых сведений</td>
									<td class="graphMain bordered">Ранее указанные сведения</td>
									<td class="graphMain bordered">Измененные и (или) дополненные сведения</td>
									<td class="graphMain bordered">Изменение в товарах</td>
								</tr>
								<xsl:for-each select="ecmrc:ChangeDetails">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="ecmrc:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<div>
							<xsl:apply-templates select="ecmrc:CustomsPerson">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="ecmrc:Amount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
			<xsl:if test="position()!=1"><br/></xsl:if>
			<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
	</xsl:template>
	<!-- Шаблон для типа ecmrc:EComMPORegistrationType -->
	<xsl:template match="ecmrc:ApplicationRegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ecmrc:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ecmrc:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер по сквозной нумерации </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ecmrc:Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ecmrc:ChangeDetailsType -->
	<xsl:template match="ecmrc:ChangeDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecmrc:GRNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="ecmrc:PreviousData">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="ecmrc:CorrectData">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ecmrc:ChangeGoods">
						<xsl:apply-templates select="ecmrc:ChangeGoods">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ecmrc:ChangeGoodsType -->
	<xsl:template match="ecmrc:ChangeGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:if test="position()!=1"><br/><br/></xsl:if>
			<xsl:text>Номер товара:</xsl:text>
			<xsl:apply-templates select="ecmrc:GoodsNumeric"/>
			<br/>
			<xsl:text>Описание корректируемых сведений: </xsl:text>
			<xsl:apply-templates select="ecmrc:GRNumber"/>
			<xsl:if test="ecmrc:PreviousData">
				<br/>
				<xsl:text>Ранее указанные сведения: </xsl:text>
			</xsl:if>
			<xsl:for-each select="ecmrc:PreviousData">
				<xsl:if test="position()!=1">
					<br/>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:if test="ecmrc:CorrectData">
				<br/>
				<xsl:text>Измененные или дополненные сведения: </xsl:text>
			</xsl:if>
			<xsl:for-each select="ecmrc:CorrectData">
				<xsl:if test="position()!=1">
					<br/>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:if test="ecmrc:Amount">
				<br/>
				<xsl:text>Измененная стоимость:</xsl:text>
				<br/>
			</xsl:if>
			<xsl:if test="ecmrc:Amount">
				<xsl:apply-templates select="ecmrc:Amount">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:if>
					
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="ecmrc:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP"/>
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
	<xsl:template match="//*[local-name()='E_CommerceMPOReqCorrect']//*" priority="-1">
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
