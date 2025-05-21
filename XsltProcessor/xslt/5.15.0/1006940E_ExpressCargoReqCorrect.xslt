<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.15.0" xmlns:ecrc="urn:customs.ru:Information:CustomsDocuments:ExpressCargoReqCorrect:5.15.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExpressCargoReqCorrectType -->
	<xsl:template match="ecrc:ExpressCargoReqCorrect">
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



                  .bordered { border-collapse: collapse; font-family: Arial;}
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
										<b>Требование на внесение изменений в реестр экспресс-грузов</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="ecrc:ApplicationRegNumber">
						<xsl:apply-templates select="ecrc:ApplicationRegNumber">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время принятого решения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ecrc:DecisionDateTime"/></xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(ecrc:DecisionDateTime,12,8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ecrc:LimitDateTime">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Предельный срок подачи изменений</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ecrc:LimitDateTime"/></xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(ecrc:LimitDateTime,12,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ecrc:IdentifiedViolations">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Выявленные нарушения</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="ecrc:IdentifiedViolations">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ecrc:Consignment">
						<div class="title marg-top">Сведения по индивидуальным накладным</div>
						<!--table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Сведения об индивидуальной накладной</td>
									<td class="graphMain bordered">Описание необходимости внесения изменений</td>
									<td class="graphMain bordered">Вносимые изменения</td>
								</tr-->
								<xsl:for-each select="ecrc:Consignment">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							<!--/tbody>
						</table-->
					</xsl:if>
					<xsl:if test="ecrc:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<div>
							<xsl:apply-templates select="ecrc:CustomsPerson">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="ecrc:Amount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:if test="position() &gt; 1"><br/></xsl:if>
		<xsl:if test="RUScat_ru:Amount">
			<xsl:value-of select="translate(translate(format-number(RUScat_ru:Amount, '#,###.00'),',',' '),'.',',')"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:CurrencyCode"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ecrc:ApplicationRegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%"><div class="title marg-top">Регистрационный номер ДТЭГ/ ПТДЭГ</div></td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:call-template name="num_date">
							<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
						</xsl:call-template>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа ecrc:ChangeDetailsType -->
	<xsl:template match="ecrc:ChangeDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
					
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Описание типа корректируемых сведений</td>
							<td class="graphMain value" style="width:50%">
								<xsl:value-of select="ecrc:GRNumber"/>
							</td>
						</tr>
					</table>
					
					<xsl:if test="ecrc:PreviousData">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Ранее указанные сведения</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="ecrc:PreviousData">
										<xsl:if test="position()!=1">
											<br/>
										</xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					
					<xsl:if test="ecrc:CorrectData">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Измененные и (или) дополненные сведения</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="ecrc:CorrectData">
										<xsl:if test="position()!=1">
											<br/>
										</xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>

					<xsl:if test="ecrc:ChangeGoods">
						<div class="title marg-top">Изменение в товарах</div>
						<table>
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">
										<xsl:text>Номер товара</xsl:text>
									</td>
									<td class="graphMain bordered">
										<xsl:text>Описание корректируемых сведений</xsl:text>
									</td>
									<td class="graphMain bordered">
										<xsl:text>Ранее указанные сведения</xsl:text>
									</td>
									<td class="graphMain bordered">
										<xsl:text>Измененные и (или) дополненные сведения</xsl:text>
									</td>
									<td class="graphMain bordered">
										<xsl:text>Измененная стоимость товара</xsl:text>
									</td>
								</tr>
								<xsl:apply-templates select="ecrc:ChangeGoods">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</tbody>
						</table>
					</xsl:if>

		</div>
	</xsl:template>
	<!-- Шаблон для типа ecrc:ChangeGoodsType -->
	<xsl:template match="ecrc:ChangeGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="ecrc:GoodsNumeric"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="ecrc:GRNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="ecrc:PreviousData">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="ecrc:CorrectData">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ecrc:Amount">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа ecrc:ConsignmentType -->
	<xsl:template match="ecrc:Consignment">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top" style="background-color:#aaa;">Индивидуальная накладная</div>
			<xsl:apply-templates select="ecrc:IndividualWayBill">
				<xsl:with-param name="wdth" select="$w"/>
			</xsl:apply-templates>
			
			<xsl:if test="ecrc:Reason">
				<br/>
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание необходимости внесения изменений</td>
						<td class="graphMain value" style="width:50%">
							<xsl:value-of select="ecrc:Reason"/>
						</td>
					</tr>
				</table>
			</xsl:if>

			<xsl:if test="ecrc:ChangeDetails">
				<br/>
				<div class="title marg-top" style="background-color:#ссс;">Вносимые изменения</div>
				<xsl:apply-templates select="ecrc:ChangeDetails">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="ecrc:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ecrc:WayBillType -->
	<xsl:template match="ecrc:IndividualWayBill">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ID накладной в реестре</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ecrc:WayBillID"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый № накладной</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ecrc:ObjectOrdinal"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="num_date">
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
