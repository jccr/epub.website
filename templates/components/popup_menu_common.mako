<style>
    .epw-popup-menu {
        visibility: hidden;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        position: fixed;
        left: max(0px, calc(50vw - 21em));
        top: 0;
        bottom: 0;
        z-index: 2;
        width: 20em;
        max-width: 100vw;
        color: hsl(0deg 0% 40%);
        pointer-events: none;
    }

    .epw-popup-menu>* {
        pointer-events: auto;
    }

    .epw-popup-menu .epw-popup-menu-content {
        overflow: auto;
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
        box-sizing: border-box;

        background: #f2f2f2;
        box-shadow: 0 0.2em 1em rgba(0, 0, 0, 0.2);
        clip-path: inset(0px -1em 0px -1em);

        /* overscroll-behavior: contain; */
    }

    .epw-popup-menu .epw-popup-menu-close {
        min-height: 2.875em;
        background: #f2f2f2;
    }

    .epw-popup-menu:target {
        visibility: visible;
    }

    .epw-popup-menu a {
        color: hsl(0deg 0% 50%);
        text-decoration: none;
    }

    .epw-popup-menu a:hover {
        color: hsl(0deg 0% 20%);
        text-decoration: underline;
    }

    .epw-popup-menu a:active {
        color: hsl(0deg 0% 20%);
    }
</style>
