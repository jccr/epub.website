<%!
    id_ = "toc"
    key_ = "toc"
    tag_ = "nav"
%>
<%inherit file="components/popup_menu.mako" />
<style>

    .epw-popup-menu-toc .epw-popup-menu-content ol {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .epw-popup-menu-toc .epw-popup-menu-content ol li a {
        padding: 1em;
        display: block;
        box-sizing: border-box;
        border-bottom: 1px solid #ccc;
        width: 100%;
    }

    .epw-popup-menu-toc .epw-popup-menu-content ol > li > ol > li > a {
        padding-left: 2em;
     }

    .epw-popup-menu-toc .epw-popup-menu-content ol > li > ol > li > ol > li > a {
        padding-left: 3em;
     }

    .epw-popup-menu-toc .epw-popup-menu-content ol > li > ol > li > ol > li > ol > li a {
        padding-left: 4em;
     }

     .epw-popup-menu-toc a {
        color: hsl(0deg 0% 40%);
     }

</style>
% if toc:
    <% 
        html = toc["html"]
        href = toc["href"]
    %>
    <h3 style="padding-left: 1em; border-bottom: 2px solid #ccc; margin-bottom: 0; padding-bottom: 1em;">
        <a href="${href}">
            Table of Contents<span class="material-symbols-sharp epw-link-hint">open_in_new</span>
        </a>
    </h3>
    ${html}
% endif
