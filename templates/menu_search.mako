<%!
    id_ = "search"
    key_ = "search"
    tag_ = "div"
%>
<%inherit file="components/popup_menu.mako" />
<style>
    .epw-popup-menu-search {
        left: auto;
        right: max(0px, calc(50vw - 21em));
    }

    .epw-popup-menu-search .epw-popup-menu-close {
        position: relative;
        left: 16.5em;
    }

    .epw-popup-menu-search .epw-popup-menu-content {
        height: auto;
        clip-path: inset(0px -1em -1em -1em);
        padding: 0 1em 1em 1em;
    }

    .epw-popup-menu-search button {
        appearance: none;
        border: 2px solid hsl(0deg 0% 80%);
    }

    .epw-popup-menu-search section {
        display: flex;
        flex-direction: row;
        gap: 0.5em;
    }

    .epw-search-button {
        height: 3em;
        min-width: 3.5em;
        box-sizing: border-box;
        line-height: 0;
        flex: 1;
        cursor: pointer;
    }

    .epw-search-button:hover {
        background-color: hsl(0deg 0% 98%);
        color: hsl(0deg 0% 0%);
    }

    .epw-search-button:active {
        background-color: hsl(0deg 0% 85%);
        color: hsl(0deg 0% 0%);
    }

    #epw-search-input {
        flex: 6;
        border: 2px solid hsl(0deg 0% 80%);
        padding: 0.5em;
        color: hsl(0deg 0% 20%);
        background-color: hsl(0deg 0% 100%);
    }
</style>
<h3>Search</h3>
<section>
    <input type="search" class="epw-ui" id="epw-search-input" name="epw-search-input"/>
    <button class="epw-search-button">
        <span class="material-symbols-sharp">
            search
        </span>
    </button>
</section>
