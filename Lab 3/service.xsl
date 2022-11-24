<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/service">

    <html>
        <body style="font-family: helvetica;">
            <h2>BWASS - Service Center</h2>
            
            <table border="1">
                <tr>
                    <th>Vehicle Type</th>
                    <th>Brand</th>
                    <th>Model</th>
                    <th>Year</th>
                    <th>Registration No.</th>
                    <th>Service Type</th>
                    <th>Service Price</th>
                </tr>

                <xsl:for-each select="vehicle">
                    <xsl:sort select="reg_no" />
                    <tr>
                        <td>
                            <xsl:apply-templates select="v_type"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="brand"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="model"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="year"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="reg_no"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="service_type"/>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="v_type = Two-Wheeler">
                                    <xsl:when test="service_type = General Service">
                                        Rs.1500
                                    </xsl:when>
                                    <xsl:if test="service_type = Oil Leak">
                                        Rs.500
                                    </xsl:if>
                                    <xsl:when test="service_type = Tyre Replacement">
                                        Rs.1000
                                    </xsl:when>
                                </xsl:when>
                                <xsl:when test="v_type = Four-Wheeler">
                                    <xsl:when test="service_type = General Service">
                                        Rs.3000
                                    </xsl:when>
                                    <xsl:if test="service_type = Seats Repair">
                                        Rs.6000
                                    </xsl:if>
                                    <xsl:when test="service_type = Repainting">
                                        Rs.10000
                                    </xsl:when>
                                </xsl:when>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>

    </xsl:template>
</xsl:stylesheet>
