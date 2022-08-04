<%!
   def async_stylesheet(url):
    return f'<link rel="preload" href="{url}" as="style" onload="this.onload=null;this.rel=\'stylesheet\'"/>\
<noscript><link rel="stylesheet" href="{url}"/></noscript>'
%>
## disable javascript on page
## <meta http-equiv="Content-Security-Policy" content="script-src"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
% if links["current"]:
    <% 
        href = links["current"]["href"]
        title = links["current"]["title"] 
    %>
    <link rel="canonical" href="${href}" title="${title}"/>
% endif
% if links["next"]:
    <% 
        href = links["next"]["href"]
        title = links["next"]["title"] 
    %>
    <link rel="prefetch" href="${href}"/>
    <link rel="next" href="${href}" title="${title}"/>
% endif
% if links["prev"]:
    <% 
        href = links["prev"]["href"]
        title = links["prev"]["title"] 
    %>
    <link rel="prev" href="${href}" title="${title}"/>
% endif

${async_stylesheet("https://fonts.googleapis.com/css2?family=Literata:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap")}
${async_stylesheet("https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@24,300,0,0")}

${async_stylesheet("https://cdn.jsdelivr.net/npm/@xz/fonts@1/serve/source-code-pro.min.css")}

<style>
    :root {
       --scroll-top-height: 3rem; 
    }

    html, body {
        margin: 0;
        padding: 0;
        scroll-padding-top: var(--scroll-top-height);
        scroll-behavior: smooth;
    }

    html {
        background-color: hsl(0deg 0% 90%);
    }

    body {
        margin-top: var(--scroll-top-height);
        background-color: #fff;
        position: relative;
        z-index: 1;
        box-sizing: border-box;

        padding-top: 1rem;
        padding-right: max(1rem, calc(50vw - 20rem));
        padding-left: max(1rem, calc(50vw - 20rem));
        padding-bottom: 1rem;

        font-family: Literata, Athelas, Constantia, Georgia, serif;
        /* font-family: Seravek, Calibri, Roboto, Arial, sans-serif; */

        overflow-wrap: anywhere;
    }

    pre, code {
        font-family: "Source Code Pro", "Andale Mono", Consolas, monospace;
    }

    .epw-ui {
        font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantrell, "Helvetica Neue", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    }

    .epw-link-hint {
        line-height: 0;
        font-size: 100%;
        position: relative;
        top: 0.175em;
        left: 0.15em;
        opacity: 0.5;
     }
</style>
<script src="https://cdn.jsdelivr.net/npm/headroom.js@0.12.0/dist/headroom.min.js" defer=""/>
<%include file="components/popup_menu_common.mako" />
