<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="node_modules/grunt-jquery-content/tasks/jquery-xml/entries2html-base.xsl"/>
<xsl:variable name="method-prefix-dot" select="false()"/>

<xsl:template name="example-code">
&lt;!doctype html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="utf-8"&gt;
&lt;title&gt;<xsl:value-of select="desc"/>&lt;/title&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;https://jqueryvalidation.org/files/demo/site-demos.css&quot;&gt;
<xsl:if test="css">&lt;style&gt;<xsl:copy-of select="css/text()"/>  &lt;/style&gt;</xsl:if>
&lt;/head&gt;
&lt;body&gt;
&lt;form id=&quot;myform&quot;&gt;<xsl:copy-of select="html/text()"/>&lt;/form&gt;
&lt;script src="https://code.jquery.com/jquery-1.11.1.min.js"&gt;&lt;/script&gt;
&lt;script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"&gt;&lt;/script&gt;
&lt;script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
// just for the demos, avoids form submit
jQuery.validator.setDefaults({
	debug: true,
	success: &quot;valid&quot;
});<xsl:copy-of select="code/text()"/>&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</xsl:template>

</xsl:stylesheet>
