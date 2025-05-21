<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.15.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.15.0" xmlns:rd="urn:customs.ru:Information:CommercialFinanceDocuments:RecyclingDetails:5.15.0">
	<!-- Шаблон для типа RecyclingDetailsType -->
	<xsl:template match="rd:RecyclingDetails">
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
										<b>Сведения для уплаты утилизационного сбора</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!-- <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if>-->
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="rd:DocType='0'">
										<xsl:text>расчет уплаты УС</xsl:text>
									</xsl:when>
									<xsl:when test="rd:DocType='1'">
										<xsl:text>документ уплаты УС</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:DocType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="rd:TPORegNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Справочный номер ТПО на уплату таможенных платежей</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates mode="TPORegNum" select="rd:TPORegNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rd:CustomsDeclarationIdDetails">
						<table>
							<tbody width="100%">
								<tr>
									<td class="annot graphMain" style="width:50%">Регистрационный номер ДТ на ТС</td>
									<td class="value graphMain" style="width:50%">
										<xsl:apply-templates mode="GTDID" select="rd:CustomsDeclarationIdDetails"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rd:VehicleEPassportId">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер электронного паспорта транспортного средства</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rd:VehicleEPassportId"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rd:Payer">
						<table width="100%">
							<tbody>
								<xsl:for-each select="rd:Payer">
									<tr>
										<td colspan="2">
											<div class="title marg-top">Плательщик ТПО</div>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
										<td class="value graphMain" style="width:50%">
											<xsl:value-of select="cat_ru:OrganizationName"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
										<td class="value graphMain" style="width:50%">
											<xsl:value-of select="cat_ru:ShortName"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Сведения об организации</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
											<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
											<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
											<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
											<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
										<td class="value graphMain" style="width:50%">
											<xsl:value-of select="RUScat_ru:CountryA2Code"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
										<td class="value graphMain" style="width:50%">
											<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
												<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
													<xsl:with-param name="wdth" select="$w"/>
												</xsl:apply-templates>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
										<td class="value graphMain" style="width:50%">
											<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">УИТН</td>
										<td class="value graphMain" style="width:50%">
											<xsl:if test="RUScat_ru:UITN">
												<xsl:apply-templates select="RUScat_ru:UITN">
													<xsl:with-param name="wdth" select="$w"/>
												</xsl:apply-templates>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Признак физического лица</td>
										<td class="value graphMain" style="width:50%">
											<xsl:choose>
												<xsl:when test="rd:PersonIDIndicator='true' or rd:PersonIDIndicator='1'">
													<xsl:text>ДА</xsl:text>
												</xsl:when>
												<xsl:when test="rd:PersonIDIndicator='false' or rd:PersonIDIndicator='0'">
													<xsl:text>НЕТ</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="rd:PersonIDIndicator"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Признак фактического плательщика</td>
										<td class="value graphMain" style="width:50%">
											<xsl:choose>
												<xsl:when test="rd:FactPayerIndicator='true' or rd:FactPayerIndicator='1'">
													<xsl:text>ДА</xsl:text>
												</xsl:when>
												<xsl:when test="rd:FactPayerIndicator='false' or rd:FactPayerIndicator='0'">
													<xsl:text>НЕТ</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="rd:FactPayerIndicator"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Контакты</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates mode="CommunicationDetails" select="rd:CommunicationDetails"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Адрес</td>
										<td class="value graphMain" style="width:50%">
											<xsl:if test="rd:TPOAddress">
												<xsl:apply-templates mode="ru_address" select="rd:TPOAddress"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:50%">Удостоверение личности</td>
										<td class="value graphMain" style="width:50%">
											<xsl:if test="rd:IdentityDoc">
												<xsl:apply-templates mode="IdentityCard" select="rd:IdentityDoc"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Освобождение от уплаты</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="rd:NoPayIndicator='true' or rd:NoPayIndicator='1'">
										<xsl:text>освобождается от уплаты</xsl:text>
									</xsl:when>
									<xsl:when test="rd:NoPayIndicator='false' or rd:NoPayIndicator='0'">
										<xsl:text>нет оснований для освобождения от уплаты</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rd:NoPayIndicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="rd:NoPayReasons">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Основание для освобождения от уплаты</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rd:NoPayReasons"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rd:UtilCollDetails">
						<div class="title marg-top">Сведения для уплаты утилизационного сбора</div>
						<div>
							<xsl:apply-templates select="rd:UtilCollDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
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
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rd:ManufactureDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureYear">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Год выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:ManufactureYear"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureMonth">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Месяц выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:ManufactureMonth"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:TotalWeight">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полная масса (т) / Грузоподъемность (т)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(rd:TotalWeight, '.', ',')"/>
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
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--rd:TPORegNumberType-->
	<xsl:template match="*" mode="TPORegNum">
		<xsl:apply-templates select="rd:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="rd:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="rd:DocNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="*" mode="GTDID">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template mode="IdentityCard" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
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
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
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
	<!-- Шаблон для типа rd:TPORegNumberType -->
	<xsl:template match="rd:TPORegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rd:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="rd:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа по журналу регистрации/типографский номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rd:DocNumber"/>
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
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rd:ManufactureDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureYear">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Год выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:ManufactureYear"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureMonth">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Месяц выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:ManufactureMonth"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:TotalWeight">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полная масса (т) / Грузоподъемность (т)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(rd:TotalWeight, '.', ',')"/>
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
							<xsl:value-of select="rd:VINID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:Lifetime">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Срок эксплуатации для утилизационных сборов (лет) </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:Lifetime"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:GoodsNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер товара в ДТ </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:GoodsNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:GoodsTNVEDCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код товара по ТН ВЭД ЕАЭС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:GoodsTNVEDCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:Chassis2017Indicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ТС произведено на базе шасси ТС 2017 года выпуска</td>
						<td class="value graphMain" style="width:50%">
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
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManualInputCoefficient">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Ручной ввод коэффициента</td>
						<td class="value graphMain" style="width:50%">
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
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:Coefficient">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Коэффициент для расчета утилизационного сбора</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(rd:Coefficient, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:DutyTaxFeeRateValue">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Ставке платежа, используемая при расчете (руб)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(rd:DutyTaxFeeRateValue, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:PayDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Крайний срок уплаты</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rd:PayDate"/>
							</xsl:call-template>
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
						<td class="annot graphMain" style="width:50%">Код категории транспртного средства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:TransportCategoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:PersonalUseIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак автомобиля для личных целей</td>
						<td class="value graphMain" style="width:50%">
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
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:EngineTypeIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак электрического двигателя </td>
						<td class="value graphMain" style="width:50%">
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
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:TempImpIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак временного ввоза грузового ТС</td>
						<td class="value graphMain" style="width:50%">
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
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:STrIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак ТС - седельный тягач</td>
						<td class="value graphMain" style="width:50%">
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
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:SpecTransportIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак специализированного ТС</td>
						<td class="value graphMain" style="width:50%">
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
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:SpecTrfnsportIndicator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак ТС - автобетоносмеситель</td>
						<td class="value graphMain" style="width:50%">
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
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:EngineVolumeQuanity">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Объем двигателя, куб. см</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(rd:EngineVolumeQuanity, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:EnginePower">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Мощность двигателя в лошадиных силах</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(rd:EnginePower, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:TotalWeight">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полная масса (т)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(rd:TotalWeight, '.', ',')"/>
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
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rd:ManufactureDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureYear">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Год выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:ManufactureYear"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rd:ManufactureMonth">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Месяц выпуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rd:ManufactureMonth"/>
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
