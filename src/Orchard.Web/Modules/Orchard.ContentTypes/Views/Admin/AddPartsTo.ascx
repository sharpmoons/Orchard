<%@ Control Language="C#" Inherits="Orchard.Mvc.ViewUserControl<Orchard.ContentTypes.ViewModels.AddPartsViewModel>" %>
<%
Html.RegisterStyle("admin.css"); %>
<h1><%:Html.TitleForPage(T("Add parts to \"{0}\"", Model.Type.DisplayName).ToString())%></h1><%
using (Html.BeginFormAntiForgeryPost()) { %>
    <%:Html.ValidationSummary() %>
    <fieldset>
        <%:Html.UnorderedList(
            Model.PartSelections,
            (partSelection, i) => {
                var fieldNameStart = "PartSelections[" + i + "].";
                return MvcHtmlString.Create(
                    string.Format(
                        "{0} <label for=\"{1}\" class=\"forcheckbox\">{2}</label>{3}",
                        Html.CheckBox(fieldNameStart + "IsSelected"),
                        ViewData.TemplateInfo.GetFullHtmlFieldId(fieldNameStart + "IsSelected"),
                        partSelection.PartDisplayName,
                        Html.Hidden(fieldNameStart + "PartName", partSelection.PartName)));
            },
            "available-parts")%>
    </fieldset>
    <fieldset>
        <button class="primaryAction" type="submit"><%:T("Save") %></button>
    </fieldset><%
} %>
