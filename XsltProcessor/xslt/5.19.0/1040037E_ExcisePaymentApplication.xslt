<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.16.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:epa="urn:customs.ru:Information:ELSDocuments:ExcisePaymentApplication:5.18.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.17.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExcisePaymentApplicationType -->
	<xsl:include href="SumInWords.xslt"/>
	<xsl:template match="epa:ExcisePaymentApplication">
		<xsl:param name="w" select="277"/>
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
                  font-size: 9pt;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
						vertical-align: top;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<div class="title" align="center">Заявление об уплате акциза по маркированным товарам Таможенного союза, ввозимым на территорию Российской Федерации<br/>с территории государства - члена Таможенного союза</div>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="50%" class="title">РАЗДЕЛ 1</td>
								<td width="50%" align="right">
									<xsl:text>Страница </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></div>
									<xsl:text> из </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></div>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="50%" valign="top">
									<table>
										<tbody>
											<tr>
												<td colspan="10">Дата заполнения заявления и его номер</td>
											</tr>
											<tr align="center">
												<td width="1%">№</td>
												<td width="20%" style="border-bottom:1px solid black;">
													<xsl:apply-templates select="epa:AppExcisePaymentDocument/cat_ru:PrDocumentNumber"/>
												</td>
												<td width="3%"></td>
												<td width="20%" style="border-bottom:1px solid black;">
													<xsl:value-of select="substring(epa:AppExcisePaymentDocument/cat_ru:PrDocumentDate, 9, 2)"/>
												</td>
												<td width="3%"></td>
												<td width="20%" style="border-bottom:1px solid black;">
													<xsl:value-of select="substring(epa:AppExcisePaymentDocument/cat_ru:PrDocumentDate, 6, 2)"/>
												</td>
												<td width="3%"></td>
												<td>20</td>
												<td  width="20%" style="border-bottom:1px solid black;">
													<xsl:value-of select="substring(epa:AppExcisePaymentDocument/cat_ru:PrDocumentDate, 3, 2)"/>
												</td>
												<td>г.</td>
											</tr>
											<tr align="center">
												<td></td>
												<td class="descr">(номер заявления)</td>
												<td></td>
												<td class="descr">(число)</td>
												<td></td>
												<td class="descr">(месяц)</td>
												<td></td>
												<td></td>
												<td class="descr">(год)</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="50%"></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top">
								<td width="49%"> <!-- продавец -->
									<table>
										<tbody>
											<tr>
												<td width="30%" class="title">
													Продавец
												</td>
												<td width="70%" style="border: 1px solid black;">
													<xsl:for-each select="epa:Supplier/cat_ru:RBOrganizationFeatures">
														<xsl:apply-templates select="cat_ru:UNP"/>
													</xsl:for-each>
													<xsl:for-each select="epa:Supplier/cat_ru:RFOrganizationFeatures">
														<xsl:apply-templates select="cat_ru:INN"/>
														<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
														<xsl:apply-templates select="cat_ru:KPP"/>
													</xsl:for-each>
													<xsl:for-each select="epa:Supplier/cat_ru:RKOrganizationFeatures">
														<xsl:apply-templates select="cat_ru:ITN/cat_ru:RNN"/>
														<xsl:text>/</xsl:text>
														<xsl:apply-templates select="cat_ru:BIN"/>
														<xsl:text>/</xsl:text>
														<xsl:apply-templates select="cat_ru:IIN"/>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td></td>
												<td>УНП или ИНН/КПП или РНН/(БИН/ИИН)</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr valign="top">
												<td width="1%" class="title">01</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Supplier" mode="orgName"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(наименование организации, Ф.И.О. индивидуального предпринимателя)
												</td>
											</tr>
											<tr valign="top">
												<td width="1%" class="title">03</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Supplier" mode="address"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(код страны, место нахождения (жительства))
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="2%"/>
								<td width="49%"> <!-- покупатель -->
									<table>
										<tbody>
											<tr>
												<td width="30%" class="title">
													Покупатель
												</td>
												<td width="70%" style="border: 1px solid black;">
													<xsl:for-each select="epa:Supplier/cat_ru:RFOrganizationFeatures">
														<xsl:apply-templates select="cat_ru:INN"/>
														<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
														<xsl:apply-templates select="cat_ru:KPP"/>
														<xsl:if test="cat_ru:OGRN">, </xsl:if>
														<xsl:apply-templates select="cat_ru:OGRN"/>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td></td>
												<td>ИНН/КПП, ОКПО</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr valign="top">
												<td width="1%" class="title">02</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Buyer" mode="orgName"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(наименование организации, Ф.И.О. индивидуального предпринимателя)
												</td>
											</tr>
											<tr valign="top">
												<td width="1%" class="title">04</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Buyer" mode="address"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(код страны, место нахождения (жительства))
												</td>
											</tr>
											<tr valign="top">
												<td width="1%" class="title">05</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Buyer/epa:BankAccInfo"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(банковские реквизиты)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table>
										<tbody>
											<tr>
												<td class="title">06</td>
												<td>
													<xsl:text> Номер договора (контракта) </xsl:text>
													<div style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
														<xsl:apply-templates select="epa:ContractDocument/cat_ru:PrDocumentNumber"/>
													</div>
													<xsl:text> Дата договора (контракта) </xsl:text>
													<div style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
														<xsl:apply-templates select="epa:ContractDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
													</div>
													<xsl:text> г.</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table>
										<tbody>
											<tr valign="top">
												<td class="title">07</td>
												<td>
													<xsl:text>Производитель товара: </xsl:text>
													<table>
														<tbody>
															<tr>
																<td style="border-bottom: 1px solid black;">
																	<xsl:for-each select="epa:Producer">
																		<xsl:apply-templates select="epa:CountryCode"/>
																		<xsl:text> </xsl:text>
																		<xsl:apply-templates select="epa:ProducerName"/>
																		<xsl:text> </xsl:text>
																		<xsl:if test="epa:Address">
																			<xsl:text> Адрес: </xsl:text>
																			<xsl:apply-templates select="." mode="address"/>
																		</xsl:if>
																	</xsl:for-each>
																</td>
															</tr>
															<tr>
																<td class="descr">
																	(код страны происхождения товара, наименование производителя, его местонахождение (адрес))
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table>
										<tbody>
											<tr>
												<td class="title">08</td>
												<td>
													<xsl:text> Номер заявления о выдаче (приобретении) акцизных марок </xsl:text>
													<div style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
														<xsl:apply-templates select="epa:AppBuyExciseStampsDocument/cat_ru:PrDocumentNumber"/>
													</div>
													<!--xsl:text> / </xsl:text>
													<div style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													</div>
													<xsl:text> / </xsl:text>
													<div style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													</div-->
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п</td>
								<td class="bordered" rowspan="2">Наименование товара</td>
								<td class="bordered" rowspan="2">Код товара ТН ВЭД ТС</td>
								<td class="bordered" rowspan="2">Количе-ство товара в нату-ральном выражении</td>
								<td class="bordered" rowspan="2">Количество товара в единицах, используе-мых для расчета акциза</td>
								<td class="bordered" rowspan="2">Единица измерения количества товара для целей применения ставки акциза</td>
								<td class="bordered" colspan="2">Стоимость товара</td>
								<td class="bordered" colspan="2">Валюта</td>
								<td class="bordered" rowspan="2">Серии и номера акцизных марок</td>
								<td class="bordered" colspan="2">Транспортный (товаросопрово-дительный) документ</td>
								<td class="bordered" colspan="2">Счет-фактура</td>
								<td class="bordered" rowspan="2">Дата принятия товара на учет</td>
								<td class="bordered" rowspan="2">Налого-вая база</td>
								<td class="bordered" rowspan="2">Ставка акциза</td>
								<td class="bordered" rowspan="2">Сумма акциза к уплате</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">в рублях</td>
								<td class="bordered">в валюте договора</td>
								<td class="bordered">код</td>
								<td class="bordered">курс</td>
								<td class="bordered">серия, номер</td>
								<td class="bordered">дата</td>
								<td class="bordered">номер</td>
								<td class="bordered">дата</td>
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
							</tr>
							<xsl:for-each select="epa:GoodsInfo">
								<tr valign="top">
									<td class="bordered">1
										<xsl:apply-templates select="RUScat_ru:GoodsNumeric"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="RUScat_ru:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="RUScat_ru:GoodsTNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="RUScat_ru:GoodsMeasureDetails[1]/cat_ru:GoodsQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="RUScat_ru:GoodsMeasureDetails[2]/cat_ru:GoodsQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="RUScat_ru:GoodsMeasureDetails[2]/cat_ru:MeasureUnitQualifierName"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoicedCost"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoicedCostCur"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:CurCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:CurRate"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="epa:IssueStampInfo">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="epa:ExciseSeries"/>
											<xsl:if test="epa:ExciseStartRange">
												<xsl:text> № </xsl:text>
												<xsl:apply-templates select="epa:ExciseStartRange"/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:TransDocument/cat_ru:PrDocumentNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:TransDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoiceDocument/cat_ru:PrDocumentNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoiceDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:GoodsAccDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:TaxBase"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:ExciseRate"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:ExciseSum"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="title" colspan="6">Достоверность и полноту сведений, приведенных в данном заявлении, подтверждаем:</td>
							</tr>
							<tr align="center">
								<td width="40%" style="border-bottom:1px solid black;">
									<xsl:for-each select="epa:DirSignature">
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
									</xsl:for-each>
								</td>
								<td width="5%"/>
								<td width="15%" style="border-bottom:1px solid black;"><br/></td>
								<td width="5%"/>
								<td width="15%" style="border-bottom:1px solid black;">
									<xsl:apply-templates select="epa:DirSignature/cat_ru:IssueDate" mode="russian_date"/>
								</td>
								<td width="10" class="title" align="center" valign="middle" rowspan="4">М.П.</td>
							</tr>
							<tr>
								<td class="descr">(Ф.И.О. руководителя организации (уполномоченного лица) - покупателя (индивидуального предпринимателя - покупателя))</td>
								<td/>
								<td class="descr">(подпись)</td>
								<td/>
								<td class="descr">(дата)</td>
							</tr>
							<tr align="center">
								<td style="border-bottom:1px solid black;">
									<xsl:for-each select="epa:MainAcnSignature">
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
									</xsl:for-each>
								</td>
								<td/>
								<td style="border-bottom:1px solid black;"><br/></td>
								<td/>
								<td style="border-bottom:1px solid black;">
									<xsl:apply-templates select="epa:MainAcnSignature/cat_ru:IssueDate" mode="russian_date"/>
								</td>
							</tr>
							<tr>
								<td class="descr">(Ф.И.О. главного бухгалтера)</td>
								<td/>
								<td class="descr">(подпись)</td>
								<td/>
								<td class="descr">(дата)</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td width="50%" class="title">РАЗДЕЛ 2</td>
								<td width="50%" align="right">
									<xsl:text>Страница </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></div>
									<xsl:text> из </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></div>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr valign="top">
								<td class="bordered" width="50%">
									<xsl:text>Отметка о регистрации заявления при предоставлении в таможенный орган</xsl:text>
									<br/>
									<br/>
									<xsl:text>Регистрационный номер заявления </xsl:text>
									<div style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
										<xsl:apply-templates select="epa:AppExcisePaymentDocReg/cat_ru:PrDocumentNumber"/>
									</div>
								</td>
								<td class="bordered" width="50%">
									<xsl:text>Отметка таможенного органа об уплате акциза</xsl:text>
									<br/>
									<br/>
									
									<xsl:variable name="splittedSum">
										<xsl:value-of select="translate(sum(epa:GoodsInfo/epa:ExciseSum),'.',',')"/>
									</xsl:variable>
									
									<xsl:text>Акцизы в сумме </xsl:text>
									<div style="display:inline-block;width: 50mm; height:4mm; border-bottom: 1px solid black;">
										<xsl:value-of select="substring-before($splittedSum, ',')"/>
									</div>
									<xsl:text> рублей </xsl:text>
									<div style="display:inline-block;width: 10mm; height:4mm; border-bottom: 1px solid black;">
										<xsl:value-of select="substring-after($splittedSum, ',')"/>
									</div>
									<xsl:text> копеек</xsl:text>
									<table>
										<tbody>
											<tr>
												<td width="90%" style="border-bottom: 1px solid black;">
													
													<xsl:variable name="integerPart">
														<xsl:choose>
															<xsl:when test="substring-before($splittedSum,',')!=''">
																<xsl:value-of select="substring-before($splittedSum,',')"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="$splittedSum"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:variable>
													<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
													<xsl:choose>
														<xsl:when test="$integerPart!='0'">
															<xsl:call-template name="RecurseSumWords">
																<xsl:with-param name="Value" select="$integerPart"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>0</xsl:otherwise>
													</xsl:choose>
													<xsl:text> руб. </xsl:text>
													<xsl:if test="$fractionalPart!=''">
														<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
														<xsl:text> коп.</xsl:text>
													</xsl:if>
												</td>
												<td> уплачены</td>
											</tr>
											<tr>
												<td class="descr">(указывается уплаченная сумма акциза прописью)</td>
												<td></td>
											</tr>
										</tbody>
									</table>
									<br/>
									<xsl:text>Платежный документ </xsl:text>
									<div style="display:inline-block;width: 30mm; height:4mm; border-bottom: 1px solid black;"></div>
									<xsl:text> от </xsl:text>
									<div style="display:inline-block;width: 30mm; height:4mm; border-bottom: 1px solid black;"></div>
									<br/>
									<br/>
									<table>
										<tbody>
											<tr>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
											</tr>
											<tr>
												<td class="descr">
													<xsl:text>(Ф.И.О. инспектора)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text> (подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(дата)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
									<table>
										<tbody>
											<tr>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
											</tr>
											<tr>
												<td class="descr">
													<xsl:text>(начальник (заместитель начальника) таможенного органа)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text> (подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(дата)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="epa:BankAccInfo">
		<xsl:apply-templates select="cat_ru:BankName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:BankAccount">
			<xsl:text>Номер счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccount">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankAccountDescription">
			<xsl:text> Описание: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccountDescription">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<xsl:text> БИК </xsl:text>
			<xsl:apply-templates select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<xsl:text> SWIFT </xsl:text>
			<xsl:apply-templates select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<xsl:text> Корр.счет </xsl:text>
			<xsl:apply-templates select="cat_ru:CorrAccount"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:for-each select="*[local-name() = 'Address']/*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="orgName">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
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
	<xsl:template match="//*[local-name()='ExcisePaymentApplication']//*" priority="-1">
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
