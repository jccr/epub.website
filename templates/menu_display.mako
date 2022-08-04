<%!
    id_ = "display-menu"
    key_ = "display"
    tag_ = "div"
%>
<%inherit file="components/popup_menu.mako" />
<style>
    .epw-popup-menu-display {
        left: auto;
        right: max(0px, calc(50vw - 21em));
    }

    .epw-popup-menu-display .epw-popup-menu-close {
        position: relative;
        left: 13.34em;
    }

    .epw-popup-menu-display .epw-popup-menu-content {
        height: auto;
        clip-path: inset(0px -1em -1em -1em);
        padding: 0 1em 1em 1em;
    }

    .epw-popup-menu-display button {
        appearance: none;
        border: 2px solid hsl(0deg 0% 80%);
    }

    .epw-popup-menu-display section {
        display: flex;
        flex-direction: row;
        gap: 0.5em;
    }

    .epw-font-size-button {
        height: 3em;
        width: 3.5em;
        box-sizing: border-box;
    }
</style>
<h3>Font size</h3>
<section>
    <button class="epw-font-size-button epw-font-size-minus">
        <span class="material-symbols-sharp">
            text_decrease
        </span>
    </button>
    <button class="epw-font-size-button epw-font-size-default">
        <span class="material-symbols-sharp">
            text_format
        </span>
    </button>

    <button class="epw-font-size-button epw-font-size-plus">
        <span class="material-symbols-sharp">
            text_increase
        </span>
    </button>
</section>
