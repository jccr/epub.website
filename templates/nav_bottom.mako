<style>
    :root {
        --nav-bottom-height: 6em;
    }

    body {
        min-height: calc(100vh - var(--nav-bottom-height));
        box-shadow: 0 0.2em 1em rgba(0, 0, 0, 0.2);
    }

    .epw-nav-bottom-button {
        appearance: none;
        border: none;

        display: flex;
        flex-direction: column;
        gap: 1em;
        font-weight: 500;
        color: hsl(0deg 0% 40%);
        background-color: hsl(0deg 0% 80%);

        justify-content: center;

        padding: 0 1em;
    }

    .epw-nav-action-next {
        align-items: flex-end;
        padding-right: max(1em, calc(50vw - 20em));
    }

    .epw-nav-action-prev {
        align-items: flex-start;
        padding-left: max(1em, calc(50vw - 20em));
    }


    .epw-nav-bottom-button:hover {
        color: hsl(0deg 0% 20%);
        background-color: hsl(0deg 0% 100%);
    }

    .epw-nav-bottom-button:active {
        color: hsl(0deg 0% 20%);
        background-color: hsl(0deg 0% 85%);
    }

    #epw-nav-bottom {
        display: flex;
        position: sticky;
        box-sizing: border-box;
        bottom: 0px;
        left: 0px;
        right: 0px;
        z-index: 0;
        height: var(--nav-bottom-height);
        background-color: hsl(0deg 0% 80%);
        border-top: 2px solid hsl(0deg 0% 90%);

        will-change: transform;
        transition: transform 200ms linear;

        justify-content: space-between;
    }

    #epw-nav-bottom > * {
        flex: 1;
        min-width: 0;
    }

    #epw-nav-bottom a {
        color: hsl(0deg 0% 40%);
        text-decoration: none;
    }

    #epw-nav-bottom a:hover {
        color: hsl(0deg 0% 20%);
    }

    #epw-nav-bottom a:active {
        color: hsl(0deg 0% 20%);
    }

    .epw-nav-bottom-button--label {
        display: flex;
        align-items: center;
        text-transform: uppercase;
        font-weight: 300;
        text-decoration: none !important;
        font-size: 0.8em;
    }
    .epw-nav-bottom-button--title {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 100%;
    }

    #epw-nav-bottom a:hover .epw-nav-bottom-button--title {
        text-decoration: underline;
    }
</style>
<nav id="epw-nav-bottom">
    % if not links["prev"] and not links["next"]:
        <a class="epw-ui epw-nav-bottom-button epw-nav-action-prev" id="epw-nav-action-back" href="../">
            <span class="epw-nav-bottom-button--label">
                <span class="material-symbols-sharp" style="margin-left: -0.3em">
                    chevron_left
                </span>
                Previous
            </span>
            <span class="epw-nav-bottom-button--title">
                Go Back
            </span>
        </a>
    % endif
    % if links["prev"]:
        <% 
            href = links["prev"]["href"]
            title = links["prev"]["title"] 
        %>
        <a class="epw-ui epw-nav-bottom-button epw-nav-action-prev" href="${href}">
            <span class="epw-nav-bottom-button--label">
                <span class="material-symbols-sharp" style="margin-left: -0.3em">
                    chevron_left
                </span>
                Previous
            </span>
            <span class="epw-nav-bottom-button--title">
                ${title}
            </span>
        </a>
    % else:
        <div class="epw-nav-action-prev"></div>
    % endif
    % if links["next"]:
        <% 
            href = links["next"]["href"]
            title = links["next"]["title"] 
        %>
        <a class="epw-ui epw-nav-bottom-button epw-nav-action-next" href="${href}">
            <span class="epw-nav-bottom-button--label">
                Next
                <span class="material-symbols-sharp" style="margin-right: -0.3em">
                    chevron_right
                </span>
            </span>
            <span class="epw-nav-bottom-button--title">
                ${title}
            </span>
        </a>
    % else:
        <div class="epw-nav-action-next"></div>
    % endif
</nav>
<script defer="">
//<![CDATA[
    const backButton = document.getElementById("epw-nav-action-back");
    backButton.setAttribute('href', document.referrer);
    backButton.addEventListener("click", function(e) {
        e.preventDefault();
        history.back();
    });
//]]>
</script>
