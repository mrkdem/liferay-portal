<%
/**
 * Copyright (c) 2000-2007 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%
String redirect = ParamUtil.getString(request, "redirect");
if (Validator.isNull(redirect)) {
	redirect = currentURL;
}

if (Validator.isNull(tabs2)) {
	tabs2 = "portlets";
}

PortletURL installPluginsURL = renderResponse.createRenderURL();

installPluginsURL.setWindowState(WindowState.MAXIMIZED);

installPluginsURL.setParameter("struts_action", "/admin/plugin_installer");
installPluginsURL.setParameter("referer", currentURL);
installPluginsURL.setParameter("tabs1", tabs1);
installPluginsURL.setParameter("tabs2", tabs2);

%>

<liferay-ui:tabs
	names="portlets,themes,layout-templates"
	param="tabs2"
	url="<%= portletURL.toString() %>"
/>

<c:choose>
	<c:when test='<%= tabs2.equals("themes")%>'>
		<%@ include file="/html/portlet/admin/themes.jsp" %>
	</c:when>
	<c:when test='<%= tabs2.equals("layout-templates")%>'>
		<%@ include file="/html/portlet/admin/layout_templates.jsp" %>
	</c:when>
	<c:otherwise>
		<%@ include file="/html/portlet/admin/portlets.jsp" %>
	</c:otherwise>
</c:choose>